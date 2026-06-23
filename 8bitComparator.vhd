library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparador_sequencial is
    port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        A, B     : in  std_logic_vector(7 downto 0);
        -- Saídas registradas
        A_gt_B   : out std_logic;
        A_eq_B   : out std_logic;
        A_lt_B   : out std_logic
    );
end comparador_sequencial;

architecture behavioral of comparador_sequencial is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            -- Reset assíncrono para limpar as saídas
            A_gt_B <= '0';
            A_eq_B <= '0';
            A_lt_B <= '0';
            
        elsif rising_edge(clk) then
            -- A comparação ocorre apenas na borda de subida do clock
            
            -- Comparação Maior (Greater Than)
            if unsigned(A) > unsigned(B) then
                A_gt_B <= '1';
            else
                A_gt_B <= '0';
            end if;

            -- Comparação Igual (Equal)
            if A = B then
                A_eq_B <= '1';
            else
                A_eq_B <= '0';
            end if;

            -- Comparação Menor (Less Than)
            if unsigned(A) < unsigned(B) then
                A_lt_B <= '1';
            else
                A_lt_B <= '0';
            end if;
            
        end if;
    end process;
end behavioral;