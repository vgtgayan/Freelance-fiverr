----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2018 18:40:28
-- Design Name: 
-- Module Name: my_genpulse - Behavioral
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
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.math_real.log2;
use ieee.math_real.ceil;

entity my_genpulse is
	generic (COUNT: INTEGER:= (10**8)/2); -- (10**8)/2 cycles of T = 10 ns --> 0.5 s
	port (clock, resetn, E: in std_logic;
			Q: out std_logic_vector ( integer(ceil(log2(real(COUNT)))) - 1 downto 0);
			z: out std_logic);
end my_genpulse;

architecture Behavioral of my_genpulse is
	constant nbits: INTEGER:= integer(ceil(log2(real(COUNT))));
	signal Qt: std_logic_vector (nbits -1 downto 0);
begin

	process (resetn, clock)
	begin
		if resetn = '0' then
			Qt <= (others => '0');
		elsif (clock'event and clock = '1') then
			if E = '1' then
				if Qt = conv_std_logic_vector (COUNT-1,nbits) then
					Qt <= (others => '0');
				else
					Qt <= Qt + conv_std_logic_vector (1,nbits);
				end if;
			end if;
		end if;
	end process;
	
	z <= '1' when Qt = conv_std_logic_vector (COUNT-1,nbits) else '0';
   Q <= Qt;
	
end Behavioral;
