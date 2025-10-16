# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      pcie_sequences.py
#   Author:    HAL-O
#   Created:   10/1/25
#
#!  Description:
#!   Module implements a retry management FIFO. Stores TLPs as axis frames.
#!   Module resets read and write pointer after every frame allowing for retransmission
#!   as long as data is not overwritten.
#
#
#   Project:
#     This file is part of the PCIe Gen1/Gen2 Endpoint Controller project.
#     Developed as an open-source, synthesizable Verilog RTL IP core, this
#     project provides FPGA designers and researchers with an educational
#     and extensible platform for high-speed interconnect design.
#
#   Institutional Acknowledgement:
#    - Project oversight and research guidance provided by the CEAMLS
#      (Center for Equitable AI & Machine Learning Systems) Director.
#
#   Notes:
#     - Compliant with PCIe Base Specification (Gen1: 2.5 GT/s,
#       Gen2: 5.0 GT/s).
# 
#   License: MIT License
# 
# ==========================================================================

from base_uvm import *
from pcie_base import *
from cocotbext.pcie.core import RootComplex, MemoryEndpoint, Device
from cocotbext.pcie.core.utils import PcieId
from cocotbext.pcie.core import *
from cocotbext.pcie.core.dllp import *
from cocotbext.pcie.core.tlp import *
from cocotbext.pcie.core.port import *
import bitstring
import mmap

class pcie_seq_item(uvm_sequence_item):
    def __init__(self, name="pcie_seq_item"):
        super().__init__(name)
        self.frame = AxiStreamFrame()
        self.pkt = None
        self.is_pkt = None
        self.is_tlp = None
        self.is_dllp = None
        self.results = None        

def reverse_bits_in_byte(byte):
    bit_array = bitstring.BitArray(int=byte, length=9)
    bit_array.reverse()
    return bit_array.uint

