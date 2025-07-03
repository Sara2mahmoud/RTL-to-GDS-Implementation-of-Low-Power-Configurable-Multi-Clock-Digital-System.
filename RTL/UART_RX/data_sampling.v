module data_sampling (
  input wire CLK,              
  input wire RST,             
  input wire [5:0] PRESCALE,
  input wire data_samp_en,
  input wire RX_IN,
  input wire [5:0] edge_cnt,
  output reg sampled_bit
);

localparam  [1:0]    PRES8 = 2'b00,
                     PRES16 = 2'b01,
                     PRES32 = 2'b10;

reg [1:0]  current_PRESCALE;                     
reg [2:0]  samples;           // Register to store 3 samples
reg        sample_ready;      // Flag to indicate samples are ready

always @(posedge CLK or negedge RST  ) 
begin
  if (!RST) 
  begin
    sampled_bit <= 1'b0;
    samples <= 3'b000;
    sample_ready <= 1'b0;
  end 
    else if (!data_samp_en)
  begin
    samples <= 3'b000;
    sample_ready <= 1'b0;
    //sampled_bit<=1'b0;
  end
  else if (data_samp_en && sample_ready)
  begin
    sampled_bit <= (samples[0] & samples[1]) | (samples[1] & samples[2]) | (samples[2] & samples[0]);
    sample_ready <= 1'b0; // Clear the sample_ready flag after updating sampled_bit
  end
  else 
  begin
    case (current_PRESCALE)
      PRES8: begin
        if(edge_cnt == 6'd3) samples[0] <= RX_IN; 
        if(edge_cnt == 6'd4) samples[1] <= RX_IN;
        if(edge_cnt == 6'd5) 
        begin
          samples[2] <= RX_IN;
          sample_ready <= 1'b1;
        end
      end
      PRES16: begin
        if(edge_cnt == 6'd7) samples[0] <= RX_IN; 
        if(edge_cnt == 6'd8) samples[1] <= RX_IN;
        if(edge_cnt == 6'd9) 
        begin
          samples[2] <= RX_IN;
          sample_ready <= 1'b1;
        end
      end
      PRES32: begin
        if(edge_cnt == 6'd15) samples[0] <= RX_IN; 
        if(edge_cnt == 6'd16) samples[1] <= RX_IN;
        if(edge_cnt == 6'd17) 
        begin
          samples[2] <= RX_IN;
          sample_ready <= 1'b1;
        end
      end
      default: begin
        samples <= 3'b000;
        sample_ready <= 1'b0;
      end
    endcase
  end
end

// Combinational logic to determine the prescale value
always @(*) 
begin
  case (PRESCALE)
    6'd8: current_PRESCALE = PRES8;
    6'd16: current_PRESCALE = PRES16;
    6'd32: current_PRESCALE = PRES32;
    default: current_PRESCALE = PRES8; // Default case
  endcase
end

endmodule
