`timescale 1ns / 1ps

module downCountSIM( );
reg Clock;
wire [3:0]Rand;
wire [5:0] seconds;
wire [9:0] msecs;
always #1 Clock = ~Clock;
downcounterTime uut (Clock,seconds,msecs);

initial begin
Clock =0;
end

endmodule


