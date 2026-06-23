library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity TimeCounter is
    Generic (
        CLK_FREQ_HZ : integer := 100000000 
    );
    Port (
        clk        : in STD_LOGIC;
        in_signal  : in STD_LOGIC;
        per_clocks : out integer range 0 to 100000000 - 1
    );
end TimeCounter;

architecture Behavioral of TimeCounter is
    signal ticks_internal : integer range 0 to CLK_FREQ_HZ - 1 := 0;
    signal in_signal_prev : STD_LOGIC := '0'; -- Para detectar a borda
	 
begin
    process(clk)
    begin
        if rising_edge(clk) then
            -- Salva o estado anterior para detectar a borda de subida
            in_signal_prev <= in_signal;

            -- Detecta a borda de subida (0 para 1)
            if (in_signal = '1' and in_signal_prev = '0') then
                per_clocks <= ticks_internal; -- Envia o total acumulado para a saída
                ticks_internal <= 0;          -- Reseta o contador para o próximo período
            else
                -- Se não for borda, apenas incrementa
                if ticks_internal < CLK_FREQ_HZ - 1 then
                    ticks_internal <= ticks_internal + 1;
                end if;
            end if;
        end if;
    end process;
end Behavioral;
