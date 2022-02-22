library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 

 
entity display is
  Port ( 
        led7_seg_o: out STD_LOGIC_VECTOR(7 downto 0);
        led7_an_o: out STD_LOGIC_VECTOR(3 downto 0);
        digit_i: in STD_LOGIC_VECTOR(31 downto 0);
        led_wait: in std_logic; 
        rst_i: in std_logic
        );
end display;
 
architecture Behavioral of display is
signal counter : integer := 1;
begin
 
process (led_wait) is
begin
if (rst_i = '1')
then
        
 led7_seg_o<="00000000";
elsif(rising_edge(led_wait))
then
    counter <= counter + 1;
    if (counter > 3)
    then
        counter <= 1;
    end if;
    if(counter = 1)
    then
        led7_an_o<="1110";
        led7_seg_o(7) <= digit_i(0);
        led7_seg_o(6) <= digit_i(1);
        led7_seg_o(5) <= digit_i(2);
        led7_seg_o(4) <= digit_i(3);
        led7_seg_o(3) <= digit_i(4);
        led7_seg_o(2) <= digit_i(5);
        led7_seg_o(1) <= digit_i(6);
        led7_seg_o(0) <= digit_i(7);
    elsif(counter = 2)
    then
        led7_an_o<="1101";
        led7_seg_o(7) <= digit_i(8);
        led7_seg_o(6) <= digit_i(9);
        led7_seg_o(5) <= digit_i(10);
        led7_seg_o(4) <= digit_i(11);
        led7_seg_o(3) <= digit_i(12);
        led7_seg_o(2) <= digit_i(13);
        led7_seg_o(1) <= digit_i(14);
        led7_seg_o(0) <= digit_i(15);
    elsif(counter = 3)
    then
      
        led7_an_o<="1011";
        led7_seg_o(7) <= digit_i(16);
        led7_seg_o(6) <= digit_i(17);
        led7_seg_o(5) <= digit_i(18);
        led7_seg_o(4) <= digit_i(19);
        led7_seg_o(3) <= digit_i(20);
        led7_seg_o(2) <= digit_i(21);
        led7_seg_o(1) <= digit_i(22);
        led7_seg_o(0) <= digit_i(23);
    elsif(counter = 4)
    then
        
        led7_an_o<="0111";
        led7_seg_o(7) <= digit_i(24);
        led7_seg_o(6) <= digit_i(25);
        led7_seg_o(5) <= digit_i(26);
        led7_seg_o(4) <= digit_i(27);
        led7_seg_o(3) <= digit_i(28);
        led7_seg_o(2) <= digit_i(29);
        led7_seg_o(1) <= digit_i(30);
        led7_seg_o(0) <= digit_i(31);
    end if;
end if;
 
end process;
 
end Behavioral;