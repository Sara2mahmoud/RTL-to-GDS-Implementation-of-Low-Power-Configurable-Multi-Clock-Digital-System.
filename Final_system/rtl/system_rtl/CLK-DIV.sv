module ClkDiv(
  input wire I_ref_clk,
  input wire I_rst_n,
  input wire I_clk_en,
  input wire [7:0] I_div_ratio,
  output wire o_div_clk
  );
  
  wire ClK_DIV_EN;
  integer  count;                                                                       
  reg div_clk;
  reg flag;               
  wire is_odd;
  
  assign ClK_DIV_EN = I_clk_en && (I_div_ratio != 8'd0) && (I_div_ratio != 8'd1);
  assign is_odd = I_div_ratio[0];
  assign o_div_clk = ClK_DIV_EN ? div_clk : I_ref_clk;
  
  always @(posedge I_ref_clk or negedge I_rst_n) 
  begin 
    if (!I_rst_n)
     begin
      count <= 0;
      div_clk <= 0;  
      flag <= 1'b1;
    end 
    else if (ClK_DIV_EN)
     begin
     count <= count + 1'b1;
      if (!is_odd && (count == I_div_ratio >> 1)) 
      begin
        count <= 1;
        div_clk <= ~div_clk;
      end 
      else if (is_odd && ((count == (I_div_ratio >> 1) && !flag) || (is_odd && count == ((I_div_ratio >> 1) + 1) && flag))) 
      begin  
        count <= 1;
        div_clk <= ~div_clk;                    
        flag <= ~flag;
      end 
      else 
      begin
        count <= count + 1'b1;
      end
    end
  end
  
endmodule
