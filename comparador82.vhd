library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity comparador82 is
Generic (
        CLK_HZ : integer := 50000000 -- Ex: 50MHz
);
Port (
	 clk_in   : in  STD_LOGIC;
    reg_in: in std_logic_vector(26 downto 0);
    A_equal_B: out std_logic-- '1' if A = B else '0'
);
end comparador82;

architecture Behavioral of comparador82 is
	 
	 signal limit   : integer := 0;
	 signal limit_vec : std_logic_vector(26 downto 0);
	 signal bitwise_result : std_logic_vector(26 downto 0);

    -- Função auxiliar para calcular o limite com precisão de 4 casas decimais
    -- Cálculo: (CLK_HZ / (2 * Freq)) - 1
    function calc_limit(freq_x100000 : integer; clock : integer) return integer is
    begin
        return (integer(real(clock) * 100000.0 / real(freq_x100000))) - 1;
    end function;
	 
begin
	process(clk_in, bitwise_result)
		variable temp: std_logic;
	begin
		if rising_edge(clk_in) then
			limit <= calc_limit(824100, CLK_HZ);
			limit_vec <= std_logic_vector(to_signed(limit, limit_vec'length));
			bitwise_result <= (limit_vec and reg_in);
			
			temp := '1';
			for i in bitwise_result'range loop
				temp := temp and bitwise_result(i);
			end loop;
			
			A_equal_B <= temp;
		end if;
	end process;	
end Behavioral;