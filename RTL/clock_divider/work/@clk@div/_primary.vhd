library verilog;
use verilog.vl_types.all;
entity ClkDiv is
    port(
        I_ref_clk       : in     vl_logic;
        I_rst_n         : in     vl_logic;
        I_clk_en        : in     vl_logic;
        I_div_ratio     : in     vl_logic_vector(7 downto 0);
        o_div_clk       : out    vl_logic
    );
end ClkDiv;
