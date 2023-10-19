import pcie_datalink_pkg::*;
interface axi_lite_if(
    input clk,
    input reset
    );
    parameter int ADDR_WIDTH = 32;
    parameter int DATA_WIDTH = 32;
    localparam int AW = ADDR_WIDTH - 1;
    localparam int DW = DATA_WIDTH - 1;


    wire [AW:0] awaddr;
    wire        awvalid;
    wire        awready;
    wire [DW:0] wdata;
    wire        wvalid;
    wire        wready;
    resp        bresp;
    wire        bvalid;
    wire        bready;
    wire [AW:0] araddr;
    wire        arvalid;
    wire        arready;
    wire [DW:0] rdata;
    resp        rresp;
    wire        rvalid;
    wire        rready;
    modport master(
        input clk, input reset,
        output awaddr, output awvalid, input awready,
        output wdata, output wvalid, input wready,
        input bresp, input bvalid, output bready,
        output araddr, output arvalid, input arready,
        input rdata, input rresp, input rvalid, output rready);
    modport slave(
        input clk, input reset,
        input awaddr, input awvalid, output awready,
        input wdata, input wvalid, output wready,
        output bresp, output bvalid, input bready,
        input araddr, input arvalid, output arready,
        output rdata, output rresp, output rvalid, input rready);
endinterface