module cocotb_iverilog_dump();
initial begin
    $dumpfile("sim_build/tb_dllp_transmit.fst");
    $dumpvars(0, tb_dllp_transmit);
end
endmodule
