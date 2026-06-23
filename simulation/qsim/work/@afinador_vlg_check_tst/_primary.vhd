library verilog;
use verilog.vl_types.all;
entity Afinador_vlg_check_tst is
    port(
        \Out\           : in     vl_logic_vector(26 downto 0);
        wave_out        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Afinador_vlg_check_tst;