class pcie_seq(base_sequence):
    
    def __init__(self, name, msix,config=None):
        super().__init__(name)
        self.config = config
        self.log = logging.getLogger("pcie base seq")
        self.log.setLevel(logging.ERROR)
        self.msix = msix
        self.tlp_queue = Queue()
        self.dllp_queue = Queue()
        # self.send_tlp = None
        # self.send_dllp = None


    async def body(self):
        # await super().body()
        # PCIe
        self.rc = RootComplex()
        # print(self.rc)
        self.dev = Device()
        # configure port
        self.dev.upstream_port.max_link_speed = 3
        self.dev.upstream_port.max_link_width = 2
        # self.dev.upstream_port.max_payload_size = 128
        self.dev.upstream_port.port_delay = 8e-9
        self.dev.device_num = 0
        self.dev.function_num = 0

        
        self.rx_queue = Queue()
        
        port = self.rc.make_port()
        print(repr(port))
        port.connect(self.dev)
        # assert 1 == 0
        # self.rc.add_endpoint(self.dev)
        # self.rc._run_routing(self.dev)
        
        self.dev.upstream_port.fc_initialized = True
        self.dev.upstream_port.fc_state[0].reset()
        self.dev.upstream_port.log.setLevel(logging.DEBUG)
        
        self.rc.send = self.send_rc_cpl
        self.dev.upstream_port.ext_recv = self.handle_tx
        # self.dev.upstream_recv = self.upstream_recv
        # self.upstream_port.send(tlp) 
        self.dev.upstream_send = self.send_tlp
        # self.dev.upstream_port.handle_tx = None
        # self.dev.upstream_port._transmit = self.send_tlp
        
        
        
        self.seq_num = 0
        # self.source = source
        self.config = Configuration(
            width=16,
            polynomial=0x1DB7,
            init_value=0xFFFF,
            final_xor_value=0x00000000,
            reverse_input=False,
            reverse_output=True,
        )
        self.calculator = Calculator(self.config)
        
        self.tlp_config = Configuration(
            width=32,
            polynomial=0x04C11DB7,
            init_value=0xFFFFFFFF,
            final_xor_value=0x00000000,
            reverse_input=False,
            reverse_output=True,
        )
        self.tlp_calculator = Calculator(self.tlp_config)
        # coro2Thread = cocotb.start_soon(self.send_dllp())
        coro3Thread = cocotb.start_soon(self.response_tlp())
        cocotb.start_soon(self._run_rx_tlp())
        # cocotb.start_soon(self._run_receive())
        # cocotb.start_soon(self._run_fc_update_idle_timer())
        
        self.dev.log.setLevel(logging.INFO)
        self.rc.log.setLevel(logging.INFO)
        
    
        # self.dev.handle_tx = self.handle_tx

        # user logic
        # self.tx_source = tx_source()
        # self.rx_sink = rx_sink()
        # self.tx_source = PTilePcieSource(PTileTxBus.from_prefix(dut, "tx_st"), dut.coreclkout_hip)
        # self.tx_source.ready_latency = 3
        # self.rx_sink = PTilePcieSink(PTileRxBus.from_prefix(dut, "rx_st"), dut.coreclkout_hip)
        # self.rx_sink.ready_latency = 27

        self.regions = [None]*6
        self.regions[0] = mmap.mmap(-1, 1024*1024)
        self.regions[1] = mmap.mmap(-1, 1024*1024)
        self.regions[3] = mmap.mmap(-1, 1024)
        self.regions[4] = mmap.mmap(-1, 1024*64)

        self.current_tag = 0
        self.tag_count = 256
        self.tag_active = [False]*256
        self.tag_release = Event()

        self.rx_cpl_queues = [Queue() for k in range(256)]
        self.rx_cpl_sync = [Event() for k in range(256)]

        self.dev_bus_num = 0
        self.dev_device_num = 0
        self.dev_max_payload = 0
        self.dev_max_read_req = 0
        self.dev_msi_enable = 0
        self.dev_msi_multi_msg_enable = 0
        self.dev_msi_address = 0
        self.dev_msi_data = 0
        self.dev_msi_mask = 0
        self.dev.msix_enable = 0
        self.dev.msix_function_mask = 0

        self.dev.make_function()
        self.dev.functions[0].configure_bar(0, len(self.regions[0]))
        self.dev.functions[0].configure_bar(1, len(self.regions[1]), True, True)
        self.dev.functions[0].configure_bar(3, len(self.regions[3]), False, False, True)
        self.dev.functions[0].configure_bar(4, len(self.regions[4]))
        # self.dev.make_function()
        
        # self.dev.functions[0].log.setLevel(logging.DEBUG)
        # self.dev.functions[0].upstream_tx_handler = self.send_tlp
        # for f in self.dev.functions:
        #     f.upstream_tx_handler = self.send_tlp
        
        # await self.rc.enumerate()
        

        # dev = self.rc.find_device(self.dev.functions[0].pcie_id)
        # await dev.enable_device()
        
        # pass

    async def response_tlp(self):
        while True:
            seq_item = await self.seqr.response_fifo.get()
            self.log.debug("response tlp: %s",repr(seq_item.pkt))
            # print("response tlp: %s",repr(seq_item.pkt))
            if seq_item.is_pkt and seq_item.pkt:
                # print(type(seq_item.pkt))
                # await self.dev.upstream_port.handle_tx(seq_item.pkt)
                await self.dev.upstream_port._transmit((seq_item.pkt))
                # await self.dev.upstream_port.send(seq_item.pkt)
                # await self.dev.upstream_port.other.ext_recv(seq_item.pkt)
            elif seq_item.pkt:
                # self.dev.upstream_port.rx_queue.put_nowait(Tlp(seq_item.pkt))
                await self.upstream_recv(seq_item.pkt)
                
        
    def tlp2dllp(self,seq_num, data,tlp_calculator):
        test_data = seq_num.to_bytes(2,'big')
        test_data += data
        test_data += tlp_calculator.checksum(test_data).to_bytes(4,'big')
        # seq_num += 1
        return test_data
    
    async def send_rc_cpl(self,pkt):
        if pkt.fmt_type == TlpType.CPL or pkt.fmt_type == TlpType.CPL_DATA :
            await   self.handle_tx(pkt)
        else:
            await self.rc.downstream_send(pkt)
            # await self.rc.downstream_send(pkt)
           
    async def send_tlp(self,tlp):
            # await Timer(20, 'ns')
            # self.log.info("send tlp: %s",tlp)
            seq_item =  pcie_seq_item("pcie_sequence_item")
            await self.start_item(seq_item)
            seq_item.is_tlp = True
            seq_item.frame = AxiStreamFrame(tlp.pack())
            await self.finish_item(seq_item)
            self.result = seq_item.results
    

    
    async def handle_tx(self, pkt):
        # await Timer(max(int(pkt.get_wire_size() * self.symbol_period * self.time_scale), 1), 'step')
        cocotb.start_soon(self._transmit(pkt))
        # await self._transmit(pkt)

    async def _transmit(self, pkt):
        # if self.source is None:
            # raise Exception("Port not connected")
        # await Timer(max(self.link_delay_steps, 10000), 'step')
        # await Timer(2000)
        # self.log.info("dllp transmit %s", repr(pkt))
        if isinstance(pkt,Dllp):
            seq_item = pkt
            seq_item.crc = self.calculator.checksum(
                seq_item.pack()).to_bytes(2, 'big')
            crc_array = bytearray(seq_item.crc)
            # print(crc_array)
            crc_reverse = 0
            for byte in crc_array:
                # print(hex(byte))
                # print(hex((reverse_bits_in_byte(byte)>>1) & 0xff))
                crc_reverse = (crc_reverse <<8) | ((reverse_bits_in_byte(byte)>>1) & 0xff)
            # assert 1 == 0
            data = seq_item.pack()
            
            # print(bin(hex(crc_reverse)))
            # assert 1 == 0
            # print(crc_reverse.to_bytes(2, 'big'))
            data += crc_reverse.to_bytes(2, 'big')
            # print(data)
            # self.calculator.checksum(data).to_bytes(2, 'big')
            frame = AxiStreamFrame(data)
            frame.tuser = 1
            
        elif isinstance(pkt,Tlp):
            seq_item = pkt
            seq_item.crc = self.calculator.checksum(
                seq_item.pack()).to_bytes(2, 'big')
            data = seq_item.pack()
            frame = AxiStreamFrame(self.tlp2dllp(self.seq_num,data,self.tlp_calculator))
            frame.tuser = 2
            self.seq_num += 1
            # frame.normalize()
        # await self.dllp_queue.put(frame)
        seq_item =  pcie_seq_item("pcie_sequence_item")
        await self.start_item(seq_item)
        seq_item.is_dllp = True
        seq_item.frame = frame
        await self.finish_item(seq_item)
        self.result = seq_item.results
        # await self.send_dllp(frame)
    
    async def recv_cpl(self, tag, timeout=0, timeout_unit='ns'):
        queue = self.rx_cpl_queues[tag]
        sync = self.rx_cpl_sync[tag]

        if not queue.empty():
            return queue.get_nowait()

        sync.clear()
        if timeout:
            await First(sync.wait(), Timer(timeout, timeout_unit))
        else:
            await sync.wait()

        if not queue.empty():
            return queue.get_nowait()

        return None


    async def upstream_recv(self, tlp):
        self.log.debug("Got local downstream TLP: %r", tlp)
        
        if tlp.fmt_type in {TlpType.MEM_READ, TlpType.MEM_READ_64, TlpType.MEM_WRITE, TlpType.MEM_WRITE_64}:
            # Memory read/write

            for f in self.dev.functions:
                bar = f.match_bar(tlp.address)
                if bar:
                    await self.rx_queue.put(tlp)
                    return

            if tlp.fmt_type in {TlpType.MEM_WRITE, TlpType.MEM_WRITE_64}:
                self.log.warning("No BAR match: memory write request did not match any BARs: %r", tlp)
                return  # no UR response for write request
            else:
                self.log.warning("No BAR match: memory read request did not match any BARs: %r", tlp)
        elif tlp.fmt_type in {TlpType.IO_READ, TlpType.IO_WRITE}:
            # IO read/write

            for f in self.dev.functions:
                bar = f.match_bar(tlp.address, True)
                if bar:

                    # frame = PTilePcieFrame.from_tlp(tlp)

                    # frame.bar_range = 6
                    # frame.func_num = tlp.requester_id.function

                    await self.rx_queue.put((tlp))

                    # tlp.release_fc()

                    return

            # tlp.release_fc()

            self.log.warning("No BAR match: IO request did not match any BARs: %r", tlp)
        elif tlp.fmt_type in {TlpType.CPL, TlpType.CPL_DATA, TlpType.CPL_LOCKED, TlpType.CPL_LOCKED_DATA}:
            # Completion

            # for f in self.dev.functions:
            #     if f.pcie_id == tlp.requester_id:

                    # frame = PTilePcieFrame.from_tlp(tlp)

                    # frame.func_num = tlp.requester_id.function

                    # check and track buffer occupancy
                    # data_fc = tlp.get_data_credits()

                    # if self.dev.rx_buf_cplh_fc_count+1 <= self.dev.rx_buf_cplh_fc_limit and self.dev.rx_buf_cpld_fc_count+data_fc <= self.dev.rx_buf_cpld_fc_limit:
                    #     self.dev.rx_buf_cplh_fc_count += 1
                    #     self.dev.rx_buf_cpld_fc_count += data_fc
            await self.rx_queue.put((tlp))
                    # else:
                    #     self.log.warning("No space in RX completion buffer, dropping TLP: CPLH %d (limit %d), CPLD %d (limit %d)",
                    #         self.dev.rx_buf_cplh_fc_count, self.dev.rx_buf_cplh_fc_limit, self.dev.rx_buf_cpld_fc_count, self.dev.rx_buf_cpld_fc_limit)

                    # tlp.release_fc()

            return

            # tlp.release_fc()

            self.log.warning("Unexpected completion: failed to route completion to function: %r", tlp)
            return  # no UR response for completion

        else:
            # self.log.info("sending to device",repr(tlp))
            await self.dev.upstream_recv(tlp)
        # if tlp.fmt_type in {TlpType.CFG_READ_0, TlpType.CFG_WRITE_0}:
        #     # config type 0

        #     # capture address information
        #     self.dev.bus_num = tlp.completer_id.bus

        #     # pass TLP to function
        #     for f in self.dev.functions:
        #         if f.pcie_id == tlp.completer_id:
        #             await f.upstream_recv(tlp)
        #             return

        #     tlp.release_fc()

        #     self.log.warning("Function not found: failed to route config type 0 TLP: %r", tlp)
        # elif tlp.fmt_type in {TlpType.CFG_READ_1, TlpType.CFG_WRITE_1}:
        #     # config type 1

        #     tlp.release_fc()

        #     self.log.warning("Malformed TLP: endpoint received config type 1 TLP: %r", tlp)
        # elif tlp.fmt_type in {TlpType.CPL, TlpType.CPL_DATA, TlpType.CPL_LOCKED, TlpType.CPL_LOCKED_DATA}:
        #     # Completion

        #     for f in self.dev.functions:
        #         if f.pcie_id == tlp.requester_id:

        #             # frame = PTilePcieFrame.from_tlp(tlp)

        #             # frame.func_num = tlp.requester_id.function

        #             # check and track buffer occupancy
        #             data_fc = tlp.get_data_credits()

        #             if self.dev.rx_buf_cplh_fc_count+1 <= self.dev.rx_buf_cplh_fc_limit and self.dev.rx_buf_cpld_fc_count+data_fc <= self.dev.rx_buf_cpld_fc_limit:
        #                 self.dev.rx_buf_cplh_fc_count += 1
        #                 self.dev.rx_buf_cpld_fc_count += data_fc
        #                 await self.rx_queue.put((tlp))
        #             else:
        #                 self.log.warning("No space in RX completion buffer, dropping TLP: CPLH %d (limit %d), CPLD %d (limit %d)",
        #                     self.dev.rx_buf_cplh_fc_count, self.dev.rx_buf_cplh_fc_limit, self.dev.rx_buf_cpld_fc_count, self.dev.rx_buf_cpld_fc_limit)

        #             tlp.release_fc()

        #             return

        #     tlp.release_fc()

        #     self.log.warning("Unexpected completion: failed to route completion to function: %r", tlp)
        #     return  # no UR response for completion
        # elif tlp.fmt_type in {TlpType.IO_READ, TlpType.IO_WRITE}:
        #     # IO read/write

        #     for f in self.dev.functions:
        #         bar = f.match_bar(tlp.address, True)
        #         if bar:

        #             # frame = PTilePcieFrame.from_tlp(tlp)

        #             # frame.bar_range = 6
        #             # frame.func_num = tlp.requester_id.function

        #             await self.rx_queue.put((tlp))

        #             tlp.release_fc()

        #             return

        #     tlp.release_fc()

        #     self.log.warning("No BAR match: IO request did not match any BARs: %r", tlp)
        # elif tlp.fmt_type in {TlpType.MEM_READ, TlpType.MEM_READ_64, TlpType.MEM_WRITE, TlpType.MEM_WRITE_64}:
        #     # Memory read/write

        #     for f in self.dev.functions:
        #         bar = f.match_bar(tlp.address)
        #         if bar:

        #             # frame = PTilePcieFrame.from_tlp(tlp)

        #             # frame.bar_range = bar[0]
        #             # frame.func_num = tlp.requester_id.function

        #             await self.rx_queue.put((tlp))

        #             tlp.release_fc()

        #             return

        #     tlp.release_fc()

        #     if tlp.fmt_type in {TlpType.MEM_WRITE, TlpType.MEM_WRITE_64}:
        #         self.log.warning("No BAR match: memory write request did not match any BARs: %r", tlp)
        #         return  # no UR response for write request
        #     else:
        #         self.log.warning("No BAR match: memory read request did not match any BARs: %r", tlp)
        # else:
        #     raise Exception("TODO")

        # # Unsupported request
        # cpl = Tlp.create_ur_completion_for_tlp(tlp, PcieId(self.dev.bus_num, 0, 0))
        # self.log.debug("UR Completion: %r", cpl)
        # await self.send_tlp(cpl)
        
    async def alloc_tag(self):
        tag_count = min(256 if self.dev.functions[0].pcie_cap.extended_tag_field_enable else 32, self.tag_count)

        while True:
            tag = self.current_tag
            for k in range(tag_count):
                tag = (tag + 1) % tag_count
                if not self.tag_active[tag]:
                    self.tag_active[tag] = True
                    self.current_tag = tag
                    return tag

            self.tag_release.clear()
            await self.tag_release.wait()

    def release_tag(self, tag):
        assert self.tag_active[tag]
        self.tag_active[tag] = False
        self.tag_release.set()

    async def perform_posted_operation(self, req):
        await self.send_tlp(req)

    async def perform_nonposted_operation(self, req, timeout=0, timeout_unit='ns'):
        completions = []

        req.tag = await self.alloc_tag()

        await self.send_tlp(req)

        while True:
            cpl = await self.recv_cpl(req.tag, timeout, timeout_unit)

            if not cpl:
                break

            completions.append(cpl)

            if cpl.status != CplStatus.SC:
                # bad status
                break
            elif req.fmt_type in {TlpType.MEM_READ, TlpType.MEM_READ_64}:
                # completion for memory read request

                # request completed
                if cpl.byte_count <= cpl.length*4 - (cpl.lower_address & 0x3):
                    break

                # completion for read request has SC status but no data
                if cpl.fmt_type in {TlpType.CPL, TlpType.CPL_LOCKED}:
                    break

            else:
                # completion for other request
                break

        self.release_tag(req.tag)

        return completions

    async def dma_io_write(self, addr, data, timeout=0, timeout_unit='ns'):
        n = 0

        zero_len = len(data) == 0
        if zero_len:
            data = b'\x00'

        op_list = []

        while n < len(data):
            req = Tlp()
            req.fmt_type = TlpType.IO_WRITE
            req.requester_id = PcieId(self.dev_bus_num, self.dev_device_num, 0)

            first_pad = addr % 4
            byte_length = min(len(data)-n, 4-first_pad)
            req.set_addr_be_data(addr, data[n:n+byte_length])

            if zero_len:
                req.first_be = 0

            op_list.append(cocotb.start_soon(self.perform_nonposted_operation(req, timeout, timeout_unit)))

            n += byte_length
            addr += byte_length

        for op in op_list:
            cpl_list = await op.join()

            if not cpl_list:
                raise Exception("Timeout")
            if cpl_list[0].status != CplStatus.SC:
                raise Exception("Unsuccessful completion")

    async def dma_io_read(self, addr, length, timeout=0, timeout_unit='ns'):
        data = bytearray()
        n = 0

        zero_len = length <= 0
        if zero_len:
            length = 1

        op_list = []

        while n < length:
            req = Tlp()
            req.fmt_type = TlpType.IO_READ
            req.requester_id = PcieId(self.dev_bus_num, self.dev_device_num, 0)

            first_pad = addr % 4
            byte_length = min(length-n, 4-first_pad)
            req.set_addr_be(addr, byte_length)

            if zero_len:
                req.first_be = 0

            op_list.append((first_pad, cocotb.start_soon(self.perform_nonposted_operation(req, timeout, timeout_unit))))

            n += byte_length
            addr += byte_length

        for first_pad, op in op_list:
            cpl_list = await op.join()

            if not cpl_list:
                raise Exception("Timeout")
            cpl = cpl_list[0]
            if cpl.status != CplStatus.SC:
                raise Exception("Unsuccessful completion")

            assert cpl.length == 1
            d = cpl.get_data()

            data.extend(d[first_pad:])

        if zero_len:
            return b''

        return bytes(data[:length])

    async def dma_mem_write(self, addr, data, timeout=0, timeout_unit='ns'):
        n = 0

        zero_len = len(data) == 0
        if zero_len:
            data = b'\x00'

        while n < len(data):
            req = Tlp()
            if addr > 0xffffffff:
                req.fmt_type = TlpType.MEM_WRITE_64
            else:
                req.fmt_type = TlpType.MEM_WRITE
            req.requester_id = PcieId(self.dev_bus_num, self.dev_device_num, 0)

            first_pad = addr % 4
            byte_length = len(data)-n
            # max payload size
            byte_length = min(byte_length, (128 << self.dev_max_payload)-first_pad)
            # 4k address align
            byte_length = min(byte_length, 0x1000 - (addr & 0xfff))
            req.set_addr_be_data(addr, data[n:n+byte_length])

            if zero_len:
                req.first_be = 0

            await self.perform_posted_operation(req)

            n += byte_length
            addr += byte_length

    async def dma_mem_read(self, addr, length, timeout=0, timeout_unit='ns'):
        data = bytearray()
        n = 0

        zero_len = length <= 0
        if zero_len:
            length = 1

        op_list = []

        while n < length:
            req = Tlp()
            if addr > 0xffffffff:
                req.fmt_type = TlpType.MEM_READ_64
            else:
                req.fmt_type = TlpType.MEM_READ
            req.requester_id = PcieId(self.dev_bus_num, self.dev_device_num, 0)

            first_pad = addr % 4
            # remaining length
            byte_length = length-n
            # limit to max read request size
            if byte_length > (128 << self.dev_max_read_req) - first_pad:
                # split on 128-byte read completion boundary
                byte_length = min(byte_length, (128 << self.dev_max_read_req) - (addr & 0x7f))
            # 4k align
            byte_length = min(byte_length, 0x1000 - (addr & 0xfff))
            req.set_addr_be(addr, byte_length)

            if zero_len:
                req.first_be = 0

            op_list.append((byte_length, cocotb.start_soon(self.perform_nonposted_operation(req, timeout, timeout_unit))))

            n += byte_length
            addr += byte_length

        for byte_length, op in op_list:
            cpl_list = await op.join()

            m = 0

            while m < byte_length:
                if not cpl_list:
                    raise Exception("Timeout")

                cpl = cpl_list.pop(0)

                if cpl.status != CplStatus.SC:
                    raise Exception("Unsuccessful completion")

                assert cpl.byte_count+3+(cpl.lower_address & 3) >= cpl.length*4
                assert cpl.byte_count == max(byte_length - m, 1)

                d = cpl.get_data()

                offset = cpl.lower_address & 3
                data.extend(d[offset:offset+cpl.byte_count])

                m += len(d)-offset

        if zero_len:
            return b''

        return bytes(data[:length])
        
    async def _run_rx_tlp(self):
        while True:
            # frame = await self.rx_sink.recv()

            tlp = await self.rx_queue.get()
            assert 1 == 0

            self.log.debug("RX TLP: %s", repr(tlp))
            print("RX TLP: %s", repr(tlp))

            if tlp.fmt_type in {TlpType.CPL, TlpType.CPL_DATA, TlpType.CPL_LOCKED, TlpType.CPL_LOCKED_DATA}:
                self.log.debug("Completion")
    

                self.rx_cpl_queues[tlp.tag].put_nowait(tlp)
                self.rx_cpl_sync[tlp.tag].set()

            elif tlp.fmt_type == TlpType.IO_READ:
                self.log.debug("IO read")

                cpl = Tlp.create_completion_data_for_tlp(tlp, PcieId(self.dev_bus_num, 0, 0))

                for f in self.dev.functions:
                    bar = f.match_bar(tlp.address)
                    if bar:
                        region = bar[0]
                # region = tlp.bar_id
                # region = 3
                addr = tlp.address % len(self.regions[region])
                offset = 0
                start_offset = None
                mask = tlp.first_be

                # perform operation
                data = bytearray(4)

                for k in range(4):
                    if mask & (1 << k):
                        if start_offset is None:
                            start_offset = offset
                    else:
                        if start_offset is not None and offset != start_offset:
                            data[start_offset:offset] = self.regions[region][addr+start_offset:addr+offset]
                        start_offset = None

                    offset += 1

                if start_offset is not None and offset != start_offset:
                    data[start_offset:offset] = self.regions[region][addr+start_offset:addr+offset]

                cpl.set_data(data)
                cpl.byte_count = 4
                cpl.length = 1

                self.log.debug("Completion: %s", repr(cpl))
                await self.send_tlp(cpl)

            elif tlp.fmt_type == TlpType.IO_WRITE:
                self.log.debug("IO write")

                cpl = Tlp.create_completion_for_tlp(tlp, PcieId(self.dev_bus_num, 0, 0))

                # region = tlp.bar_id
                region = 3
                addr = tlp.address % len(self.regions[region])
                offset = 0
                start_offset = None
                mask = tlp.first_be

                # perform operation
                data = tlp.get_data()

                for k in range(4):
                    if mask & (1 << k):
                        if start_offset is None:
                            start_offset = offset
                    else:
                        if start_offset is not None and offset != start_offset:
                            self.regions[region][addr+start_offset:addr+offset] = data[start_offset:offset]
                        start_offset = None

                    offset += 1

                if start_offset is not None and offset != start_offset:
                    self.regions[region][addr+start_offset:addr+offset] = data[start_offset:offset]

                self.log.debug("Completion: %s", repr(cpl))
                await self.send_tlp(cpl)

            elif tlp.fmt_type in {TlpType.MEM_READ, TlpType.MEM_READ_64}:
                self.log.info("Memory read")
                for f in self.dev.functions:
                    bar = f.match_bar(tlp.address)
                    if bar:
                        region = bar[0]

                # perform operation
                # region = frame.bar_range
                addr = tlp.address % len(self.regions[region])
                offset = 0
                length = tlp.length

                # perform read
                data = self.regions[region][addr:addr+length*4]

                # prepare completion TLP(s)
                m = 0
                n = 0
                addr = tlp.address+tlp.get_first_be_offset()
                dw_length = tlp.length
                byte_length = tlp.get_be_byte_count()

                while m < dw_length:
                    cpl = Tlp.create_completion_data_for_tlp(tlp, PcieId(0, 0, 0))

                    cpl_dw_length = dw_length - m
                    cpl_byte_length = byte_length - n
                    cpl.byte_count = cpl_byte_length
                    if cpl_dw_length > 32 << self.dev_max_payload:
                        # max payload size
                        cpl_dw_length = 32 << self.dev_max_payload
                        # RCB align
                        cpl_dw_length -= (addr & 0x7c) >> 2

                    cpl.lower_address = addr & 0x7f

                    cpl.set_data(data[m*4:(m+cpl_dw_length)*4])

                    self.log.debug("Completion: %s", repr(cpl))
                    await self.send_tlp(cpl)

                    m += cpl_dw_length
                    n += cpl_dw_length*4 - (addr & 3)
                    addr += cpl_dw_length*4 - (addr & 3)

            elif tlp.fmt_type in {TlpType.MEM_WRITE, TlpType.MEM_WRITE_64}:
                self.log.info("Memory write")
                for f in self.dev.functions:
                    bar = f.match_bar(tlp.address)
                    if bar:
                        region = bar[0]

                # perform operation
                addr = tlp.address % len(self.regions[region])
                offset = 0
                start_offset = None
                mask = tlp.first_be
                length = tlp.length

                # perform write
                data = tlp.get_data()

                # first dword
                for k in range(4):
                    if mask & (1 << k):
                        if start_offset is None:
                            start_offset = offset
                    else:
                        if start_offset is not None and offset != start_offset:
                            self.regions[region][addr+start_offset:addr+offset] = data[start_offset:offset]
                        start_offset = None

                    offset += 1

                if length > 2:
                    # middle dwords
                    if start_offset is None:
                        start_offset = offset
                    offset += (length-2)*4

                if length > 1:
                    # last dword
                    mask = tlp.last_be

                    for k in range(4):
                        if mask & (1 << k):
                            if start_offset is None:
                                start_offset = offset
                        else:
                            if start_offset is not None and offset != start_offset:
                                self.regions[region][addr+start_offset:addr+offset] = data[start_offset:offset]
                            start_offset = None

                        offset += 1

                if start_offset is not None and offset != start_offset:
                    self.regions[region][addr+start_offset:addr+offset] = data[start_offset:offset]
                
    # async def _run_cfg(self):
    #     while True:
    #         await RisingEdge(self.dut.coreclkout_hip)

    #         if self.dut.tl_cfg_func.value.integer == 0:
    #             addr = self.dut.tl_cfg_add.value.integer
    #             ctl = self.dut.tl_cfg_ctl.value.integer
    #             if addr == 0x00:
    #                 self.dev_max_payload = ctl & 0x7
    #                 self.dev_max_read_req = (ctl >> 3) & 0x7
    #             elif addr == 0x01:
    #                 self.dev_bus_num = ctl & 0xff
    #                 self.dev_device_num = (ctl >> 8) & 0x1f
    #             elif addr == 0x06:
    #                 self.dev_msi_address = (self.dev_msi_address & ~(0xffff << 0)) | ctl << 0
    #             elif addr == 0x07:
    #                 self.dev_msi_address = (self.dev_msi_address & ~(0xffff << 16)) | ctl << 16
    #             elif addr == 0x08:
    #                 self.dev_msi_address = (self.dev_msi_address & ~(0xffff << 32)) | ctl << 32
    #             elif addr == 0x09:
    #                 self.dev_msi_address = (self.dev_msi_address & ~(0xffff << 48)) | ctl << 48
    #             elif addr == 0x0A:
    #                 self.dev_msi_mask = (self.dev_msi_mask & ~(0xffff << 0)) | ctl << 0
    #             elif addr == 0x0B:
    #                 self.dev_msi_mask = (self.dev_msi_mask & ~(0xffff << 16)) | ctl << 16
    #             elif addr == 0x0C:
    #                 self.dev_msi_enable = ctl & 1
    #                 self.dev_msi_multi_msg_enable = (ctl >> 2) & 0x7
    #                 self.dev_msix_enable = (ctl >> 5) & 1
    #                 self.dev_msix_function_mask = (ctl >> 6) & 1
    #             elif addr == 0x0D:
    #                 self.dev_msi_data = (self.dev_msi_data & ~(0xffff << 0)) | ctl << 0
    #             elif addr == 0x1D:
    #                 self.dev_msi_data = (self.dev_msi_data & ~(0xffff << 16)) | ctl << 16