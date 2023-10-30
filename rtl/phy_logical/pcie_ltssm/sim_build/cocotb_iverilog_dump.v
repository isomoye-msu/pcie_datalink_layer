module cocotb_iverilog_dump();
initial begin
    $dumpfile("sim_build/tb_ltssm_configuration.fst");
    $dumpvars(0, tb_ltssm_configuration);
end
endmodule
