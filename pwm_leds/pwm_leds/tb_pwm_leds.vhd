LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY tb_pwm_leds IS
END tb_pwm_leds;
 
ARCHITECTURE behavior OF tb_pwm_leds IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    component pwm_leds
        port (resetn, clock: in std_logic;
              sel: in std_logic_vector (11 downto 0);
              RLED, GLED, BLED: out std_logic);
    end component;
  
   --Inputs
   signal resetn : std_logic := '0';
   signal clock : std_logic := '0';
   signal sel: std_logic_vector (11 downto 0):= (others => '0');
 	
 	--Outputs
   signal RLED, GLED, BLED : std_logic;

   -- Clock period definitions
   constant T : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pwm_leds PORT MAP (resetn => resetn, clock => clock, sel => sel, RLED => RLED, GLED => GLED, BLED => BLED);

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for T/2;
		clock <= '1';
		wait for T/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      wait for T*10; resetn <= '1';

      sel <= x"ABC";
      wait for T*1500;
      sel <= x"888";
      wait for T*1500;
      sel <= x"0A0";
      wait for T*1500;
      
      sel <= (others => '0');
      wait;
   end process;

END;
