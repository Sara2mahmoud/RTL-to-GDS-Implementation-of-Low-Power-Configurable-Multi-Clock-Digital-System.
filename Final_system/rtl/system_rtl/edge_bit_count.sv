module edge_bit_count (
  input wire CLK,              
  input wire RST,             
  input wire [5:0] PRESCALE,
  input wire enable,
  input wire PAR_EN,
  output reg [5:0] edge_cnt,
  output reg [3:0] bit_cnt
);

always @(posedge CLK or negedge RST) 
begin
  if (!RST) begin
    edge_cnt <= 6'd0;
    bit_cnt <= 4'b0000;
  end 
  else if (enable)
   begin
    edge_cnt <= edge_cnt + 6'd1; // Increment edge counter
    if (edge_cnt == PRESCALE || edge_cnt==6'd0) 
    begin
      bit_cnt <= bit_cnt + 4'd1; // Increment bit counter
    end 
    if( edge_cnt == PRESCALE)
    begin       // Reset edge_cnt after reaching PRESCALE
     edge_cnt<=6'd1;
     end
  end
   else
       begin
       bit_cnt <=4'd0; // reset bit_cnt after reaching the frame
       edge_cnt<=6'd0;
     end
end
endmodule

  
   
    
    