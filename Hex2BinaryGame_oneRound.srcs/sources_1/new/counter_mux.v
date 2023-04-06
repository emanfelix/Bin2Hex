`timescale 1ns / 1ps

module counter_mux(input sbmt,input clk, output reg clk_out

    );
    reg temp = 0;
    always @(posedge sbmt,posedge clk)
    begin
    if (sbmt)
     temp = 1;
    clk_out = sbmt ? temp : clk;
    end 
endmodule
