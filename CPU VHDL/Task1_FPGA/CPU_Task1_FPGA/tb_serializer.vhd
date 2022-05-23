--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:38:49 05/05/2018
-- Design Name:   
-- Module Name:   C:/Users/gayan/Documents/FVR/CPU VHDL/Task1_FPGA/CPU_Task1_FPGA/tb_serializer.vhd
-- Project Name:  CPU_Task1_FPGA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: serializer
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
 
ENTITY tb_serializer IS
END tb_serializer;
 
ARCHITECTURE behavior OF tb_serializer IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT serializer
    PORT(
         resetn : IN  std_logic;
         clock : IN  std_logic;
         halt : IN  std_logic;
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         C : IN  std_logic_vector(3 downto 0);
         D : IN  std_logic_vector(3 downto 0);
         DAT_7SEG : OUT  std_logic_vector(6 downto 0);
         AN_7SEG : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal resetn : std_logic := '0';
   signal clock : std_logic := '0';
   signal halt : std_logic := '0';
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal C : std_logic_vector(3 downto 0) := (others => '0');
   signal D : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal DAT_7SEG : std_logic_vector(6 downto 0);
   signal AN_7SEG : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: serializer PORT MAP (
          resetn => resetn,
          clock => clock,
          halt => halt,
          A => A,
          B => B,
          C => C,
          D => D,
          DAT_7SEG => DAT_7SEG,
          AN_7SEG => AN_7SEG
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		resetn <= '0';
      wait for 100 ns;	
		resetn <= '1';
      wait for clock_period*10;

      -- insert stimulus here 
		--A <= "0001";
		wait for clock_period*(10**8)*10;
      wait;
   end process;

END;
