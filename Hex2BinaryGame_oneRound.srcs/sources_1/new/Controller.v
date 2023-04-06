`timescale 1ns / 1ps

module controller(input[3:0] RandNum,input[3:0] data_reg, input[5:0] seconds, input [3:0]Num_val,input start, input points, 
input[9:0] msecs, input [2:0] data , output reg [7:0] AN, output reg [7:0] C, output reg new_test); 
reg [3:0] secsL,secsH,msecs1,msecs10,msecs100,tune,temp;      // Clock time
reg [1:0]add_pts;
//output reg new_test;


always @ *

begin
secsL = seconds % 10;
secsH = seconds / 10;
msecs1 = msecs % 10; 
msecs10 = (msecs %100)/10;
msecs100 = msecs / 100;

//if (~points)
//    ring_se =0;
//else 
//    ring_se=1;     
if (seconds==0)
    begin
        add_pts <= 0;
         new_test<=1;
     end

else if(points )
    begin
    add_pts <= secsH+1;
    new_test = 0;
    end
else
    begin
    add_pts <= 0;
    new_test<=1;
    end 
    
    

        case(data)
                3'b000: begin
                            C=8'hFF;                            
                            AN = 8'hEF;         //this one is off 
                        end
                3'b001: begin                            //points
                        case (add_pts)
                                0:C = 8'hC0;
                                1:C = 8'hF9;
                                2:C = 8'hA4;
                                3:C = 8'hB0;
                                4:C = 8'h99;
                                5:C = 8'h92;
                                6:C = 8'h82;
                                7:C = 8'hF8;
                                8:C = 8'h80;
                                9:C = 8'h90;
                                10:C = 8'hA0;
                                11:C = 8'h83;
                                12:C = 8'hA7;
                                13:C = 8'hA1;
                                14:C = 8'h84;  
                                15:C = 8'h8E; 
                            default:C = 8'hFF;
                            endcase
                            AN = 8'hDF;     
                        end                
                3'b010: begin                           // this one is off
                            C=8'hFF;
                            AN = 8'hBF; 
                        end        
                3'b011: begin                            //random number to be guessed by user
                        if (start)
                            temp = Num_val;
                            else
                            temp = RandNum;
                        case (temp)
                                0:C = 8'hC0;
                                1:C = 8'hF9;
                                2:C = 8'hA4;
                                3:C = 8'hB0;
                                4:C = 8'h99;
                                5:C = 8'h92;
                                6:C = 8'h82;
                                7:C = 8'hF8;
                                8:C = 8'h80;
                                9:C = 8'h90;
                                10:C = 8'hA0;
                                11:C = 8'h83;
                                12:C = 8'hA7;
                                13:C = 8'hA1;
                                14:C = 8'h84;  
                                15:C = 8'h8E;  
                                                                
                                
                                default:C = 8'hFF;
                        endcase
                            AN = 8'h7F; 
                        end
                3'b100: begin
                            case (msecs10)                    //miliseconds 10s place
                                0:C = 8'hC0;
                                1:C = 8'hF9;
                                2:C = 8'hA4;
                                3:C = 8'hB0;
                                4:C = 8'h99;
                                5:C = 8'h92;
                                6:C = 8'h82;
                                7:C = 8'hF8;
                                8:C = 8'h80;
                                9:C = 8'h90;                               
                                default: C=8'hFF;
                                
                            endcase
                            AN = 8'hFE; 
                        end
            3'b101: begin                                   //miliseconds 100s place        
                        case (msecs100)
                                0:C = 8'hC0;
                                1:C = 8'hF9;
                                2:C = 8'hA4;
                                3:C = 8'hB0;
                                4:C = 8'h99;
                                5:C = 8'h92;
                                6:C = 8'h82;
                                7:C = 8'hF8;
                                8:C = 8'h80;
                                9:C = 8'h90; 
                            default:C = 8'hff;
                            endcase
                            AN = 8'hFD;     
                        end                
                3'b110: begin
                            case (secsL)                    //Seconds 1s place add decimal?
                                
                                0:C = 8'h40;
                                1:C = 8'h79;
                                2:C = 8'h24;
                                3:C = 8'h30;
                                4:C = 8'h19;
                                5:C = 8'h12;
                                6:C = 8'h02;
                                7:C = 8'h78;
                                8:C = 8'h00;
                                9:C = 8'h10;                                
                                default: C=8'hff;
                             endcase
                            AN = 8'hFB; 
                        end        
                3'b111: begin                               //Seconds 10s place
                        case (secsH)
                                0:C = 8'hC0;
                                1:C = 8'hF9;
                                2:C = 8'hA4;
                                3:C = 8'hB0;
                                4:C = 8'h99;
                                5:C = 8'h92;
                                default:C = 8'hff;
                        endcase
                            AN = 8'hF7; 
                        end
                    
            endcase 
    end

endmodule
