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

entity test is
	generic ( NC: INTEGER:= 4; -- number of cores (NI-to-NO LUTs)
			  NI: INTEGER:= 8;
			  NO: INTEGER:= 8);
	port (   clock, resetn: in std_logic;
	         E: in std_logic;
			 dyn_in:  in std_logic_vector(NC*NI - 1 downto 0);
			 dyn_out: out std_logic_vector(NC*NO - 1 downto 0);
			 v: out std_logic);	
end test;

architecture structure of test is

	component LUT_group
		generic ( NC: INTEGER:= 8; -- number of cores (NI-to-NO LUTs)
					 NI: INTEGER:= 8;
					 NO: INTEGER:= 8;
					 F: INTEGER:= 1; -- type of function (1..5)
					 file_LUT: STRING:= "LUT_values.txt");  -- contains all the functions needed (one after the other)
		port ( dyn_in: in std_logic_vector (NC*NI - 1 downto 0);
				 dyn_out: out std_logic_vector (NC*NO - 1 downto 0));
	end component;

	component dffe
		 port ( d : in  STD_LOGIC;
				  clrn: in std_logic:= '1';
				  prn: in std_logic:= '1';
				  clk : in  STD_LOGIC;
				  ena: in std_logic;
				  q : out  STD_LOGIC);
	end component;
		
	constant file_LUT: STRING:= "LUT_values"&integer'image(NI)&"to"&integer'image(NO)&".txt";		
	constant F: INTEGER:= 1;	
   -- Type of function (1..5):
	-- Function 1: Gamma correction - 0.5
	-- Function 2: Gamma correction - 2
	-- Function 3: Inverse Gamma correction - 0.5
	-- Function 4: Inverse Gamma correction - 2
	-- Function 5: Contrast Stretching - Alpha = 2, m = 0.5
	-- ....
	signal dyn_outd : std_logic_vector(NC*NO - 1 downto 0);	
	signal dyn_inq  : std_logic_vector(NC*NI - 1 downto 0);
	
	signal va: std_logic;
	
begin

-- Input register
	process (clock, resetn)
	begin
		if resetn = '0' then
			dyn_inq <= (others => '0');
		elsif (clock'event and clock = '1') then
		    if E = '1' then
		    	dyn_inq <= dyn_in;
		    end if;
		end if;
	end process;

-- Output register
	process (clock, resetn, dyn_outd)
	begin
		if resetn = '0' then
			dyn_out <= (others => '0');
		elsif (clock'event and clock = '1') then
			dyn_out <= dyn_outd;
		end if;
	end process;
		
da: dffe port map (d => E, clrn => resetn, prn => '1', clk => clock, ena => '1', q => va);
db: dffe port map (d => va, clrn => resetn, prn => '1', clk => clock, ena => '1', q => v);
             
gL: LUT_group generic map (NC => NC, NI => NI, NO => NO, F => F, file_LUT => file_LUT)
	port map (dyn_in => dyn_inq, dyn_out => dyn_outd);
	 
end structure;
