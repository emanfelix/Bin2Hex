`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2022 09:12:31 PM
// Design Name: 
// Module Name: fsmSIM
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


module fsmSIM(

    );
    reg clock,reset,submit,start_game;
    reg [3:0] user_in;
    wire [3:0] Rand;
    wire [3:0] Num_val;
    RandomGen gennum (Clock, Rand);
//    FSM_main uut (Clock,reset,Rand,user_in,start_game,submit,timer,Points);
//    FSM_main uut(clock,reset,RandNumGen,user_in,start_game,submit,points,Num_val);
top_mod uut (clock,reset,user_input,start_game,submit_bt,C,AN,audioOut,aud_sd,btn,PlaySound,ring_sel);
    initial begin
     clock = 0;
     Clock =0;
     repeat(50)
        begin
        #1 Clock = ~Clock;
        end
    end
    initial begin
     reset =1; submit = 0;
     #2 reset = 0;
     #6 reset = 1;
     #4 start_game=1;
     #1 user_in = 2;
     #8 submit =1;
    end    
endmodule
