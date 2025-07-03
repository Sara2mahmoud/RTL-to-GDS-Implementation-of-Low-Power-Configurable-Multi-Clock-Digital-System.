module UART_TOP_RX(
  input wire RX_IN,
  input wire [5:0] PRESCALE,
  input wire PAR_EN,
  input wire PAR_TYP,
  input wire CLK,
  input wire RST,
  output wire [7:0] P_data,
  output wire data_valid,
  output wire par_err,
  output wire stp_err
  );
  wire data_samp_en;
  wire enable;
  wire deser_en;
  wire par_chk_en;
  wire stp_chk_en;
  wire strt_chk_en;
  wire sampled_bit;
  wire [5:0] edge_cnt;
  wire [3:0] bit_cnt;
  wire strt_glitch;
 
  FSM FSMO_U0 (
  .CLK(CLK),
  .RST(RST), 
  .RX_IN(RX_IN),
  .PAR_EN(PAR_EN),
  .edge_cnt(edge_cnt),
  .bit_cnt(bit_cnt),
  .par_err(par_err),
  .strt_glitch(strt_glitch),
  .stp_err(stp_err),
  .PRESCALE(PRESCALE),
  .data_samp_en(data_samp_en),
  .enable(enable),
  .deser_en(deser_en),
  .par_chk_en(par_chk_en),
  .stp_chk_en(stp_chk_en),
  .strt_chk_en(strt_chk_en),
  .data_valid(data_valid)
  );
  
  data_sampling data_sampling_U0(
  .CLK(CLK),
  .RST(RST),    
  .PRESCALE(PRESCALE),
  .RX_IN(RX_IN),
  .edge_cnt(edge_cnt),
  .sampled_bit(sampled_bit),
  .data_samp_en(data_samp_en)
  );
  edge_bit_count edge_bit_count_U0(
  .CLK(CLK),
  .RST(RST),    
  .PRESCALE(PRESCALE),
  .enable(enable),
  .PAR_EN(PAR_EN),
  .edge_cnt(edge_cnt),
  .bit_cnt(bit_cnt)
);
deserializer deserializer_U0(
  .CLK(CLK),
  .RST(RST),         
  .sampled_bit(sampled_bit),     
  .deser_en(deser_en),
  .PRESCALE(PRESCALE),
  .edge_cnt(edge_cnt),
  .P_data(P_data) 
);

Parity_check Parity_check_UO(
  .CLK(CLK),
  .RST(RST),         
  .sampled_bit(sampled_bit),  
  .PAR_TYP(PAR_TYP),
  .par_chk_en(par_chk_en),
  .PRESCALE(PRESCALE),
  .edge_cnt(edge_cnt),
  .par_err(par_err),
  .P_data(P_data)
  );
  
 stop_check stop_check_U0(
  .CLK(CLK),
  .RST(RST),         
  .sampled_bit(sampled_bit),  
  .stp_chk_en(stp_chk_en),
  .edge_cnt(edge_cnt),
  .PRESCALE(PRESCALE),
  .stp_err(stp_err)
  );
  
  strt_check strt_check_U0(
  .CLK(CLK),
  .RST(RST),         
  .sampled_bit(sampled_bit),
  .PRESCALE(PRESCALE),
  .edge_cnt(edge_cnt),  
  .strt_chk_en(strt_chk_en),
  .strt_glitch(strt_glitch)
  );

endmodule  
  
  
