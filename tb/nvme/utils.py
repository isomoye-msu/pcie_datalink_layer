# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      utils.py
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

import enum

_IOC_NONE	= 1
_IOC_READ	= 2
_IOC_WRITE	= 4
_IOC_NRBITS	  =  8
_IOC_TYPEBITS =	8
_IOC_SIZEBITS =	13
_IOC_DIRBITS  =	3

class nvme_bar:
    def __init__(self) -> None:
        self.cap 	 # Controller Capabilities */
        self.vs 	 # Version */
        self.intms 	 # Interrupt Mask Set */
        self.intmc 	 # Interrupt Mask Clear */
        self.cc 	 # Controller Configuration */
        self.rsvd1 	 # Reserved */
        self.csts 	 # Controller Status */
        self.rsvd2 	 # Reserved */
        self.aqa 	 # Admin Queue Attributes */
        self.asq 	 # Admin SQ Base Address */
        self.acq 	 # Admin CQ Base Address */


def  NVME_CAP_TIMEOUT(cap):
    return (((cap) >> 24) & 0xff)

def  NVME_CAP_STRIDE(cap):
    return (((cap) >> 32) & 0xf)
 
class nvme_shift_enum(enum) :
	NVME_CC_ENABLE		= 1 << 0 
	NVME_CC_CSS_NVM		= 0 << 4 
	NVME_CC_MPS_SHIFT	= 7 
	NVME_CC_ARB_RR		= 0 << 11 
	NVME_CC_ARB_WRRU	= 1 << 11 
	NVME_CC_ARB_VS		= 7 << 11 
	NVME_CC_SHN_NONE	= 0 << 14 
	NVME_CC_SHN_NORMAL	= 1 << 14 
	NVME_CC_SHN_ABRUPT	= 2 << 14 
	NVME_CC_IOSQES		= 6 << 16 
	NVME_CC_IOCQES		= 4 << 20 
	NVME_CSTS_RDY		= 1 << 0 
	NVME_CSTS_CFS		= 1 << 1 
	NVME_CSTS_SHST_NORMAL	= 0 << 2 
	NVME_CSTS_SHST_OCCUR	= 1 << 2 
	NVME_CSTS_SHST_CMPLT	= 2 << 2 
 
class  nvme_id_power_state :
    def __init__(self) -> None:
        self.max_power	# centiwatts */
        self.rsvd2
        self.entry_lat	# microseconds */
        self.exit_lat	# microseconds */
        self.read_tput
        self.read_lat
        self.write_tput
        self.write_lat
        self.rsvd16[16]



def NVME_VS (major, minor):
    return (major << 16 | minor)

class  nvme_id_ctrl() :
    def __init__(self):
        self.vid
        self.ssvid
        self.sn = []
        self.mn = []
        self.fr = []
        self.rab
        self.ieee = []
        self.mic
        self.mdts
        self.rsvd78 = []
        self.oacs
        self.acl
        self.aerl
        self.frmw
        self.lpa
        self.elpe
        self.npss
        self.rsvd264  = []
        self.sqes
        self.cqes
        self.rsvd514 = []
        self.nn
        self.oncs
        self.fuses
        self.fna
        self.vwc
        self.awun
        self.awupf
        self.rsvd530 = []
        self.psd = [nvme_id_power_state for _ in range(32)]
        self.vs = []


class  nvme_lbaf ():
    def __init__(self) -> None:
        self.ms
        self.ds
        self.rp


class  nvme_id_ns ():
    def __init__(self) -> None:
        self.nsze
        self.ncap
        self.nuse
        self.nsfeat
        self.nlbaf
        self.flbas
        self.mc
        self.dpc
        self.dps
        self.rsvd30[98]
        self.lbaf =   [nvme_lbaf() for _ in range(16)]
        self.rsvd192 = [] * 192
        self.vs      = [] * 3712


class nvme_ns_enum(enum) :
	NVME_NS_FEAT_THIN	= 1 << 0
	NVME_LBAF_RP_BEST	= 0
	NVME_LBAF_RP_BETTER	= 1
	NVME_LBAF_RP_GOOD	= 2
	NVME_LBAF_RP_DEGRADED	= 3


