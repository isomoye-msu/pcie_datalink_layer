module cocotb_iverilog_dump();
initial begin
    $dumpfile("sim_build/tb_dllp_recieve.fst");
    $dumpvars(0, tb_dllp_recieve);
end
endmodule
