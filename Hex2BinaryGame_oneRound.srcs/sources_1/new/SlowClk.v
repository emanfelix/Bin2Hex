`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2022 03:56:46 PM
// Design Name: 
// Module Name: SlowClk
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module slowerClkGen(clk, clk400,clk1,clk50,clkms);
    input clk;
    reg resetSW=1;
    output  clk400,clk1,clk50,clkms;
reg [26:0] counter400,counter1,counter50,counterms;  

reg clk400,clk1,clk50,clkms;
    always @ (posedge clk)
    begin
	if (resetSW)
	  begin
		counter400=0;
		counter1=0;
		clk400=0;
		clk1=0;
		counter50=0;
		clk50=0;
		counterms =0;
		resetSW=0;
	  end
	else
      begin
          counter400 = counter400 +1;
          counter1 = counter1 +1;
          counter50 = counter50 +1;
          counterms = counterms +1;
          if (counter50 == 3_125_000) 
            begin
                clk50 = ~clk50;
                counter50 = 0;
            end
          if (counter400 == 125_000) 
            begin
                clk400=~clk400;
                counter400 =0;
            end
          if (counter1 == 50_000_000) 
                begin
                    clk1=~clk1;
                    counter1 =0;
                end
            if (counterms == 50_000) 
                begin
                    clkms = ~clkms;
                    counterms =0;
                end
      end
   end
endmodule
