LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY speed_count IS
	GENERIC(div1 : INTEGER := 1000);
	PORT (
		clk_in : in STD_LOGIC;
		clk_out : out STD_LOGIC);
	END speed_count;
	
	ARCHITECTURE Behavioral OF speed_count IS
	SIGNAL count1 : INTEGER RANGE 0 TO div1 := 0;
	BEGIN
	
	PROCESS(clk_in)
	VARIABLE temp1 : STD_LOGIC := '1'; 
	
	BEGIN
	IF clk_in'event AND clk_in = '1' THEN
		IF count1 = div1 - 1 THEN
			count1 <= 0;
			temp1 := '1';
		ELSE
		count1 <= count1 + 1;
		temp1 := '0';
		END IF;
	clk_out <= temp1;
	END IF;
	
	END PROCESS;
	END Behavioral;