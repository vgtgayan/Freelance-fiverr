----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:47:01 04/07/2018 
-- Design Name: 
-- Module Name:    codetask2 - Behavioral 
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

entity codetask2 is
    Port ( an : out  STD_LOGIC_VECTOR(3 downto 0);
           sw : in  STD_LOGIC_VECTOR(2 downto 0);
           seg : out  STD_LOGIC_VECTOR(6 downto 0);
           anselect : in  STD_LOGIC_VECTOR(1 downto 0);
           dp : out  STD_LOGIC_VECTOR(0 downto 0);
			  dpsel : in STD_LOGIC_VECTOR(0 downto 0));
end codetask2;

architecture Behavioral of codetask2 is

begin
process(anselect)
begin
	case (anselect) is 
	when "00" =>
	an <= "0111";
	when "01" =>
	an <= "1011";
	when "11" =>
	an <= "1101";
	when "10" =>
	an <= "1110";
	when others =>
	an <= "1111";
	end case;
end process;

process (dpsel)
begin
	case (dpsel) is
	when "0" =>
	dp <= "0";
	when "1" =>
	dp <= "1";
	when others =>
	dp <= "1";
	end case;
end process;

process (sw)
begin 
	 case (sw) is
    when "000" => 
	 seg <= "1000000"; -- "0"
    when "001" => 
	 seg <= "1111001"; -- "1" 
    when "010" => 
	 seg <= "0100100"; -- "2" 
    when "011" => 
	 seg <= "0110000"; -- "3" 
    when "100" => 
	 seg <= "0011001"; -- "4" 
    when "101" => 
	 seg <= "0010010"; -- "5" 
    when "110" => 
	 seg <= "0000010"; -- "6" 
    when "111" => 
	 seg <= "1111000"; -- "7" 
	 when others =>
	 seg <= "1111111"; 
    end case;
end process;



end Behavioral;

