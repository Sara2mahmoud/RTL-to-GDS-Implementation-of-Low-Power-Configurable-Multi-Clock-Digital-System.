module FSM (
  input wire CLK,
  input wire RST, 
  input wire RX_IN,
  input wire PAR_EN,
  input wire [5:0] edge_cnt,
  input wire [3:0] bit_cnt,
  input wire par_err,
  input wire strt_glitch,
  input wire stp_err,
  input wire [5:0] PRESCALE,
  output reg data_samp_en,
  output reg enable,
  output reg deser_en,
  output reg par_chk_en,
  output reg stp_chk_en,
  output reg strt_chk_en,
  output reg data_valid
  );
  
  
localparam  [2:0]    IDLE = 3'b000,
                     START = 3'b001,
                     DATA = 3'b010,
                     PARITY=3'b011,
                     STOP=3'b100;
reg    [2:0]         current_state,
                     next_state ; 

// state transition

always @(posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
     current_state <= IDLE ;
   end
  else
   begin
     current_state <= next_state ;
   end
 end
 
// next_state logic
always @(*)
 begin
  case(current_state)
  IDLE     :  begin
            if (RX_IN == 1'b0 && !strt_glitch) begin
              next_state = START;
               end else begin
              next_state = IDLE;          		  
             end
             end
                            		  
  START       :  begin
                if(strt_glitch==1'b1)
                  next_state = IDLE;
                else if(bit_cnt >= 4'b0010 && bit_cnt <= 4'b1001)
                  next_state = DATA;
                else
                  next_state = START ;
                end              
   DATA: begin
           if (bit_cnt == 4'b1010) 
           begin
             next_state = (PAR_EN) ? PARITY : STOP;
          end 
          else 
          begin
           next_state = DATA;
         end
          end
	 PARITY     : begin
                if(bit_cnt==4'b1011)
                  next_state = STOP;
                else
                  next_state = PARITY;
                end    
   STOP      : begin
                if(bit_cnt==4'b1011 && edge_cnt==PRESCALE  && PAR_EN)
                  next_state = IDLE;
                else if(bit_cnt==4'b1010 && PAR_EN==1'b0 && edge_cnt==PRESCALE)
                  next_state = IDLE;  
                else
                  next_state = STOP;
                end                        
  default :   next_state = IDLE ;		 
  
  endcase
  end
 // output logic
always @(*)
 begin
   data_samp_en = 1'b0;
   enable = 1'b0;
   deser_en = 1'b0;
   par_chk_en = 1'b0;
   stp_chk_en = 1'b0;
   strt_chk_en = 1'b0;
  data_valid = 1'b0;
  case(current_state)
  IDLE     : begin
                deser_en = 1'b0;
                par_chk_en = 1'b0;
                stp_chk_en = 1'b0;
                strt_chk_en = 1'b0;
                data_valid = 1'b0; 
                 enable = 1'b0;
                 data_samp_en = 1'b0; 
                if(RX_IN==1'b0 && !strt_glitch)
                  begin
                 enable = 1'b1;
                 data_samp_en = 1'b1;
                 data_valid=1'b0;
                  end
             else if (strt_glitch)
                 begin
                 enable = 1'b0;
                 data_samp_en = 1'b0;
                 data_valid=1'b0; 
                end   	  
             end
  START       :  begin
                 enable = 1'b1;
                 data_samp_en = 1'b1;
                 strt_chk_en=1'b1; 
                end         
  DATA      : begin
                 enable = 1'b1;
                 data_samp_en = 1'b1;
               if(strt_glitch==1'b0 && edge_cnt>=(PRESCALE/2)+1 && edge_cnt<=PRESCALE )
                  deser_en=1'b1;
                end               
	 PARITY     : begin
	               deser_en=1'b0;
	               enable = 1'b1;
                 data_samp_en = 1'b1;
                 par_chk_en = 1'b1;
                end    
   STOP      : begin
                 stp_chk_en = 1'b1;
                 deser_en=1'b0;
                 enable = 1'b1;
                 data_samp_en = 1'b1;
                if(stp_err==0 && par_err==0 && edge_cnt==PRESCALE)
                  begin
                 data_valid = 1'b1;                   
                  end 
                else if(stp_err==1 || par_err==1 && edge_cnt==PRESCALE)
                  begin
                  enable = 1'b0;
                 data_samp_en = 1'b0;
                 end
                end  
                                      
  default : 
  begin
  data_samp_en = 1'b0;
   enable = 1'b0;
   deser_en = 1'b0;
   par_chk_en = 1'b0;
   stp_chk_en = 1'b0;
   strt_chk_en = 1'b0;
  data_valid = 1'b0; 
  end  		 
  endcase
  end
  
endmodule

  
  
