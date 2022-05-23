---------------------------------------------------------------------------
-- This VHDL file was developed by Daniel Llamocca (2017).  It may be
-- freely copied and/or distributed at no cost.  Any persons using this
-- file for any purpose do so at their own risk, and are responsible for
-- the results of such use.  Daniel Llamocca does not guarantee that
-- this file is complete, correct, or fit for any particular purpose.
-- NO WARRANTY OF ANY KIND IS EXPRESSED OR IMPLIED.  This notice must
-- accompany any copy of this file.
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

use std.textio.all;
use ieee.std_logic_textio.all;

-- Assumption: LUT_val has 256 positions of 8 bits.
entity LUT_NItoNO is
	generic ( NI: INTEGER:= 8;
			  NO: INTEGER:= 8;
			  F: INTEGER:= 5; -- type of function (1..5)
			  file_LUT: STRING:= "LUT_values.txt"); -- file where the numerical values are stored
	-- Function F = 1: Gamma correction - 0.5
	-- Function F = 2: Gamma correction - 2
	-- Function F = 3: Inverse Gamma correction - 0.5
	-- Function F = 4: Inverse Gamma correction - 2
	-- Function F = 5: Contrast Stretching - Alpha = 2, m = 0.5
	-- ...
	port (	LUT_in: in std_logic_vector (NI-1 downto 0);
			LUT_out: out std_logic_vector (NO-1 downto 0)
			);
end LUT_NItoNO;

architecture structure of LUT_NItoNO is

	constant START_POINTER: INTEGER:= (F-1)*(2**NI + 1) + 1;	
	type chunk is array (2**NI -1 downto 0) of std_logic_vector (NO-1 downto 0);
	
	impure function ReadfromFile (FileName: in string; P: in integer) return chunk is
		FILE IN_FILE  : text open read_mode is FileName; -- VHDL 93 declaration
		variable BUFF : line;
		variable val  : chunk;
	begin
	   if P /= 1 then 
			for j in 1 to P-1 loop
				readline (IN_FILE, BUFF); -- It positionates the pointer to where we should start
			end loop;
		end if;
		
		for i in 0 to 2**NI - 1 loop
			readline (IN_FILE, BUFF);
			read (BUFF, val(i));
		end loop;

		return val;
	end function;	
	
	constant LUT_val: chunk:= ReadFromFile(file_LUT, START_POINTER); -- binary values

begin
	
	LUT_out <= LUT_val(conv_integer(LUT_in));

end structure;