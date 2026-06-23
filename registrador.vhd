library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity generic_register is
    Generic ( N : integer := 8 ); -- Size of the register
    Port ( clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           load    : in  STD_LOGIC; -- Write enable
           d_in  : in  STD_LOGIC_VECTOR(N-1 downto 0);
           q_out : out STD_LOGIC_VECTOR(N-1 downto 0));
end generic_register;

architecture Behavioral of generic_register is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            q_out <= (others => '0'); -- Asynchronous clear
        elsif rising_edge(clk) then
            if load = '1' then
                q_out <= d_in; -- Update on clock edge if enabled
            end if;
        end if;
    end process;
end Behavioral;