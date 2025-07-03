`timescale 1us/1ps

module SYS_TB ();

  // Parameters
  parameter BUS_WIDTH = 8;
  parameter RF_ADDR = 4;
  parameter REF_PERIOD = 0.02;
  parameter UART_PERIOD = 0.2712673611;
  parameter TX_PERIOD = 8.68; 

  // Inputs
  reg RST;
  reg UART_CLK;
  reg REF_CLK;
  reg RX_IN;

  // Outputs
  wire TX_OUT;
  // DUT instantiation
  SYS_TOP  DUT (
    .RST(RST),
    .UART_CLK(UART_CLK),
    .REF_CLK(REF_CLK),
    .RX_IN(RX_IN),
    .TX_OUT(TX_OUT)
  );

  // Clock generation
  always #(REF_PERIOD/2)   REF_CLK = ~REF_CLK ;   //Frequency = 50 MHz
  always #(UART_PERIOD/2)  UART_CLK = ~UART_CLK ;   //Frequency = 3.6864 MHz
  
  
  
  // Initial block
  initial 
   begin
   
    //System Functions
	$dumpfile("Final_System_DUMP.vcd");       
	$dumpvars; 

	//Initialization
	Initialize();
  Reset();

  // Apply test vectors
     // Test 1: Write to Register File with correct parity
    send_uart_data(8'hAA,calc_even_parity(8'hAA)); // RF_WR_CMD
    send_uart_data(8'h04,calc_even_parity(8'h04)); // RF_WR_ADDR
    send_uart_data(8'h12,calc_even_parity(8'h12)); // RF_WR_DATA
    
    send_uart_data(8'hAA,calc_even_parity(8'hAA)); // RF_WR_CMD
    send_uart_data(8'h05,calc_even_parity(8'h05)); // RF_WR_ADDR
    send_uart_data(8'h13,calc_even_parity(8'h13)); // RF_WR_DATA
    
    send_uart_data(8'hAA,calc_even_parity(8'hAA)); // RF_WR_CMD
    send_uart_data(8'h06,calc_even_parity(8'h06)); // RF_WR_ADDR
    send_uart_data(8'h14,calc_even_parity(8'h14)); // RF_WR_DATA
    
    send_uart_data(8'hAA,calc_even_parity(8'hAA)); // RF_WR_CMD
    send_uart_data(8'h07,calc_even_parity(8'h07)); // RF_WR_ADDR
    send_uart_data(8'h15,calc_even_parity(8'h15)); // RF_WR_DATA
    
    send_uart_data(8'hAA,calc_even_parity(8'hAA)); // RF_WR_CMD
    send_uart_data(8'h08,calc_even_parity(8'h08)); // RF_WR_ADDR
    send_uart_data(8'h16,calc_even_parity(8'h16)); // RF_WR_DATA
    
    send_uart_data(8'hAA,calc_even_parity(8'hAA)); // RF_WR_CMD
    send_uart_data(8'h09,calc_even_parity(8'h09)); // RF_WR_ADDR
    send_uart_data(8'h17,calc_even_parity(8'h17)); // RF_WR_DATA
    
    send_uart_data(8'hAA,calc_even_parity(8'hAA)); // RF_WR_CMD
    send_uart_data(8'h0a,calc_even_parity(8'h0a)); // RF_WR_ADDR
    send_uart_data(8'h18,calc_even_parity(8'h18)); // RF_WR_DATA
    
    send_uart_data(8'hAA,calc_even_parity(8'hAA)); // RF_WR_CMD
    send_uart_data(8'h0b,calc_even_parity(8'h0b)); // RF_WR_ADDR
    send_uart_data(8'h19,calc_even_parity(8'h19)); // RF_WR_DATA
   /////////////////read 
   send_uart_data(8'hBB,calc_even_parity(8'hBB)); // RF_RD_CMD
    send_uart_data(8'h04,calc_even_parity(8'h04)); // RF_RD_ADDR
    
    send_uart_data(8'hBB,calc_even_parity(8'hBB)); // RF_RD_CMD
    send_uart_data(8'h05,calc_even_parity(8'h05)); // RF_RD_ADDR
    
    send_uart_data(8'hBB,calc_even_parity(8'hBB)); // RF_RD_CMD
    send_uart_data(8'h06,calc_even_parity(8'h06)); // RF_RD_ADDR
    
    send_uart_data(8'hBB,calc_even_parity(8'hBB)); // RF_RD_CMD
    send_uart_data(8'h07,calc_even_parity(8'h07)); // RF_RD_ADDR
    
    send_uart_data(8'hBB,calc_even_parity(8'hBB)); // RF_RD_CMD
    send_uart_data(8'h08,calc_even_parity(8'h08)); // RF_RD_ADDR
    
    send_uart_data(8'hBB,calc_even_parity(8'hBB)); // RF_RD_CMD
    send_uart_data(8'h09,calc_even_parity(8'h09)); // RF_RD_ADDR
    
    send_uart_data(8'hBB,calc_even_parity(8'hBB)); // RF_RD_CMD
    send_uart_data(8'h0a,calc_even_parity(8'h0a)); // RF_RD_ADDR
    
    send_uart_data(8'hBB,calc_even_parity(8'hBB)); // RF_RD_CMD
    send_uart_data(8'h0b,calc_even_parity(8'h0b)); // RF_RD_ADDR  
    // Test 4: ALU Operation with operand
    send_uart_data(8'hCC,calc_even_parity(8'hCC)); // ALU_OP_CMD
    send_uart_data(8'h34,calc_even_parity(8'h34)); // OPERAND_A
    send_uart_data(8'h56,calc_even_parity(8'h56)); // OPERAND_B
    send_uart_data(8'h02,calc_even_parity(8'h02)); // ALU_OPERATION 
    
    send_uart_data(8'hDD,calc_even_parity(8'hDD)); // RF_RD_CMD
    send_uart_data(8'h00,calc_even_parity(8'h00)); // RF_RD_ADDR
    
    /*
    // Test 2: Write to Register File with error 
    send_uart_data(8'hAA,calc_even_parity(8'hAA)); // RF_WR_CMD
    send_uart_data(8'h00,calc_even_parity(8'h05)); // RF_WR_ADDR
    send_uart_data(8'h12,calc_even_parity(8'h12)); // RF_WR_DATA --> Parity error
    */
    
  
    send_uart_data(8'hDD,calc_even_parity(8'hDD)); // RF_RD_CMD
    send_uart_data(8'h01,calc_even_parity(8'h01)); // RF_RD_ADDR   

    // Wait for operations to complete
    #250;

    // Stop the simulation
    $stop;

 end
 
 ////////////////////////////////// TASKS //////////////////////////////////

//Signals initialization
task Initialize;
 begin
   RST = 1'b1;
   UART_CLK = 1'b0;
   REF_CLK = 1'b0;
   RX_IN = 1'b1;
 end
endtask

//Reset
task Reset ;
 begin
  RST = 0;
  #10;
  RST = 1;
  #10;
 end
endtask


 // Task to send UART data
 task send_uart_data(input [BUS_WIDTH-1:0] data, input Par_bit);
   integer i;
    begin
      RX_IN = 1'b0; // Start bit
      #(TX_PERIOD);
      for (i = 0; i <BUS_WIDTH; i = i + 1) begin
        RX_IN = data[i];
        #(TX_PERIOD);
      end
      RX_IN = Par_bit; // Parity bit
      #(TX_PERIOD);
      RX_IN = 1'b1; // Stop bit
      #(TX_PERIOD);
      #(50);
    end
  endtask
  
  // Function to calculate even parity 
  function  calc_even_parity;
    input [BUS_WIDTH-1:0] data;  
    integer i;
    begin
      calc_even_parity = 0;  // Initialize parity bit to 0
      for (i = 0; i < BUS_WIDTH; i = i + 1) begin
        calc_even_parity = calc_even_parity ^ data[i];  // XOR each bit
      end
    end
  endfunction

endmodule
