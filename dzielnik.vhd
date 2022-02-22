library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity dzielnik is
port(
        clk_i   : in STD_LOGIC; -- 50 Mhz
		  rst_i   : in STD_LOGIC;
        clk_divide     : out STD_LOGIC
		  
		  
    );
end dzielnik;
architecture Behavioral of dzielnik is
constant N: integer := 100000;
signal counter : integer := 49999;
signal state : STD_LOGIC := '0';
begin
	process(clk_i, rst_i) is
	begin
		if rising_edge(clk_i) then
			counter <= counter + 1;
			if counter = N/2 then
				state <= '1';
			elsif counter = N then
				state <= '0';
				counter <= 1;
			end if;
		end if;
		if rst_i = '1' then
			counter <= 0;
			state <= '0';
		end if;
	end process;
	clk_divide <= state;
end Behavioral;

