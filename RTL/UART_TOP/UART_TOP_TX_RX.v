module UART_RX_TX_TOP(
 input   wire                          UART_TX_CLK,
 input   wire                          UART_RX_CLK,
 input   wire                          RX_IN,
 input   wire                          RST,
 input   wire                          F_Empty,
 input   wire                          PAR_EN,
 input   wire                          PAR_TYP,
 input   wire [5:0]                    UART_config,
 input   wire [7:0]                    RD_DATA,
 output  wire                          TX_OUT,
 output  wire                          BUSY,
 output  wire                          par_err,
 output  wire                          stp_err,
 output  wire [7:0]                    P_data,
 output  wire                          data_valid
 );
 UART_TOP_RX UART_TOP_RX_UO(
  .RX_IN(RX_IN),
  .PRESCALE(UART_config),
  .PAR_EN(PAR_EN),
  .PAR_TYP(PAR_TYP),
  .CLK(UART_RX_CLK),
  .RST(RST),
  .P_data(P_data),
  .data_valid(data_valid),
  .par_err(par_err),
  .stp_err(stp_err)
  );
  UART_TX_TOP UART_TX_TOP_U0(
  .PAR_EN(PAR_EN),
  .P_DATA(RD_DATA),
  .DATA_VALID(F_Empty),
  .PAR_TYP(PAR_TYP),
  .CLK(UART_TX_CLK),
  .RST(RST),
  .TX_OUT(TX_OUT),
  .BUSY(BUSY)
  );
endmodule
