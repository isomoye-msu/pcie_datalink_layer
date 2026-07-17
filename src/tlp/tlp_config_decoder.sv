`timescale 1ns/1ps
module tlp_config_decoder
  import tlp_pkg::*;
(
    input  tlp_header_t header_i,
    input  logic [7:0]  bus_number_i,
    input  logic [4:0]  device_number_i,
    input  logic [2:0]  function_number_i,
    output logic        hit_o,
    output logic        type_one_o,
    output logic [11:0] register_offset_o
);

  always_comb begin
    type_one_o = header_i.tlp_type == TLP_TYPE_CFG1;
    register_offset_o = {header_i.address[11:2], 2'b00};
    hit_o = (header_i.tlp_type == TLP_TYPE_CFG0 ||
             header_i.tlp_type == TLP_TYPE_CFG1) &&
            header_i.address[31:24] == bus_number_i &&
            header_i.address[23:19] == device_number_i &&
            header_i.address[18:16] == function_number_i;
  end

endmodule
