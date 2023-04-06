`timescale 1ns / 1ps
module RandomGen(input Clock,output reg [3:0]Rand);
	//	wire Resetn =0;
	reg Resetn =0;
	wire E;
	assign E = 1;
	always @(negedge Resetn, posedge Clock)
	 	if (!Resetn) 
         begin
			Rand <= 0;
			Resetn =1;
         end			
		else if (E)
		    begin
                Rand = (Rand +1);
                if(Rand==0)
                    Rand = Rand+1;
			end			
endmodule