class  nvme_lba_range_type ():
    def __init__(self) -> None:
        self.type
        self.attributes
        self.rsvd2 = [14]
        self.slba
        self.nlb
        self.guid = [16]
        self.rsvd48  = [16]


class nvme_lb_enum(enum) :
	NVME_LBART_TYPE_FS	= 0x01
	NVME_LBART_TYPE_RAID	= 0x02
	NVME_LBART_TYPE_CACHE	= 0x03
	NVME_LBART_TYPE_SWAP	= 0x04

	NVME_LBART_ATTRIB_TEMP	= 1 << 0
	NVME_LBART_ATTRIB_HIDE	= 1 << 1


# I/O commands */

class nvme_opcode (enum):
	nvme_cmd_flush		= 0x00
	nvme_cmd_write		= 0x01
	nvme_cmd_read		= 0x02
	nvme_cmd_write_uncor	= 0x04
	nvme_cmd_compare	= 0x05
	nvme_cmd_dsm		= 0x09


class  nvme_common_command():
    def __init__(self) -> None:
        self.opcode
        self.flags
        self.command_id
        self.nsid
        self.		cdw2[2]
        self.metadata
        self.prp1
        self.prp2
        self.		cdw10[6]


class  nvme_rw_command ():
    def __init__(self) -> None:
        self.opcode
        self.flags
        self.command_id
        self.nsid
        self.rsvd2
        self.metadata
        self.prp1
        self.prp2
        self.slba
        self.length
        self.control
        self.dsmgmt
        self.reftag
        self.apptag
        self.appmask


class nvme_rw_enum(enum) :
	NVME_RW_LR			= 1 << 15
	NVME_RW_FUA			= 1 << 14
	NVME_RW_DSM_FREQ_UNSPEC		= 0
	NVME_RW_DSM_FREQ_TYPICAL	= 1
	NVME_RW_DSM_FREQ_RARE		= 2
	NVME_RW_DSM_FREQ_READS		= 3
	NVME_RW_DSM_FREQ_WRITES		= 4
	NVME_RW_DSM_FREQ_RW		= 5
	NVME_RW_DSM_FREQ_ONCE		= 6
	NVME_RW_DSM_FREQ_PREFETCH	= 7
	NVME_RW_DSM_FREQ_TEMP		= 8
	NVME_RW_DSM_LATENCY_NONE	= 0 << 4
	NVME_RW_DSM_LATENCY_IDLE	= 1 << 4
	NVME_RW_DSM_LATENCY_NORM	= 2 << 4
	NVME_RW_DSM_LATENCY_LOW		= 3 << 4
	NVME_RW_DSM_SEQ_REQ		= 1 << 6
	NVME_RW_DSM_COMPRESSED		= 1 << 7


# Admin commands */

class nvme_admin_opcode(enum) :
	nvme_admin_delete_sq		= 0x00
	nvme_admin_create_sq		= 0x01
	nvme_admin_get_log_page		= 0x02
	nvme_admin_delete_cq		= 0x04
	nvme_admin_create_cq		= 0x05
	nvme_admin_identify		= 0x06
	nvme_admin_abort_cmd		= 0x08
	nvme_admin_set_features		= 0x09
	nvme_admin_get_features		= 0x0a
	nvme_admin_async_event		= 0x0c
	nvme_admin_activate_fw		= 0x10
	nvme_admin_download_fw		= 0x11
	nvme_admin_format_nvm		= 0x80
	nvme_admin_security_send	= 0x81
	nvme_admin_security_recv	= 0x82


