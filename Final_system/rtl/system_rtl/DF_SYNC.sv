module DF_SYNC(
  input [3:0] pointer_in,
  input clk_in,
  input rst_n,
  output reg [3:0] pointer_out
  );
  reg [3:0] pointer_2;
  always@(posedge clk_in or negedge rst_n)
  begin
    if(!rst_n)
      pointer_2<=0;
    else
      begin
        pointer_2<=pointer_in;
      end
    end
    always@(posedge clk_in or negedge rst_n)
    begin
    if(!rst_n)
      pointer_out<=0;
    else
      begin
        pointer_out<=pointer_2;
      end
    end
  endmodule
        
