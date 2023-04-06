`timescale 1ns / 1ps

module downcounterTime (Clock,Resetn,seconds,msecs,sbmt);
	input Clock,Resetn,sbmt;
	reg E=1;

	output reg [5:0]seconds;
	output reg [9:0] msecs;
	always @(negedge Resetn, posedge Clock)
	 	if (!Resetn) 
         begin
			seconds <= 29;
			msecs <= 999;
			E <= 1;
         end
			
		else if (E)
		    begin
		        if (sbmt)
		          begin
                    E =0;
		          end
		        else
		        begin  
                    if(msecs != 0) 
                      begin
                        msecs = msecs -1;
                      end
                    else
                        begin
                            if (seconds == 0)
                                begin
                                    seconds = 0;
                                    msecs = 0;
                                end
                            else
                                begin
                                    seconds = seconds - 1;
                                    msecs = 999;
                                end
                        end
                end
			end
			
endmodule
