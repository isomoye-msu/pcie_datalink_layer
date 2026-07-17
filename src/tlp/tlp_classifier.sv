`timescale 1ns/1ps
module tlp_classifier
  import tlp_pkg::*;
(
    input  tlp_header_t header_i,
    output tlp_class_e  class_o,
    output logic        memory_request_o,
    output logic        config_request_o,
    output logic        completion_o,
    output logic        read_request_o,
    output logic        write_request_o,
    output logic        unsupported_o
);

  always_comb begin
    class_o          = TLP_CLASS_UNSUPPORTED;
    memory_request_o = 1'b0;
    config_request_o = 1'b0;
    completion_o     = 1'b0;
    read_request_o   = 1'b0;
    write_request_o  = 1'b0;
    unsupported_o    = 1'b0;

    unique case (header_i.tlp_type)
      TLP_TYPE_MEM: begin
        memory_request_o = 1'b1;
        if (tlp_has_data(header_i.fmt)) begin
          class_o         = TLP_CLASS_POSTED;
          write_request_o = 1'b1;
        end else begin
          class_o        = TLP_CLASS_NON_POSTED;
          read_request_o = 1'b1;
        end
      end
      TLP_TYPE_IO, TLP_TYPE_CFG0, TLP_TYPE_CFG1: begin
        config_request_o = header_i.tlp_type == TLP_TYPE_CFG0 ||
                           header_i.tlp_type == TLP_TYPE_CFG1;
        class_o          = TLP_CLASS_NON_POSTED;
        read_request_o   = !tlp_has_data(header_i.fmt);
        write_request_o  =  tlp_has_data(header_i.fmt);
      end
      TLP_TYPE_CPL, TLP_TYPE_CPL_LOCK: begin
        class_o      = TLP_CLASS_COMPLETION;
        completion_o = 1'b1;
      end
      default: unsupported_o = 1'b1;
    endcase

    if (header_i.length_dw > 11'd1024) begin
      class_o       = TLP_CLASS_UNSUPPORTED;
      unsupported_o = 1'b1;
    end

    // IO, Configuration, and Completion TLPs only use 3-DW headers.  A
    // completion without data must also carry a zero Length field.
    if (((header_i.tlp_type == TLP_TYPE_IO ||
          header_i.tlp_type == TLP_TYPE_CFG0 ||
          header_i.tlp_type == TLP_TYPE_CFG1 ||
          header_i.tlp_type == TLP_TYPE_CPL ||
          header_i.tlp_type == TLP_TYPE_CPL_LOCK) && tlp_is_4dw(header_i.fmt)) ||
        ((header_i.tlp_type == TLP_TYPE_CPL ||
          header_i.tlp_type == TLP_TYPE_CPL_LOCK) &&
         !tlp_has_data(header_i.fmt) && header_i.length_dw != 0)) begin
      class_o          = TLP_CLASS_UNSUPPORTED;
      memory_request_o = 1'b0;
      config_request_o = 1'b0;
      completion_o     = 1'b0;
      read_request_o   = 1'b0;
      write_request_o  = 1'b0;
      unsupported_o    = 1'b1;
    end
  end

endmodule
