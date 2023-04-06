module SongPlayer( input outcome, input clock, input reset, input playSound, output reg audioOut, output wire aud_sd);
reg [19:0] counter;
reg [31:0] time1, noteTime;
reg [9:0] msec, number;	//millisecond counter, and sequence number of musical note.
wire [4:0] note, duration;
wire [19:0] notePeriod;
wire outcom_in;
parameter clockFrequency = 100_000_000; 

assign aud_sd = 1'b1;
MusicSheet 	error (~outcome,number, notePeriod, duration	);

//BassMusicSheet datbass(number, notePeriod, duration);
always @ (posedge clock) 
  begin
	if(reset | ~playSound) 
 		begin 
          counter <=0;  
          time1<=0;  
          number <=0;  
          audioOut <=1;	
     	end
    else 
     begin
		counter <= counter + 1; 
        time1<= time1+1;
		if( counter >= notePeriod) 
           begin
                    counter <=0;  
                    audioOut <= ~audioOut ; 
           end	//toggle audio output 	
        if( time1 >= noteTime) 
           begin	
                time1 <=0; 
                if (number == 5)
                number = 5;
                else 
                number <= number + 1;  
            end  //play next note
        //if(number == 111) number <=0; // Make the number reset at the end of the song
	end
  end	
         
  always @(duration) noteTime = duration * (clockFrequency/8); 
       //number of   FPGA clock periods in one note.
endmodule   

module MusicSheet( input outcome,input [9:0] number, 
	output reg [19:0] note,//max ? different musical notes
	output reg [4:0] duration);
parameter   QUARTER = 5'b00010;//2
parameter	HALF = 5'b00100;
parameter	ONE = 2* HALF;
parameter	TWO = 2* ONE;
parameter	FOUR = 2* TWO;
parameter	THREE = 3* ONE;
parameter	THIRD = HALF/3;
parameter   ONE1 = 5'b00001;
parameter   ONE2 = ONE1*2;
parameter   ONE3 = ONE1*3;
parameter   ONE4 = ONE1*4;
parameter WHOLE = 5'b1;
parameter SXTNTH = 5'b00001;
parameter Db4= 90193,Bb3=214517,C3 = 191113,D3=170262 ,A4 =113636,C4=95556, D4=85131, E4 = 75843, F4=71586, G4 = 63776,C5 = 1046,Eb4=80353,Bb4=107258, SP = 1;  
parameter A2 = 909091,B5= 50619,G3= 127553, Db3 = 180386, F3 =143173 ,A5=56818, F5=35793,A3 =227273 ,F2 =286346 ,E3=151686,E5=37922 ;
always @ (number) begin
    case(outcome)
     0: // got it right noise
        case(number) //
            
            0	:	begin	note	=	A2;	duration	=	SXTNTH;		end
            1	:	begin	note	=	SP;	duration	=	SXTNTH;		end
            2	:	begin	note	=	A2;	duration	=	SXTNTH;		end
            3	:	begin	note	=	SP;	duration	=	SXTNTH;		end
            4	:	begin	note	=	A2;	duration	=	SXTNTH;		end
            5	:	begin	note	=	SP;	duration	=	SXTNTH;		end
            default: 	begin note = SP; duration = FOUR; 	end
        endcase
     1: // got it wrong noise
        case(number)
            0	:	begin	note	=	B5;	duration	=	SXTNTH;		end
            1	:	begin	note	=	E5;	duration	=	SXTNTH;		end
            2	:	begin	note	=	B5;	duration	=	SXTNTH;		end
            3	:	begin	note	=	E5;	duration	=	SXTNTH;		end
            4	:	begin	note	=	E5;	duration	=	SXTNTH;		end
            5	:	begin	note	=	SP;	duration	=	SXTNTH;		end
            default: 	begin note = SP; duration = FOUR; 	end
        endcase
    endcase
end
endmodule