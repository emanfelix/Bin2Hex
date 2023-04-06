`timescale 1ns / 1ps

module FSM_main(clock,reset,RandNumGen,user_in,start_game,submit,points,Num_val,PlaySound,ring_sel,data_reg);
input clock,reset,start_game,submit;
input [3:0] user_in,RandNumGen;

output reg PlaySound,ring_sel;
reg [1:0] state_reg;
localparam [1:0] state1=2'b01, state2=2'b10, state3=2'b11;
reg [1:0] state_next;
reg [3:0] data_reg,data_reg_next;
reg points,points_next,ring,ring_next,PlaySound_next,ring_sel_next;
reg [3:0] Num_val,Num_val_next;
output points;
output Num_val;
output data_reg;
always @(posedge clock)
       if (reset)
          begin
            state_reg <= state1;
            points <= 0;
            ring <=0;
            data_reg <=0;
            PlaySound<=0;
            ring_sel<=0;
            Num_val = 0;
          
          end
      else 
        begin
            state_reg <= state_next;
            data_reg <= data_reg_next;
            points <= points_next;
            ring<=ring_next;
            Num_val <= Num_val_next;
            PlaySound<=PlaySound_next;
            ring_sel<=ring_sel_next;

        end

always @ *
 begin
    state_next = state_reg;
    data_reg_next = data_reg;
    points_next = points;
    ring_next=ring;
    PlaySound_next<=PlaySound;
    ring_sel_next <=ring_sel;
    case(state_reg)
     state1:
      begin
       if (start_game == 1 )
        begin
            state_next = state2;
            Num_val_next = RandNumGen;
        end
      end
     state2:
      begin
        if (submit)
         begin
         state_next = state3;
         end
         else 
            data_reg_next = user_in;
      end
     state3:
      begin
      PlaySound_next <= 1;  
      if(data_reg == Num_val)
            begin
                points_next = 1;
                ring_sel_next = 0;
            
            end
      else if (data_reg != Num_val)
         begin
            points_next = 0;
            ring_sel_next = 1;
         end
         

       if (~start_game)
        state_next = state1;
      end
     default:     state_next = state1; 
    endcase
 end

endmodule
