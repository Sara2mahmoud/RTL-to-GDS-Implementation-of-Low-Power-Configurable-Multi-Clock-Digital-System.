module strt_check(
  input wire CLK,              
  input wire RST,
  input wire  sampled_bit,
  input wire [5:0] edge_cnt,
  input wire [5:0] PRESCALE,
  input wire strt_chk_en,
  output reg strt_glitch
  );
  always @(posedge CLK or negedge RST) 
 begin
    if (!RST) 
    begin
      strt_glitch<=1'b0;
    end
    else if(strt_chk_en && edge_cnt==PRESCALE)
      begin
        if(sampled_bit==1'b0)
          strt_glitch<=1'b0;
        else
          strt_glitch<=1'b1;
        end
    end
  endmodule
