`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2022 09:59:15 PM
// Design Name: 
// Module Name: countdownSIM
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


module countdownSIM(
    );
    reg clock,reset,Clock;
    wire [9:0] msecs;
    wire [5:0] seconds;
    downcounterTime uut (clock,reset,seconds,msecs);

//    RandomGen gennum (Clock, Rand);
//    FSM_main uut (Clock,reset,Rand,user_in,start_game,submit,timer,Points);
//    FSM_main uut(clock,reset,RandNumGen,user_in,start_game,submit,points,Num_val);
    initial begin
     clock = 0;
     Clock =0;
     repeat(1000)
        begin
        #1 Clock = ~Clock;
        end
    end
    initial begin
     reset =0; 
     #2 reset = 1;   
    end    
endmodule

