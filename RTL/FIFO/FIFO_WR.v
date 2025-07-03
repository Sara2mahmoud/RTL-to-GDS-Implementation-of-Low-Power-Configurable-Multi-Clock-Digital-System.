module fifo_wr #(
  parameter IN_WIDTH = 3  // Width of the address bus
)(
  input winc,             // Write increment signal
  input wclk,             // Write clock
  input wrst_n,           // Write reset (active low)
  input [IN_WIDTH:0] wq2_rptr, // Read pointer synchronized to the write domain
  output wire [IN_WIDTH-1:0] waddr, // Write address
  output reg [IN_WIDTH:0] wptr,   // Write pointer in Gray code
  output reg wfull         // FIFO full flag
);

  reg [IN_WIDTH:0] wbin;    // Binary write pointer
  wire [IN_WIDTH:0] wbinnext; // Next binary write pointer
  wire [IN_WIDTH:0] wgraynext; // Next Gray code write pointer
  wire [IN_WIDTH:0] wfull_val; // Next Gray code write pointer

  // Update pointers and Gray code on clock or reset
  always @(posedge wclk or negedge wrst_n) begin
    if (!wrst_n) begin
      {wbin, wptr} <= 0;
    end else begin
      {wbin, wptr} <= {wbinnext, wgraynext};
    end
  end

  // Calculate next binary pointer and Gray code
  assign waddr = wbin[IN_WIDTH-1:0]; // Memory write address
  assign wbinnext = wbin + (winc && !wfull); // Increment binary pointer
  assign wgraynext = (wbinnext >> 1) ^ wbinnext; // Convert binary to Gray code

  // Update Gray code pointer
  always @(posedge wclk or negedge wrst_n) begin
    if (!wrst_n) begin
      wfull <= 0;
    end else begin
      wfull <= wfull_val;
    end
  end

  // FIFO full flag generation
 assign wfull_val = (wgraynext == {~wq2_rptr[IN_WIDTH:IN_WIDTH-1], wq2_rptr[IN_WIDTH-2:0]});

endmodule


