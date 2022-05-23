----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2018 18:37:20
-- Design Name: 
-- Module Name: hex2sevenseg - structure
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


-- Hexadecimal to 7 segment decoder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex2sevenseg is
	port (hex: in std_logic_vector (3 downto 0);
		   leds: out std_logic_vector (6 downto 0));
end hex2sevenseg;

architecture structure of hex2sevenseg is

begin

-- LED ON: '1', LED OFF: '0'
-- |  a  |  b  |  c  |  d  |  e  |  f  | g  |
-- |leds6|leds5|leds4|leds3|leds2|leds1|leds0|
	with hex select
		leds <= "1111110" when "0000", --0
		        "0110000" when "0001",
	           "1101101" when "0010",
				  "1111001" when "0011",
				  "0110011" when "0100",
				  "1011011" when "0101",
				  "1011111" when "0110",
				  "1110000" when "0111",
				  "1111111" when "1000",
				  "1111011" when "1001",
				  "1110111" when "1010", -- A
				  "0011111" when "1011", -- b
				  "1001110" when "1100", -- C
				  "0111101" when "1101", -- d
				  "1001111" when "1110", -- E
				  "1000111" when "1111", -- F
				  "-------" when others;

end structure;
