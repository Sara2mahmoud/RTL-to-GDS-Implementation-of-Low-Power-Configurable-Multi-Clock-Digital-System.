module fifo_rd #(parameter ADDRSIZE=3)
 (
    input rinc,
    input rclk,
    input rrst_n,
    input [ADDRSIZE:0] rq2_wptr,
    output reg rempty,
    output [ADDRSIZE-1:0] raddr,
    output reg [ADDRSIZE:0] rptr
);

    reg [ADDRSIZE:0] rbin;
    wire [ADDRSIZE:0] rgraynext, rbinnext;

    // GRAYSTYLE2 pointer
    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n) begin
            rbin <= 0;
            rptr <= 0;
        end else begin
            rbin <= rbinnext;
            rptr <= rgraynext;
        end
    end

    // Memory read-address pointer (binary to address memory)
    assign raddr = rbin[ADDRSIZE-1:0];
    assign rbinnext = rbin + (rinc & ~rempty);
    assign rgraynext = (rbinnext >> 1) ^ rbinnext;

    // FIFO empty when the next rptr == synchronized wptr or on reset
    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n) begin
            rempty <= 1'b1;
        end else begin
            rempty <= (rgraynext == rq2_wptr);
        end
    end

endmodule

