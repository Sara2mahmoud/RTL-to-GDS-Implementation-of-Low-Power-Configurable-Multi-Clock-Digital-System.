module Parity_check(
  input wire CLK,              
  input wire RST,
  input wire PAR_TYP,
  input wire  sampled_bit,
  input wire [5:0] PRESCALE,
  input wire [5:0] edge_cnt,
  input wire par_chk_en,
  input wire [7:0] P_data,
  output reg par_err
  );
 wire PAR_bit;
  assign PAR_bit=(PAR_TYP) ? (~^P_data) : (^P_data);
  always @(posedge CLK or negedge RST) 
 begin
    if (!RST) 
    begin
      par_err<=1'b0;
    end
    else if(par_chk_en && edge_cnt==PRESCALE)
      begin
        if(sampled_bit==PAR_bit)
         par_err<=1'b0;
        else
         par_err<=1'b1;
        end
    end
  endmodule

