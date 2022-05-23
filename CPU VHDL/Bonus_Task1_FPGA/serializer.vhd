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
-- Description: Seven segment module for 4 digit displays
-- 				Added extra port "halt" to display value "H"
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

entity serializer is
	port (resetn, clock: in std_logic; -- resetn: active-low input, pause: active-high input
		  halt : in std_logic; -- halt signal (will display H when high)
	      A, B, C, D: in std_logic_vector (3 downto 0);
			DAT_7SEG: out std_logic_vector (6 downto 0);
			AN_7SEG: out std_logic_vector (3 downto 0)); -- four 7-segment displays
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
	
	type state is (S1, S2, S3, S4);
	signal y: state;
	
	signal s: std_logic_vector (1 downto 0);
	signal omux: std_logic_vector (3 downto 0);
	signal E: std_logic;
	signal ENt: std_logic_vector (3 downto 0);
	signal leds: std_logic_vector (6 downto 0);
	
begin


-- Counter: 0.001s
gz: my_genpulse generic map (COUNT => 10**5)
    port map (clock => clock, resetn => resetn, E => '1', z => E);

-- Multiplexor
with s select
	omux <= A when "00",
	        B when "01",
			C when "10",
			D when others;
			  
seg7: hex2sevenseg port map (hex => omux, leds => leds);


data_7seg: process (leds, halt)
begin
	if (halt = '1') then
		DAT_7SEG <= "1001000";
	else 
		DAT_7SEG <= not(leds);
	end if;
end process;


-- 2-to-4 decoder
with s select
		ENt <=  "1110" when "00",
			    "1101" when "01",
			    "1011" when "10",
			    "0111" when "11",
			    "1111" when others;

AN_7SEG <= ENt; -- for all the 4 seven-seg displays
	 
	Transitions: process (resetn, clock, E)
	begin
		if resetn = '0' then -- asynchronous signal
			y <= S1; -- if resetn asserted, go to initial state: S1			
		elsif (clock'event and clock = '1') then
				case y is
					when S1 => if E =  '1' then y <= S2; else y <= S1; end if;
					when S2 => if E =  '1' then y <= S3; else y <= S2; end if;
					when S3 => if E =  '1' then y <= S4; else y <= S3; end if;
					when S4 => if E =  '1' then y <= S1; else y <= S4; end if;
				end case;
		end if;		
	end process;
	
	Outputs: process (y)
	begin
		case y is
			when S1 => s <= "00";
			when S2 => s <= "01";
			when S3 => s <= "10";
			when S4 => s <= "11";
		end case;
	end process;
	
end Behavioral;