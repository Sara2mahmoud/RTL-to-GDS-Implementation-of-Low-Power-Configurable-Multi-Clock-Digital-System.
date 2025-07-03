module ClkDiv_tb;

  // Inputs
  reg I_ref_clk;
  reg I_rst_n;
  reg I_clk_en;
  reg [7:0] I_div_ratio;

  // Outputs
  wire o_div_clk;

  // Instantiate the Unit Under Test (UUT)
  ClkDiv uut (
    .I_ref_clk(I_ref_clk),
    .I_rst_n(I_rst_n),
    .I_clk_en(I_clk_en),
    .I_div_ratio(I_div_ratio),
    .o_div_clk(o_div_clk)
  );

  // Generate a reference clock (50 MHz)
  always #5 I_ref_clk = ~I_ref_clk; // 20ns period -> 50MHz

  // Task to initialize inputs
  task initialize;
    begin
      I_ref_clk = 0;
      I_rst_n = 0;
      I_clk_en = 0;
      //I_div_ratio = 8'd0;
    end
  endtask

  // Task to apply reset
  task apply_reset;
    begin
      #10;
      I_rst_n = 0;
      #10
      I_rst_n = 1;
    end
  endtask

  // Task to test a given division ratio
  task test_division_ratio(input [7:0] ratio);
    begin
      I_clk_en = 1;
      I_div_ratio = ratio;
      // Wait for a few clock cycles
      #200;
    end
  endtask

  // Main test sequence
  initial begin
    // Initialize inputs
    initialize();

    // Apply reset
    apply_reset();

     //Test different division ratios
     //test_division_ratio(8'd4); // Test with division ratio of 4 (even)
    test_division_ratio(8'd5); // Test with division ratio of 5 (odd)
    //test_division_ratio(8'd3); // Test with division ratio of 3 (odd)
    //test_division_ratio(8'd2); // Test with division ratio of 2 (even)
    //test_division_ratio(8'd0);
    //test_division_ratio(8'd1);

    $stop;
  end

endmodule
