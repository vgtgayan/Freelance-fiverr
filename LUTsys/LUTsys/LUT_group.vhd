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

entity LUT_group is
	generic ( NC: INTEGER:= 4; -- number of cores (NI-to-NO LUTs)
			  NI: INTEGER:= 8;
			  NO: INTEGER:= 8;
			  F: INTEGER:= 1; -- type of function (1..5)
			  file_LUT: STRING:= "LUT_values.txt");  -- contains all the functions needed (one after the other)
	port ( dyn_in: in std_logic_vector (NC*NI - 1 downto 0);
		   dyn_out: out std_logic_vector (NC*NO - 1 downto 0));
end LUT_group;

architecture structure of LUT_group is

	component LUT_NItoNO
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
	end component;
	
	type chunkI is array (NC - 1 downto 0) of std_logic_vector (NI-1 downto 0);
	type chunkO is array (NC - 1 downto 0) of std_logic_vector (NO-1 downto 0);
	
	signal in_data: chunkI;
	signal out_data: chunkO;
	
begin

-- dyn_in, dyn_out: |1st pixel|2nd pixel|3rd pixel|...|NCth pixel|
   -- dyn_in(1st pixel) = in_data(0)
   -- dyn_in(2nd pixel) = in_data(1)
   -- dyn_in(NCth pixel) = in_data(NC-1)
gs: for i in 0 to NC - 1 generate
			in_data(NC-i-1) <= dyn_in( (i+1)*NI - 1 downto i*NI );
			dyn_out( (i+1)*NO - 1 downto i*NO ) <= out_data(NC-i-1);
	 end generate;

ga: for i in 0 to NC - 1 generate
		gi: LUT_NItoNO generic map (NI => NI, NO => NO, F => F, file_LUT => file_LUT)
		    port map (LUT_in => in_data(i), LUT_out => out_data(i));			 
	 end generate;

end structure;