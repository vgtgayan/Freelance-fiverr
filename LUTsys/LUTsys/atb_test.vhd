LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

use std.textio.all;
use ieee.std_logic_textio.all;

ENTITY atb_test IS
	generic (NC: INTEGER:= 4;
			 NI: INTEGER:= 8;
			 NO: INTEGER:= 8);
END atb_test;
 
ARCHITECTURE behaviour OF atb_test IS 
		
   -- Component Declaration for the Unit Under Test (UUT) 
	-- For Post-Route simulation: what we are instantiating is the test_timesim.vhd
	-- that has no generics
	component test	
			port (   clock, resetn: in std_logic;
			         E: in std_logic;
			         dyn_in:  in std_logic_vector(NC*NI - 1 downto 0);
					 dyn_out: out std_logic_vector(NC*NO - 1 downto 0);
					 v: out std_logic);	
	end component;
    
   --Inputs
    signal clock, resetn: std_logic:= '0';
    signal E: std_logic := '0';
	signal dyn_in: std_logic_vector (NC*NI -1 downto 0);	
		
 	--Outputs
 	signal v: std_logic;
	signal dyn_out: std_logic_vector (NC*NO -1 downto 0);
		
	-- Other signals
	type schunkI is array (NC-1 downto 0) of std_logic_vector(NI-1 downto 0);
	type schunkO is array (NC-1 downto 0) of std_logic_vector(NO-1 downto 0);
	signal data_in: schunkI;
	signal data_out: schunkO;
		
	--constant in_bench: STRING:="in_bench.txt"; -- make sure to provide the proper file
	constant in_bench: STRING:= "in_benchNI"&integer'image(NI)&".txt"; -- make sure to provide the proper file	
	constant out_bench: STRING:= "out_benchNI"&integer'image(NI)&"_NO"&integer'image(NO)&".txt";	
   -- Clock period definitions
	constant PERIOD: time:= 20 ns; -- 50 MHz clock
	constant DUTY_CYCLE: real:= 0.5;
	constant OFFSET: time:= 100 ns;
	
	signal count: integer;	
begin
 
	-- Instantiate the Unit Under Test (UUT)
   uut: test port map (clock => clock, resetn => resetn, E => E, dyn_out => dyn_out, dyn_in => dyn_in, v => v);
 
   -- This is a nice way to create vector signals that are easy to see in the waveform
   ji: for i in 0 to NC-1 generate
			 dyn_in((i+1)*NI - 1 downto i*NI) <= data_in (i);
			 data_out(i) <= dyn_out((i+1)*NO - 1 downto i*NO);
		 end generate;

	-- Clock Process Definition
	ck: process
		 begin
			wait for OFFSET; -- Wait 100 ns for global reset to finish
			clock_loop: loop -- loop that defines the PLB_clock
				clock <= '0';
				wait for (PERIOD - (PERIOD*DUTY_CYCLE));
				clock <= '1';				
				wait for (PERIOD*DUTY_CYCLE);
			end loop clock_loop;
		 end process;

		 
   -- Stimulus process
	-- Every pixel processing block will receive the same input
   stim_proc: process
        file IN_FILE: TEXT open READ_MODE is in_bench;
        variable BUFI: line;
        variable VAR: std_logic_vector (NI-1 downto 0);
   begin		
      
	  bp: for i in 0 to NC-1 loop
	          data_in(i) <= (others => '0');
			  --dyn_in((i+1)*NI - 1 downto i*NI) <= (others => '0');					
		  end loop;
		
      wait for OFFSET; resetn <= '0';	
	  wait for 3*PERIOD; resetn <= '1';
	
	 E <='1';
	  -- Testing every single possiblity
		lo: for j in 0 to 2**NI - 1 loop
				lp: for i in 0 to NC -1 loop	
				         data_in(i) <=  conv_std_logic_vector(j,NI);			    			
					 end loop;						
					 wait for PERIOD;	
			 end loop;
		
		E <= '0';
		wait for 2*PERIOD;
		
		ep: for i in 0 to NC-1 loop
		            data_in(i) <= (others => '0');				
			 end loop;
			 
	    wait for 4*PERIOD;
        
        E <= '1';
        l_tb: loop
                 exit l_tb when endfile(IN_FILE);
                 readline (IN_FILE, BUFI);
                 read (BUFI, var); -- can also use hread is you know that data is multiple of 4.
    			 lcp: for i in 0 to NC -1 loop		
    			          data_in(i) <= var;                        
                     end loop;          
                 wait for PERIOD;
               end loop;
        E<='0';		
        ecp: for i in 0 to NC-1 loop
                 data_in(i) <= (others => '0');                
            end loop;                     
	    	
      wait;
   end process;
   
   tb_o: process
            file OUT_FILE: TEXT open WRITE_MODE is out_bench;
            variable BUFO: line;
            variable OVAR: std_logic_vector (NC*NO -1 downto 0);
          begin
            count <= 0;
            lp: loop
                    wait until v = '1' and (clock'event and clock='1');
                    if count = 2**NI then -- this is when 2**NI values have been already captured
                                         -- This is to capture only what we want (data processed from the input text file)
                         OVAR:= dyn_out;
                         write(BUFO, OVAR); --use hwrite if you know it's gonna work!
                         writeline(OUT_FILE, BUFO);
                    else                       
                         count <= count + 1;
                    end if;
                    wait for PERIOD;
                end loop;            
          end process;
end;
