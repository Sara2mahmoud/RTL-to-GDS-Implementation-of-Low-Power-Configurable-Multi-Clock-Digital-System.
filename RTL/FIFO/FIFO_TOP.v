module FIFO_TOP(
  input [7:0] WDATA,
  input winc,
  input wclk,
  input wrst_n,
  input rinc,
  input rclk,
  input rrst_n,
  output wfull,
  output [7:0] rdata,
  output rempty
  );
  wire wclken;
  wire [2:0] raddr,waddr;
  wire [3:0] rq2_wptr,wq2_rptr;
  wire [3:0] rptr,wptr;
  
  
FIFO_buffer #(
  .in_width(8) // Assuming the parameter name in FIFO_buffer is in_width
) fifo_mem (
  .clk(wclk),
  .WDATA(WDATA),
  .wclken(wclken),
  .winc(winc),
  .wfull(wfull),
  .waddr(waddr),
  .raddr(raddr),
  .RDATA(rdata)
);

 fifo_wr #(
.IN_WIDTH(3)
) fifo_wr_u0(
    .winc(winc),
    .wclk(wclk),
    .wrst_n(wrst_n),
    .wq2_rptr(wq2_rptr),
    .waddr(waddr),
    .wptr(wptr),
    .wfull(wfull)
);

fifo_rd #(.ADDRSIZE(3))
fifo_rd_u0
 (
    .rinc(rinc),
    .rclk(rclk),
    .rrst_n(rrst_n),
    .rq2_wptr(rq2_wptr),
    .rempty(rempty),
    .raddr(raddr),
    .rptr(rptr)
);

 DF_SYNC DF_SYNC_rd(
  .pointer_in(rptr),
  .clk_in(wclk),
  .rst_n(wrst_n),
  .pointer_out(wq2_rptr)
  );
  
   DF_SYNC DF_SYNC_wr(
  .pointer_in(wptr),
  .clk_in(rclk),
  .rst_n(rrst_n),
  .pointer_out(rq2_wptr)
  );

endmodule

  
