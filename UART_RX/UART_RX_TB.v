`timescale 1us/1ns

module  UART_RX_TB ;

parameter Clock_PERIOD_TX = 8.68;
real Clock_PERIOD_RX;
parameter TIMEOUT = 30; // Timeout value in clock cycles


  reg RX_IN;
  reg [5:0] PRESCALE;
  reg PAR_EN;
  reg PAR_TYP;
  reg CLK_TX;
  reg CLK_RX;
  reg RST;
  wire [7:0] P_data;
  wire data_valid;
  wire par_err;
  wire stp_err;

always @(*) 
begin
Clock_PERIOD_RX = Clock_PERIOD_TX/PRESCALE;
end
// Clock generation
always #(Clock_PERIOD_TX/2)  CLK_TX = ~CLK_TX ; //Frequency = 115.2kHz (Period = 8.68us)
always #(Clock_PERIOD_RX/2)  CLK_RX = ~CLK_RX ;
// DUT instantiation
UART_TOP_RX  DUT
(
 .CLK         (CLK_RX),
 .RST         (RST),
 .PAR_EN      (PAR_EN),
 .PAR_TYP     (PAR_TYP),
 .data_valid  (data_valid),
 .P_data      (P_data),
 .RX_IN      (RX_IN),
 .PRESCALE        (PRESCALE),
 .par_err       (par_err),
 .stp_err        (stp_err)
);

// Initial block
initial 
 begin
 
	//System Functions
	$dumpfile("UART_TOP_RX_DUMP.vcd");       
	$dumpvars; 
	
	 // Initialization
    Initialize();
    
    // Reset
    Reset();
    
     //Test example
    $write("\ncorrect data ,even parity and Parity enabled ");
    TEST(1'b0,8'b00101010,1'b1,2'b10,1'b1); // correct data ,even parity and Parity enabled 
    Reset();
    $write("\ncorrect data ,odd parity and Parity enabled");
    TEST(1'b0,8'b10001110,1'b1,2'b11,1'b1); // correct data ,odd parity and Parity enabled
    Reset();
    $write("\nwrong data and Parity enabled");
    TEST(1'b0,8'b10001110,1'b0,2'b11,1'b1); // wrong data ,odd parity and Parity enabled
    Reset();
    $write("\ncorrect data and Parity disabled");
    TEST(1'b0,8'b00001010,1'b0,2'b00,1'b1); //correct data and Parity disabled
    Reset();
    $write("\nwrong stop bit");
    TEST_stop(1'b0,8'b00001010,1'b0,2'b10,1'b0); //stop bit error
    //two consecutive frames
    Reset();
    $write("\ntest two consecutive frames");
    TEST(1'b0,8'b00001010,1'b0,2'b10,1'b1);
    TEST(1'b0,8'b10001110,1'b0,2'b10,1'b1);
    Reset();
    $write("\nglitch in start bit");
    TEST_glitch(1'b1,8'b00001010,1'b1,2'b10,1'b1); //test glitch error
    Reset();
    	#50
	$stop;
end

	
	
	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////// TASKS //////////////////////////////////

//Signals initialization
task Initialize;
 begin
	CLK_TX       = 1'b0;
	CLK_RX       = 1'b0;
	PAR_EN    = 1'b0;  
	PAR_TYP   = 1'b0; 
	RX_IN=1'b1;
	PRESCALE = 6'd8;
 end
endtask
//Reset
task Reset ;
 begin
  RST = 1'b1;
  #(Clock_PERIOD_RX)
  RST = 1'b0;
  #(Clock_PERIOD_RX)
  RST = 1'b1;
 end
endtask

// Test
task TEST (
  input start,
  input reg [7:0] data,
  input parity_bit,
  input reg [1:0] parity_TYP,
  input stop
);
integer i;
integer timeout_counter;
begin
  PAR_EN = parity_TYP[1];
  PAR_TYP = parity_TYP[0];
  
  // Start bit
  RX_IN = start;
  #(Clock_PERIOD_TX);

  // Send data bits
  for (i = 0; i < 8; i = i + 1) begin
    RX_IN = data[i];
    $write("\nSent data bit: %b", data[i]);
    #(Clock_PERIOD_TX);
  end

  // Send parity bit if enabled
  if (PAR_EN) begin
    RX_IN = parity_bit;
    $write("\nSent parity bit: %b", parity_bit);
    #(Clock_PERIOD_TX);
  end
  
  // Stop bit
  RX_IN = stop;
  #(Clock_PERIOD_TX);

  // Wait for data_valid signal or timeout
  timeout_counter = 0;
  while (!data_valid && timeout_counter < TIMEOUT) begin
    #(Clock_PERIOD_RX);
    timeout_counter = timeout_counter + 1;
  end

  // Print received data or timeout message
  if (data_valid) begin
    $write("\nReceived data: %b", P_data);
  end else begin
    $write("\nTimeout occurred, data_valid not asserted and an error occurs.");
  end
  
  $write("\nParity error: %b", par_err);
  $write("\nStop error: %b", stp_err);

  #(5 * Clock_PERIOD_TX);
end
endtask

// Test
task TEST_glitch (
  input start,
  input reg [7:0] data,
  input parity_bit,
  input reg [1:0] parity_TYP,
  input stop
);
integer i;
integer timeout_counter;
begin
  PAR_EN = parity_TYP[1];
  PAR_TYP = parity_TYP[0];
  
  // Start bit
 #(2*Clock_PERIOD_RX);
    RX_IN = !start;
  #(2*Clock_PERIOD_RX);
  RX_IN = start;
  #(Clock_PERIOD_TX);

  // Send data bits
  for (i = 0; i < 8; i = i + 1) begin
    RX_IN = data[i];
    $write("\nSent data bit: %b", data[i]);
    #(Clock_PERIOD_TX);
  end

  // Send parity bit if enabled
  if (PAR_EN) begin
    RX_IN = parity_bit;
    $write("\nSent parity bit: %b", parity_bit);
    #(Clock_PERIOD_TX);
  end
  
   // Stop bit
   //#(Clock_PERIOD_TX);
    RX_IN=stop;

  // Wait for data_valid signal or timeout
  timeout_counter = 0;
  while (!data_valid && timeout_counter < TIMEOUT) begin
    #(Clock_PERIOD_RX);
    timeout_counter = timeout_counter + 1;
  end

  // Print received data or timeout message
  if (data_valid) begin
    $write("\nReceived data: %b", P_data);
  end else begin
    $write("\na glitch is found in the start bit .");
  end
  
  $write("\nParity error: %b", par_err);
  $write("\nStop error: %b", stp_err);

  #(5 * Clock_PERIOD_TX);
end
endtask
// Test
task TEST_stop (
  input start,
  input reg [7:0] data,
  input parity_bit,
  input reg [1:0] parity_TYP,
  input stop
);
integer i;
integer timeout_counter;
begin
  PAR_EN = parity_TYP[1];
  PAR_TYP = parity_TYP[0];
  
  // Start bit
  RX_IN = start;
  #(Clock_PERIOD_TX);

  // Send data bits
  for (i = 0; i < 8; i = i + 1) begin
    RX_IN = data[i];
    $write("\nSent data bit: %b", data[i]);
    #(Clock_PERIOD_TX);
  end

  // Send parity bit if enabled
  if (PAR_EN) begin
    RX_IN = parity_bit;
    $write("\nSent parity bit: %b", parity_bit);
    #(Clock_PERIOD_TX);
  end
  
  //#(Clock_PERIOD_TX)
    RX_IN=stop;
 #(Clock_PERIOD_TX)
  // Wait for data_valid signal or timeout
  timeout_counter = 0;
  while (!data_valid && timeout_counter < TIMEOUT) begin
    #(Clock_PERIOD_RX);
    timeout_counter = timeout_counter + 1;
  end

  // Print received data or timeout message
  if (data_valid) begin
    $write("\nReceived data: %b", P_data);
  end else begin
    $write("\nstop bit error occurs.");
  end
  
  $write("\nParity error: %b", par_err);
  $write("\nStop error: %b", stp_err);

  #(5 * Clock_PERIOD_TX);
end
endtask
endmodule