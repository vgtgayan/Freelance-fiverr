----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2018 18:01:58
-- Design Name: 
-- Module Name: MUX - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX is
      port (x, y, z, t: in std_logic_vector(15 downto 0);
            sel: in std_logic_vector (1 downto 0);
            ODATA_LEDS: out std_logic_vector(15 downto 0));
end MUX;
architecture  Behavioral of mux is

begin
 ODATA_LEDS <= x when sel = "00" 
                 else
                  y  when  sel = "01" 
	             else
	              z when sel = "10"
	                else t;


end  Behavioral;