class nvme_queue_enum(enum) :
	NVME_QUEUE_PHYS_CONTIG	= (1 << 0)
	NVME_CQ_IRQ_ENABLED	= (1 << 1)
	NVME_SQ_PRIO_URGENT	= (0 << 1)
	NVME_SQ_PRIO_HIGH	= (1 << 1)
	NVME_SQ_PRIO_MEDIUM	= (2 << 1)
	NVME_SQ_PRIO_LOW	= (3 << 1)
	NVME_FEAT_ARBITRATION	= 0x01
	NVME_FEAT_POWER_MGMT	= 0x02
	NVME_FEAT_LBA_RANGE	= 0x03
	NVME_FEAT_TEMP_THRESH	= 0x04
	NVME_FEAT_ERR_RECOVERY	= 0x05
	NVME_FEAT_VOLATILE_WC	= 0x06
	NVME_FEAT_NUM_QUEUES	= 0x07
	NVME_FEAT_IRQ_COALESCE	= 0x08
	NVME_FEAT_IRQ_CONFIG	= 0x09
	NVME_FEAT_WRITE_ATOMIC	= 0x0a
	NVME_FEAT_ASYNC_EVENT	= 0x0b
	NVME_FEAT_SW_PROGRESS	= 0x0c


class  nvme_identify() :
    def __init__(self) -> None:
        self.opcode
        self.flags
        self.command_id
        self.nsid
        self.rsvd2[2]
        self.prp1
        self.prp2
        self.cns
        self.		rsvd11[5]


class  nvme_features ():
    def __init__(self) -> None:
        self.opcode
        self.flags
        self.command_id
        self.nsid
        self.rsvd2[2]
        self.prp1
        self.prp2
        self.fid
        self.dword11
        self.		rsvd12[4]


class  nvme_create_cq ():
    def __init__(self) -> None:
        self.opcode
        self.flags
        self.command_id
        self.		rsvd1[5]
        self.prp1
        self.rsvd8
        self.cqid
        self.qsize
        self.cq_flags
        self.irq_vector
        self.		rsvd12[4]


class  nvme_create_sq ():
    def __init__(self) -> None:
        self.opcode
        self.flags
        self.command_id
        self.		rsvd1[5]
        self.prp1
        self.rsvd8
        self.sqid
        self.qsize
        self.sq_flags
        self.cqid
        self.		rsvd12[4]


class  nvme_delete_queue ():
    def __init__(self) -> None:
        self.opcode
        self.flags
        self.command_id
        self.		rsvd1[9]
        self.qid
        self.rsvd10
        self.		rsvd11[5]


class  nvme_download_firmware ():
    def __init__(self) -> None:
        self.opcode
        self.flags
        self.command_id
        self.		rsvd1[5]
        self.prp1
        self.prp2
        self.numd
        self.offset
        self.		rsvd12[4]


class  nvme_command ():
    def __init__(self) -> None:
        self.common =      nvme_common_command    
        self.rw =      nvme_rw_command        
        self.identify =      nvme_identify          
        self.features =      nvme_features          
        self.create_cq =      nvme_create_cq         
        self.create_sq =      nvme_create_sq         
        self.delete_queue =      nvme_delete_queue      
        self.dlfw =      nvme_download_firmware 
	


class nvme_sc_enum(enum) :
        NVME_SC_SUCCESS			= 0x0
        NVME_SC_INVALID_OPCODE		= 0x1
        NVME_SC_INVALID_FIELD		= 0x2
        NVME_SC_CMDID_CONFLICT		= 0x3
        NVME_SC_DATA_XFER_ERROR		= 0x4
        NVME_SC_POWER_LOSS		= 0x5
        NVME_SC_INTERNAL		= 0x6
        NVME_SC_ABORT_REQ		= 0x7
        NVME_SC_ABORT_QUEUE		= 0x8
        NVME_SC_FUSED_FAIL		= 0x9
        NVME_SC_FUSED_MISSING		= 0xa
        NVME_SC_INVALID_NS		= 0xb
        NVME_SC_LBA_RANGE		= 0x80
        NVME_SC_CAP_EXCEEDED		= 0x81
        NVME_SC_NS_NOT_READY		= 0x82
        NVME_SC_CQ_INVALID		= 0x100
        NVME_SC_QID_INVALID		= 0x101
        NVME_SC_QUEUE_SIZE		= 0x102
        NVME_SC_ABORT_LIMIT		= 0x103
        NVME_SC_ABORT_MISSING		= 0x104
        NVME_SC_ASYNC_LIMIT		= 0x105
        NVME_SC_FIRMWARE_SLOT		= 0x106
        NVME_SC_FIRMWARE_IMAGE		= 0x107
        NVME_SC_INVALID_VECTOR		= 0x108
        NVME_SC_INVALID_LOG_PAGE	= 0x109
        NVME_SC_INVALID_FORMAT		= 0x10a
        NVME_SC_BAD_ATTRIBUTES		= 0x180
        NVME_SC_WRITE_FAULT		= 0x280
        NVME_SC_READ_ERROR		= 0x281
        NVME_SC_GUARD_CHECK		= 0x282
        NVME_SC_APPTAG_CHECK		= 0x283
        NVME_SC_REFTAG_CHECK		= 0x284
        NVME_SC_COMPARE_FAILED		= 0x285
        NVME_SC_ACCESS_DENIED		= 0x286


