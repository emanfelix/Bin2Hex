`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2022 10:16:29 PM
// Design Name: 
// Module Name: upcount3bit
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


module upcounter3bit (Clock, Q);
	input Clock;
	wire E;
	assign E = 1;
	output reg [2:0] Q;
	reg Resetn=0;
	
	always @(negedge Resetn, posedge Clock)
	 	if (!Resetn)
	 	    begin
			Q <= 0;
			Resetn =1;
			end
			
		else if (E)
			Q <= Q + 1;
			
endmodule
