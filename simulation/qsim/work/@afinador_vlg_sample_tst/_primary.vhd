library verilog;
use verilog.vl_types.all;
entity Afinador_vlg_sample_tst is
    port(
        Clk             : in     vl_logic;
        in_signal       : in     vl_logic;
        input_clk_in    : in     vl_logic;
        input_reset     : in     vl_logic;
        input_selector  : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end Afinador_vlg_sample_tst;
