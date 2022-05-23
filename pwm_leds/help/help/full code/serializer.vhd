----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2018 18:20:29
-- Design Name: 
-- Module Name: serializer - Behavioral
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
use ieee.math_real.log2;
use ieee.math_real.ceil;

-- This file works for the Nexys-4 Board with eight 7-segment displays
entity serializer is
	port (resetn, clock: in std_logic; -- resetn: active-low input, pause: active-high input
	      A, B, C, D, I, F, G, H: in std_logic_vector (3 downto 0);
			DAT_7SEG: out std_logic_vector (6 downto 0);
			AN_7SEG: out std_logic_vector (7 downto 0)); -- eight 7-segment displays
end serializer;

architecture Behavioral of serializer is
	component my_genpulse
		generic (COUNT: INTEGER:= (10**8)/2); -- (10**8)/2 cycles of T = 10 ns --> 0.5 s
		port (clock, resetn, E: in std_logic;
				Q: out std_logic_vector ( integer(ceil(log2(real(COUNT)))) - 1 downto 0);
				z: out std_logic);
	end component;
	
	component hex2sevenseg
		port (hex: in std_logic_vector (3 downto 0);
				leds: out std_logic_vector (6 downto 0));
	end component;
	
	type state is (S1, S2, S3, S4, S5, S6, S7, S8);
	signal y: state;
	
	signal s: std_logic_vector (2 downto 0);
	signal omux: std_logic_vector (3 downto 0);
	signal E: std_logic;
	signal ENt: std_logic_vector (7 downto 0);
	signal leds: std_logic_vector (6 downto 0);
	
begin


-- Counter: 0.001s
gz: my_genpulse generic map (COUNT => 10**5)
    port map (clock => clock, resetn => resetn, E => '1', z => E);

-- Multiplexor
with s select
	omux <= A when "000",
	        B when "001",
			  C when "010",
			  D when "011",
			  F when "100",
			  G when "101",
			  H when "110",
			  I when others;
			  
seg7: hex2sevenseg port map (hex => omux, leds => leds);

DAT_7SEG <= not(leds);
 
-- 3-to-8 decoder
with s select
		ENt <=  "11111110" when "000",
			    "11111101" when "001",
			    "11111011" when "010",
			    "11110111" when "011",
			    "11101111" when "100",
			    "11011111" when "101",
			    "10111111" when "110",
			    "01111111" when others;

AN_7SEG <= ENt; -- for all the 8 seven-seg displays
	 
	Transitions: process (resetn, clock, E)
	begin
		if resetn = '0' then -- asynchronous signal
			y <= S1; -- if resetn asserted, go to initial state: S1			
		elsif (clock'event and clock = '1') then
				case y is
					when S1 => if E =  '1' then y <= S2; else y <= S1; end if;
					when S2 => if E =  '1' then y <= S3; else y <= S2; end if;
					when S3 => if E =  '1' then y <= S4; else y <= S3; end if;
					when S4 => if E =  '1' then y <= S5; else y <= S4; end if;
					when S5 => if E =  '1' then y <= S6; else y <= S5; end if;
					when S6 => if E =  '1' then y <= S7; else y <= S6; end if;
					when S7 => if E =  '1' then y <= S8; else y <= S7; end if;
					when S8 => if E =  '1' then y <= S1; else y <= S8; end if;
				end case;
		end if;		
	end process;
	
	Outputs: process (y)
	begin
		case y is
			when S1 => s <= "000";
			when S2 => s <= "001";
			when S3 => s <= "010";
			when S4 => s <= "011";
			when S5 => s <= "100";
			when S6 => s <= "101";
			when S7 => s <= "110";
			when S8 => s <= "111";
		end case;
	end process;
	
end Behavioral;

