LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY divclk IS
	GENERIC(div : INTEGER := 313);
	PORT (
		clkin : in STD_LOGIC;
		clkout : out STD_LOGIC);
	END divclk;
	
	ARCHITECTURE Behavioral OF divclk IS
	SIGNAL count : INTEGER RANGE 0 TO div := 0;
	BEGIN
	
	PROCESS(clkin)
	VARIABLE temp : STD_LOGIC := '1';
	
	BEGIN
	IF clkin'event AND clkin = '1' THEN
		IF count = div - 1 THEN
			count <= 0;
			temp := '1';
		ELSE
		count <= count + 1;
		temp := '0';
		END IF;
	clkout <= temp;
	END IF;
	
	END PROCESS;
	END Behavioral;