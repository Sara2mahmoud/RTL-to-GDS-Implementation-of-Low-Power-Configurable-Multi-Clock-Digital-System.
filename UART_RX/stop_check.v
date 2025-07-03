module stop_check(
  input wire CLK,              
  input wire RST,
  input wire  sampled_bit,
  input wire stp_chk_en,
  input wire [5:0] PRESCALE,
 input wire [5:0] edge_cnt,
  output reg stp_err
  );
  always @(posedge CLK or negedge RST) 
 begin
    if (!RST) 
    begin
      stp_err<=1'b0;
    end
    else if(stp_chk_en && edge_cnt==PRESCALE-1)
      begin
        if(sampled_bit==1'b1)
         stp_err<=1'b0;
        else
         stp_err<=1'b1;
        end
    end
    
  endmodule
