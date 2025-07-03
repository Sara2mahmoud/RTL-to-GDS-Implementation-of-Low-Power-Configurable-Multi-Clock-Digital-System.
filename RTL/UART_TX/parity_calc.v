module parity_calc #(parameter IN_WIDTH=8)(
 input wire [IN_WIDTH-1:0] P_DATA,
 input wire DATA_VALID,
 input wire CLK,
 input wire RST,
 input wire PAR_TYP,
   input wire BUSY, 
output reg par_bit
);

//reg [IN_WIDTH-1:0] xor_result;
always @(posedge CLK or negedge RST) 
 begin
    if (!RST) 
    begin
       // xor_result <= 8'b0;
        par_bit <= 1'b0; 
    end 
    else if(DATA_VALID&&!BUSY) 
    begin
        //xor_result <= P_DATA ^ 8'b00000000;
        par_bit <= (PAR_TYP) ? (~^P_DATA):(^P_DATA) ;
    end 
        
    
end

endmodule