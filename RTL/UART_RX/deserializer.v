module deserializer(
  input wire CLK,           // Clock input
  input wire RST,           // Reset input
  input wire sampled_bit,     // Serial input
  input wire deser_en,
  input wire [5:0] edge_cnt,
  input wire [5:0] PRESCALE,
  output wire [7:0] P_data  // Parallel output (8 bits)
  
);

reg [7:0] shift_reg;  // Shift register to hold serial data

always @(posedge CLK or negedge RST) begin
  if (!RST) begin
    shift_reg <= 8'd0;  // Reset shift register on reset
  end 
  else if (deser_en && edge_cnt==PRESCALE)
  begin
    // Shift in serial data on every clock cycle
    shift_reg <= {sampled_bit, shift_reg[7:1]};
  end
end

// Assign parallel output from shift register
assign P_data = shift_reg;

endmodule
