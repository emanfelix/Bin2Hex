`timescale 1ns / 1ps


module randGenSIM( );
reg Clock;
wire [3:0]Rand;

always #1 Clock = ~Clock;
RandomGen randumb (Clock,Rand);

initial begin
Clock =0;
end
endmodule
