`timescale 1us/1ns

module  UART_TB ;

parameter DATA_WIDTH = 8 ;
parameter Clock_PERIOD = 8.68;


 reg PAR_EN;
reg [DATA_WIDTH-1:0] P_DATA;
reg DATA_VALID;
reg PAR_TYP;
reg CLK;
reg RST;
wire TX_OUT;
wire BUSY;



// Clock generation
always #(Clock_PERIOD/2)  CLK = ~CLK ; //Frequency = 115.2kHz (Period = 8.68us)

// DUT instantiation
UART_TOP #(.DATA_WIDTH(DATA_WIDTH)) DUT
(
 .CLK         (CLK),
 .RST         (RST),
 .PAR_EN      (PAR_EN),
 .PAR_TYP     (PAR_TYP),
 .DATA_VALID  (DATA_VALID),
 .P_DATA      (P_DATA),
 .TX_OUT      (TX_OUT),
 .BUSY        (BUSY)
);

// Initial block
initial 
 begin
 
	//System Functions
	$dumpfile("UART_TOP_DUMP.vcd");       
	$dumpvars; 

	//Initialization
	Initialize();
  RST = 1'b1;
  #(Clock_PERIOD)
  RST = 1'b0;
  #(Clock_PERIOD)
  RST = 1'b1;
  
	//Test Case 1: Parity is enabled & Parity Type is even
    TEST('b01110101,2'b11);
	
	//Test Case 2: Parity is enabled & Parity Type is odd
    TEST('b11100101,2'b10);

	//Test Case 3: Parity is not enabled 
    TEST('b01000110,2'b00);
  
  //Test Case 4: New data while UART_TX is processing & Data_Valid is high
    PAR_EN = 1'b1;
    PAR_TYP = 1'b0;
    P_DATA = 'b01110101;
    DATA_VALID = 1'b1;
    #(Clock_PERIOD);
    P_DATA = 'b01010101;
    #(Clock_PERIOD);
    DATA_VALID = 1'b0;
    #(20*Clock_PERIOD);
    

	#100
	$stop;

 end
 
////////////////////////////////// TASKS //////////////////////////////////

//Signals initialization
task Initialize;
 begin
	CLK       = 1'b0;
	PAR_EN    = 1'b0;  
	PAR_TYP   = 1'b0; 
	DATA_VALID = 1'b0;
	P_DATA   = 'b0;
 end
endtask

//Reset
task Reset ;
 begin
  RST = 1'b1;
  #(Clock_PERIOD)
  RST = 1'b0;
  #(Clock_PERIOD)
  RST = 1'b1;
 end
endtask

//Test
task TEST (
 input reg [DATA_WIDTH-1:0] data,
 input reg [1:0]      parity
);
 integer k;
 begin
  PAR_EN = parity[1];
  PAR_TYP = parity[0];
  P_DATA= data;
  DATA_VALID = 1'b1;
  #(Clock_PERIOD);
  DATA_VALID = 1'b0;
  $write("\nTransmitted data: ");
  
 for(k=0; k<=DATA_WIDTH+2; k=k+1)
   begin
     $write("%b",TX_OUT);
     #(Clock_PERIOD);
   end
   
 end
endtask
endmodule