class  nvme_completion() :
    def __init__(self) -> None:
        self.result		# Used by admin commands to return data */
        self.rsvd
        self.sq_head	# how much of this queue may be reclaimed */
        self.sq_id		# submission queue that generated this entry */
        self.command_id	# of the command which completed */
        self.status		# did the command fail and if so why? */


class  nvme_user_io () :
    def __init__(self) -> None:
        self.opcode
        self.flags
        self.control
        self.nblocks
        self.rsvd
        self.metadata
        self.addr
        self.slba
        self.dsmgmt
        self.reftag
        self.apptag
        self.appmask


class  nvme_admin_cmd :
    def __init__(self) -> None:
        self.opcode
        self.flags
        self.rsvd1
        self.nsid
        self.cdw2
        self.cdw3
        self.metadata
        self.addr
        self.metadata_len
        self.data_len
        self.cdw10
        self.cdw11
        self.cdw12
        self.cdw13
        self.cdw14
        self.cdw15
        self.timeout_ms
        self.result





# def NVME_IOCTL_ID():
#     return _IO('N', 0x40)

# def NVME_IOCTL_ADMIN_CMD():
#     return _IOWR('N', 0x41 class  nvme_admin_cmd)

# def NVME_IOCTL_SUBMIT_IO():
#     return _IOW('N', 0x42 class  nvme_user_io)

# def _IOC_NRMASK	():
#     return ((1 << _IOC_NRBITS)-1)
# def _IOC_TYPEMASK():
#     return ((1 << _IOC_TYPEBITS)-1)
# def _IOC_SIZEMASK():
#     return ((1 << _IOC_SIZEBITS)-1)
# def _IOC_DIRMASK():
#     return ((1 << _IOC_DIRBITS)-1)

# def _IOC_NRSHIFT():
#     return 0
# def _IOC_TYPESHIFT():
#     return (_IOC_NRSHIFT()+_IOC_NRBITS)

# def _IOC_SIZESHIFT ():
#     return (_IOC_TYPESHIFT()+_IOC_TYPEBITS)

# def _IOC_DIRSHIFT():
#     (_IOC_SIZESHIFT()+_IOC_SIZEBITS)


# def _IOC(dir,type,nr,size):		
# 	return (((dir)  << _IOC_DIRSHIFT) |
#          ((type) << _IOC_TYPESHIFT) |
#          ((nr)   << _IOC_NRSHIFT) |
#          ((size) << _IOC_SIZESHIFT))
 
#  # used to create numbers */
# def _IO(type,nr):
#     return _IOC(_IOC_NONE,(type),(nr),0)
# def _IOR(type,nr,size):
#     return _IOC(_IOC_READ,(type),(nr),sizeof(size))
# def _IOW(type,nr,size):
#     return _IOC(_IOC_WRITE,(type),(nr),sizeof(size))
# def _IOWR(type,nr,size):
#     return _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),sizeof(size))

# # used to decode them.. */
# def _IOC_DIR(nr)		(((nr) >> _IOC_DIRSHIFT) & _IOC_DIRMASK)
# def _IOC_TYPE(nr)		(((nr) >> _IOC_TYPESHIFT) & _IOC_TYPEMASK)
# def _IOC_NR(nr)		(((nr) >> _IOC_NRSHIFT) & _IOC_NRMASK)
# def _IOC_SIZE(nr)		(((nr) >> _IOC_SIZESHIFT) & _IOC_SIZEMASK)
