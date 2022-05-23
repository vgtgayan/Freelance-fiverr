----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:13:35 04/05/2018 
-- Design Name: 
-- Module Name:    task1code - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity task1code is
    Port ( input : in  STD_LOGIC_VECTOR(3 downto 0);
           seg : out  STD_LOGIC_VECTOR(6 downto 0);
			  an : out STD_LOGIC_VECTOR(3 downto 0));
end task1code;

architecture Behavioral of task1code is

begin

process(input)
begin
	 an<="0111";
    case input is
    when "0000" => 
	 seg <= "1000000"; -- "0"     
    when "0001" => 
	 seg <= "1111001"; -- "1" 
    when "0010" => 
	 seg <= "0100100"; -- "2" 
    when "0011" => 
	 seg <= "0110000"; -- "3" 
    when "0100" => 
	 seg <= "0011001"; -- "4" 
    when "0101" => 
	 seg <= "0010010"; -- "5" 
    when "0110" => 
	 seg <= "0000010"; -- "6" 
    when "0111" => 
	 seg <= "1111000"; -- "7" 
    when "1000" => 
	 seg <= "0000000"; -- "8"     
    when "1001" => 
	 seg <= "0010000"; -- "9" 
    when "1010" => 
	 seg <= "0001000"; -- a
    when "1011" => 
	 seg <= "0000011"; -- b
    when "1100" => 
	 seg <= "1000110"; -- c
    when "1101" => 
	 seg <= "0100001"; -- d
    when "1110" => 
	 seg <= "0000110"; -- E
    when "1111" => 
	 seg <= "0001110"; -- F
	 when others =>
	 seg <= "1111111"; 
    end case;
end process;

end Behavioral;

