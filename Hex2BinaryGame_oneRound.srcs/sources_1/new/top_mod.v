`timescale 1ns / 1ps

module top_mod(clock,reset,user_input,start_game,submit_bt,C,AN,audioOut,aud_sd,btn,PlaySound,ring_sel);
input clock, reset,start_game,submit_bt;
input [3:0] user_input;
output [7:0] C,AN;
output audioOut,aud_sd;
wire submitans,points,clk400,clk1,clk50,clkms,PlaySound,ring_sel,ignore,sel;
wire [2:0] Q;
wire [3:0]RandNumGen;
wire [5:0]seconds;
wire [9:0] msecs;
wire [3:0] Num_val,data_reg;
output btn,PlaySound,ring_sel;
db_fsm button  (clock, reset,submit_bt,submitans,btn);
slowerClkGen slower (clock, clk400,clk1,clk50,clkms);
RandomGen randumb(clk50,RandNumGen);
FSM_main program (clock,reset,RandNumGen,user_input,start_game,submitans,points,Num_val,PlaySound,ring_sel,data_reg);
//counter_mux(btn,clkms,clk_out);
downcounterTime roundTimer (clkms,start_game,seconds,msecs,submit_bt);
upcounter3bit counterforSegs (clk400, Q);
controller segsController (RandNumGen,data_reg, seconds,Num_val,start_game,points,msecs, Q , AN,C,sel); 
SongPlayer dj( sel, clock, reset, PlaySound, audioOut, aud_sd);

endmodule
