module SYS_TOP #(parameter DATA_WIDTH = 8)
(
  input  wire RST,
  input  wire UART_CLK,
  input  wire REF_CLK,
  input  wire RX_IN,
  output wire TX_OUT
);

wire SYNC_UART_RST, SYNC_REF_RST, UART_TX_CLK, UART_RX_CLK, UART_TX_Busy,UART_RX_V_OUT, CLKG_EN, UART_RX_V_SYNC;
wire par_err, stp_err, UART_TX_VLD;
wire [DATA_WIDTH-1:0] Operand_A, Operand_B, UART_Config, DIV_RATIO, DIV_RATIO_RX;
wire [DATA_WIDTH-1:0] UART_RX_OUT,UART_RX_SYNC;
wire [DATA_WIDTH-1:0] UART_TX_RD_DATA, WR_DATA_CTRL_FIFO;
wire WrEn, RdEn;
wire [3:0] Address;
wire [DATA_WIDTH-1:0] WrData, RdData_REG;
wire RdData_VLD;
wire ALU_EN;
wire [3:0] ALU_FUN;
wire [DATA_WIDTH*2-1:0] ALU_OUT;
wire ALU_OUT_VALID;
wire ALU_CLK;
wire FIFO_FULL, rempty;

// RST_SYNCHRONIZER
RST_SYNC #(.NUM_STAGES(2)) U0_RST_SYNC (
  .RST(RST),
  .CLK(UART_CLK),
  .SYNC_RST(SYNC_UART_RST)
);

RST_SYNC #(.NUM_STAGES(2)) U1_RST_SYNC (
  .RST(RST),
  .CLK(REF_CLK),
  .SYNC_RST(SYNC_REF_RST)
);

// DATA SYNCHRONIZER
DATA_SYNC #(.NUM_STAGES(2), .BUS_WIDTH(DATA_WIDTH)) U0_ref_sync (
  .CLK(REF_CLK),
  .RST(SYNC_REF_RST),
  .unsync_bus(UART_RX_OUT),
  .bus_enable(UART_RX_V_OUT),
  .sync_bus(UART_RX_SYNC),
  .enable_pulse_d(UART_RX_V_SYNC)
);

// REGISTER FILE
RegFile #(.WIDTH(DATA_WIDTH), .DEPTH(16), .ADDR(4)) RegFile_U0 (
  .CLK(REF_CLK),
  .RST(RST),
  .WrEn(WrEn),
  .RdEn(RdEn),
  .Address(Address),
  .WrData(WrData),
  .RdData(RdData_REG),
  .RdData_VLD(RdData_VLD),
  .REG0(Operand_A),
  .REG1(Operand_B),
  .REG2(UART_Config),
  .REG3(DIV_RATIO)
);

// ALU
ALU #(.OPER_WIDTH(DATA_WIDTH), .OUT_WIDTH(DATA_WIDTH*2)) ALU_U0 (
  .A(Operand_A),
  .B(Operand_B),
  .EN(ALU_EN),
  .ALU_FUN(ALU_FUN),
  .CLK(ALU_CLK),
  .RST(RST),
  .ALU_OUT(ALU_OUT),
  .OUT_VALID(ALU_OUT_VALID)
);

// UART RX/TX
UART_RX_TX_TOP UART_RX_TX_TOP_U0 (
  .UART_TX_CLK(UART_TX_CLK),
  .UART_RX_CLK(UART_RX_CLK),
  .RX_IN(RX_IN),
  .F_Empty(!rempty),
  .PAR_EN(UART_Config[0]),
  .RST(SYNC_UART_RST),
  .PAR_TYP(UART_Config[1]),
  .UART_config(UART_Config[7:2]),
  .RD_DATA(UART_TX_RD_DATA),
  .TX_OUT(TX_OUT),
  .BUSY(UART_TX_Busy),
  .par_err(par_err),
  .stp_err(stp_err),
  .P_data(UART_RX_OUT),
  .data_valid(UART_RX_V_OUT)
);

// FIFO
FIFO_TOP FIFO_TOP_U0 (
  .WDATA(WR_DATA_CTRL_FIFO),
  .winc(UART_TX_VLD),
  .wclk(REF_CLK),
  .wrst_n(SYNC_REF_RST),
  .rinc(UART_TX_Busy_PULSE),
  .rclk(UART_TX_CLK),
  .rrst_n(SYNC_UART_RST),
  .wfull(FIFO_FULL),
  .rdata(UART_TX_RD_DATA),
  .rempty(rempty)
);

// SYSTEM CONTROL
sys_ctrl #(.IN_WIDTH(DATA_WIDTH*2), .WIDTH(DATA_WIDTH)) sys_ctrl_U0 (
  .CLK_IN(REF_CLK),
  .RST_IN(RST),
  .full_flag(FIFO_FULL),
  .Alu_Out(ALU_OUT),
  .error(par_err|stp_err),
  .Out_Valid(ALU_OUT_VALID),
  .RX_P_DATA(UART_RX_SYNC),
  .RX_D_VLD(UART_RX_V_SYNC),
  .RdData(RdData_REG),
  .RdData_Valid(RdData_VLD),
  .ALU_FUN(ALU_FUN),
  .EN(ALU_EN),
  .Gate_EN(CLKG_EN),
  .Address(Address),
  .WrEn(WrEn),
  .RdEn(RdEn),
  .WrData(WrData),
  .TX_P_DATA(WR_DATA_CTRL_FIFO),
  .TX_D_VLD(UART_TX_VLD),
  .clk_div_en(CLKDIV_EN)
);

// PULSE GENERATOR
PULSE_GEN U0_PULSE_GEN (
  .clk(UART_TX_CLK),
  .rst(SYNC_UART_RST),
  .lvl_sig(UART_TX_Busy),
  .pulse_sig(UART_TX_Busy_PULSE)
);

// CLOCK DIVIDER FOR UART TX
ClkDiv U0_ClkDiv (
  .I_ref_clk(UART_CLK),
  .I_rst_n(SYNC_UART_RST),
  .I_clk_en(CLKDIV_EN),
  .I_div_ratio(DIV_RATIO),
  .o_div_clk(UART_TX_CLK)
);

// CLOCK DIVIDER FOR UART RX
ClkDiv U1_ClkDiv (
  .I_ref_clk(UART_CLK),
  .I_rst_n(SYNC_UART_RST),
  .I_clk_en(CLKDIV_EN),
  .I_div_ratio(DIV_RATIO_RX),
  .o_div_clk(UART_RX_CLK)
);

// PRESCALE MUX
CLKDIV_MUX U0_CLKDIV_MUX (
  .IN(UART_Config[7:2]),
  .OUT(DIV_RATIO_RX)
);

// CLOCK GATING
CLK_GATE U0_CLK_GATE (
  .CLK_EN(CLKG_EN),
  .CLK(REF_CLK),
  .GATED_CLK(ALU_CLK)
);

endmodule
