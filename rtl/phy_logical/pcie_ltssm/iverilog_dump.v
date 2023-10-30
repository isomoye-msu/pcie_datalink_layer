module iverilog_dump();
initial begin
    $dumpfile("tb_ltssm_configuration.fst");
    $dumpvars(0, tb_ltssm_configuration);
end
endmodule
