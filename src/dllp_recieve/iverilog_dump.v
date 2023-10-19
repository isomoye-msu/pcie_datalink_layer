module iverilog_dump();
initial begin
    $dumpfile("tb_dllp_recieve.fst");
    $dumpvars(0, tb_dllp_recieve);
end
endmodule
