module RST_SYNC#(parameter NUM_STAGES)
(
  input RST,
  input CLK,
  output SYNC_RST
  );
  
   reg [NUM_STAGES-1:0] sync_reg;

    always @(posedge CLK or negedge RST) begin
        if (!RST)
            sync_reg <= 0; // Force reset
        else
            sync_reg <= {sync_reg[NUM_STAGES-2:0], 1'b1}; // Shift in '1'
    end

    assign SYNC_RST = sync_reg[NUM_STAGES-1];

endmodule
