module FIFO_buffer #(parameter in_width = 8)(
  input clk,
  input [in_width-1:0] WDATA,
  input wclken,
  input winc,
  input wfull,
  input [2:0] waddr,
  input [2:0] raddr,
  output [in_width-1:0] RDATA
  );
//assign wclken = ~wfull&winc;
reg [in_width-1:0] FIFO [7:0];
always@(posedge clk)
begin
   if(~wfull&winc)
        begin
          FIFO[waddr]<=WDATA;
        end
    end
    assign RDATA=FIFO[raddr];
  endmodule
