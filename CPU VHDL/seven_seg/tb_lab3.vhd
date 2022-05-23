--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:05:14 04/26/2018
-- Design Name:   
-- Module Name:   D:/Downloads/Lab3/tb_lab3.vhd
-- Project Name:  Lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lab3
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_lab3 IS
END tb_lab3;
 
ARCHITECTURE behavior OF tb_lab3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lab3
    PORT(
         CLK : IN  std_logic;
         CLR : IN  std_logic;
         WALKIN : IN  std_logic;
         SENSOR : IN  std_logic;
         alllights : OUT  std_logic_vector(7 downto 2);
         walklight : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal CLR : std_logic := '0';
   signal WALKIN : std_logic := '0';
   signal SENSOR : std_logic := '0';

 	--Outputs
   signal alllights : std_logic_vector(7 downto 2);
   signal walklight : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lab3 PORT MAP (
          CLK => CLK,
          CLR => CLR,
          WALKIN => WALKIN,
          SENSOR => SENSOR,
          alllights => alllights,
          walklight => walklight
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period;
		CLK <= '1';
		wait for CLK_period;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		CLR <= '1';
      wait for 100 ns;
		CLR <= '0';
      wait for 100 ns;
		WALKIN <= 'U';
      wait for 100 ns;
		WALKIN <= '0';
      wait for 1000 ns;
		SENSOR <= 'U';
      wait for 1000 ns;
		SENSOR <= '0';
      wait for 1000 ns;
		WALKIN <= 'U';
      wait for 100 ns;
		SENSOR <= 'U';
		wait;
			
      -- insert stimulus here 
   end process;

END;