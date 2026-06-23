library verilog;
use verilog.vl_types.all;
entity Afinador is
    port(
        wave_out        : out    vl_logic;
        input_clk_in    : in     vl_logic;
        input_reset     : in     vl_logic;
        input_selector  : in     vl_logic_vector(2 downto 0);
        \Out\           : out    vl_logic_vector(26 downto 0);
        Clk             : in     vl_logic;
        in_signal       : in     vl_logic
    );
end Afinador;
