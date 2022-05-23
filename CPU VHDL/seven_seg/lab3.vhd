----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:28:32 04/26/2018 
-- Design Name: 
-- Module Name:    lab3 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab3 is
port(
	 CLK: in STD_LOGIC;
	 CLR:  in STD_LOGIC; 
	 WALKIN : in  STD_LOGIC;
	 SENSOR : in  STD_LOGIC;
	 alllights : out STD_LOGIC_VECTOR(7 downto 2);
	 walklight: out STD_LOGIC
 ); 
end lab3;

architecture Behavioral of lab3 is
component clock_divider is
 port(
	 masclk : in STD_LOGIC;
	 clear : in STD_LOGIC;
	 slowclk : out STD_LOGIC
 );
end component; 

component lab_3 is
    Port ( 
			  CLK: in STD_LOGIC;
			  CLR: in STD_LOGIC;
			  WALKIN : in  STD_LOGIC;
           SENSOR : in  STD_LOGIC;
           STREETLIGHTS : out  STD_LOGIC_VECTOR (7 downto 2);
			  WALKLIGHT: out STD_LOGIC);
end component; 

signal CLEAR, slowclk: STD_LOGIC; 
begin

CLEAR <= CLR;
 
 first_process: clock_divider
	 port map (
		 masclk=>CLK,
		 clear=>CLEAR,
		 slowclk=>slowclk
	 );
 second_process: lab_3
	 port map (
		 CLK=>slowclk,
		 CLR=>CLEAR,
		 WALKIN=>WALKIN,
		 SENSOR=>SENSOR,
		 STREETLIGHTS=>alllights,
		 WALKLIGHT=>walklight
	 );
	 
end Behavioral;

