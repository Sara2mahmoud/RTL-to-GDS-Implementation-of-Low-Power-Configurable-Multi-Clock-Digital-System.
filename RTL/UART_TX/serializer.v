module serializer #(parameter IN_WIDTH=8) (
    input wire CLK,
    input wire RST,
    input wire [IN_WIDTH-1:0] P_DATA,
    input wire DATA_VALID,
    input wire ser_en,
    input wire BUSY,
    output reg ser_done,
    output reg ser_data
);

    integer Counter;
    reg [IN_WIDTH-1:0] LFSR;

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            ser_data <= 1'b0;
            ser_done <= 1'b0;
            LFSR <= 0;
            Counter <= 0;
        end
        else if (DATA_VALID && !BUSY) begin
            LFSR <= P_DATA;
            Counter <= 0;  // Reset counter when new data is loaded
        end
        else if (ser_en && BUSY) begin
            ser_data <= LFSR[0];  // Output takes the LSB
            
            // Shift the register bits to the right by one bit
            LFSR <= {1'b0, LFSR[IN_WIDTH-1:1]};  // Shift right and insert 0 into MSB

            // Increment counter and manage ser_done signal
            if (Counter != (IN_WIDTH - 1)) begin
                Counter <= Counter + 1;
                ser_done <= 1'b0;  // Not done yet
            end
            else begin
                Counter <= 0;
                ser_done <= 1'b1;  // Done with serialization
            end
        end
        else begin
            ser_data <= 1'b0;
            ser_done <= 1'b0;
        end
    end

endmodule
