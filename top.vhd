


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top is

    Port ( clk_i : in STD_LOGIC;

           btn_i : in STD_LOGIC_VECTOR (3 downto 0);

           sw_i : in STD_LOGIC_VECTOR (7 downto 0);

           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);

           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));

end top;



architecture Behavioral of top is

component dzielnik is
port (
clk_i: in std_logic;
rst_i: in std_logic;
clk_divide: out std_logic
);
end component;

component display is 
port(
led7_seg_o: out STD_LOGIC_VECTOR(7 downto 0);
led7_an_o: out STD_LOGIC_VECTOR(3 downto 0);
digit_i: in STD_LOGIC_VECTOR(31 downto 0);
led_wait: in std_logic; 
rst_i: in std_logic );
end component;
signal sw_temp: std_logic_vector(6 downto 0):="0000000";
signal digit_32: std_logic_vector (31 downto 0):= "10011001110000001011000010100100";
signal led_wait: std_logic;

begin
dziel: dzielnik port map(
clk_i => clk_i,
rst_i => '0',
clk_divide => led_wait
);
 
wyswietlanie: display port map(
led7_seg_o => led7_seg_o,
led7_an_o => led7_an_o,
digit_i => digit_32,
led_wait => led_wait,
rst_i => '0'
);
 
 
 klawisz: process(clk_i) is
begin
if ( sw_i="0000")
then 
sw_temp <="1000000";             
     
 elsif ( sw_i="0001")
 then
 sw_temp<="1111001";
               
 elsif ( sw_i="0010")
 then
 sw_temp<="0100100";
                
   
 elsif ( sw_i="0011")
 then
 sw_temp<="0110000";

 elsif (sw_i="0100")
 then
 sw_temp<="0011001";
    
 elsif ( sw_i="0101")
 then
 sw_temp<="0010010";
   
 elsif ( sw_i="0110")
 then
 sw_temp<="0000010";
 
 elsif ( sw_i="0111")
 then
  sw_temp<="1111000";
    
elsif ( sw_i="1000")
 then
 sw_temp<="0000000";

elsif ( sw_i = "1001")
then                
sw_temp<="0010000";
   
elsif ( sw_i   = "1010")
then                
sw_temp<="0001000";
   
elsif ( sw_i = "1011")
then
sw_temp<="0000011";
   
elsif ( sw_i = "1100")
then
 sw_temp<="1000110";
   
elsif ( sw_i = "1101")
then
sw_temp<="0100001";
   
elsif ( sw_i = "1110")
then
sw_temp<="0000110";
    
elsif ( sw_i = "1111")
then            
sw_temp<="0001110";

end if;
    
 
if(sw_i(4) = '0') 
then
digit_32(7) <= '1';
else
digit_32(7) <= '0';
end if;
-- AN1
if(sw_i(5) = '0') 
then
digit_32(15) <= '1';
else
digit_32(15) <= '0';
end if;
 -- AN2
if(sw_i(6) = '0') 
then
digit_32(23) <= '1';
else
digit_32(23) <= '0';
end if;
    -- AN3
if(sw_i(7) = '0') 
then
digit_32(31) <= '1';
else
digit_32(31) <= '0';

end if;
    

--AN0
if rising_edge(clk_i) then
    
    digit_32(7)  <= not sw_i(4);
    digit_32(15) <= not sw_i(5);
    digit_32(23) <= not sw_i(6);
    digit_32(31) <= not sw_i(7);

if (btn_i(0) = '1') 
then
digit_32(0) <= sw_temp (0);
digit_32(1) <= sw_temp (1);
digit_32(2) <= sw_temp (2);
digit_32(3) <= sw_temp (3);
digit_32(4) <= sw_temp (4);
digit_32(5) <= sw_temp (5);
digit_32(6) <= sw_temp (6);
  
--AN1
elsif (btn_i(1) = '1')
then
digit_32(8) <= sw_temp (0);
digit_32(10) <= sw_temp (2);
digit_32(11) <= sw_temp (3);
digit_32(12) <= sw_temp (4);
digit_32(13) <= sw_temp (5);
digit_32(14) <= sw_temp (6);
 --AN2
elsif (btn_i(2) = '1')
then
digit_32(16) <= sw_temp (0);
digit_32(17) <= sw_temp (1);
digit_32(18) <= sw_temp (2);
digit_32(19) <= sw_temp (3);
digit_32(20) <= sw_temp (4);
digit_32(21) <= sw_temp (5);
 digit_32(22) <= sw_temp (6);
    --AN3
elsif (btn_i(3) = '1')
then
digit_32(24) <= sw_temp (0);
digit_32(25) <= sw_temp (1);
digit_32(26) <= sw_temp (2);
digit_32(27) <= sw_temp (3);
digit_32(28) <= sw_temp (4);
digit_32(29) <= sw_temp (5);
digit_32(30) <= sw_temp (6);
end if;
end if;
end process;

end Behavioral;
 
