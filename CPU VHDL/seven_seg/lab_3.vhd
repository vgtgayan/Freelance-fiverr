----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:26:15 04/25/2018 
-- Design Name: 
-- Module Name:    lab_3 - Behavioral 
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

entity lab_3 is
    Port ( 
			  CLK: in STD_LOGIC;
			  CLR: in STD_LOGIC;
			  WALKIN : in  STD_LOGIC;
           SENSOR : in  STD_LOGIC;
           STREETLIGHTS : out  STD_LOGIC_VECTOR (7 downto 2);
			  WALKLIGHT: out STD_LOGIC);
end lab_3;

architecture Behavioral of lab_3 is
type states is (ST0,ST1,ST2,ST3,ST4,ST5,ST6);
signal state: states;
signal counter: STD_LOGIC_VECTOR(3 downto 0);
constant one_base: STD_LOGIC_VECTOR(3 downto 0) := "0010";
constant three_base: STD_LOGIC_VECTOR(3 downto 0) := "0110";
constant four_base: STD_LOGIC_VECTOR(3 downto 0) := "1000";
constant five_base: STD_LOGIC_VECTOR(3 downto 0) := "1010";
constant six_base: STD_LOGIC_VECTOR(3 downto 0) := "1100";
signal walking : STD_LOGIC := '0';
begin

process(CLK, CLR, WALKIN)
begin

if CLR = '1' then
	 state <= ST0;
	 counter <= "0000";
 elsif CLK'event and CLK = '1' then
 case state is
 
 when ST0 =>
	 if counter < one_base then
		 state <= ST0;
		 counter <= counter + 1;
	 else
		 state <= ST1;
		 counter <= "0000";
	 end if;
	 if WALKIN = '1' then
		walking <= '1';
		end if;

 when ST1 =>
	 if counter < six_base then
		 state <= ST1;
		 counter <= counter + 1;
	 else
		 state <= ST2;
		 counter <= "0000";
	 end if; 
	 if counter >= four_base and SENSOR = '1' then
		 state <= ST2;
		 counter <= "0000";
	 end if;
	 if WALKIN = '1' then
		walking <= '1';
		end if;

 when ST2 =>
	 if counter < one_base then
		 state <= ST2;
		 counter <= counter + 1;
	 else
		state <= ST3;
		counter <= "0000";
	 end if;
	 if WALKIN = '1' then
		walking <= '1';
		end if;

 when ST3 =>
	 if counter < one_base then
		 state <= ST3;
		 counter <= counter + 1;
	 else
		 if walking = '1' then
			state <= ST4;
			counter <= "0000";
		 else
			state <= ST5;
			counter <= "0000";
		 end if;
	 end if;
	 if WALKIN = '1' then
		walking <= '1';
		end if;

when ST4 =>
	 if counter < five_base then
		state <= ST4;
		counter <= counter + 1;
	 else
	  state <= ST5;
	  counter <= "0000";
	  walking <= '0';
	 end if;
 
 when ST5 =>
	  if counter < three_base and SENSOR = '0' then
		state <= ST5;
		counter <= counter + 1;
		end if;
	  if counter >= three_base and SENSOR = '0' then
		state <= ST6;
		counter <= "0000";
		end if;	
	  if counter < four_base and SENSOR = '1' then
		state <= ST5;
		counter <= counter + 1;
		end if;	
	  if counter >= four_base and SENSOR = '1' then
		state <= ST6;
		counter <= "0000";
		end if;	
	  if WALKIN = '1' then
		walking <= '1';
		end if;

when ST6 =>
	 if counter < one_base then
		state <= ST6;
		counter <= counter + 1;
	 else
	  state <= ST0;
	  counter <= "0000";
	 end if;
 
 when others =>
 state <= ST0;
 end case;
 end if;
 end process;
 
second: process(state)
begin
	case state is
	 when ST0 => STREETLIGHTS <= "100100"; WALKLIGHT <= '0';
	 when ST1 => STREETLIGHTS <= "001100"; WALKLIGHT <= '0';
	 when ST2 => STREETLIGHTS <= "010100"; WALKLIGHT <= '0';
	 when ST3 => STREETLIGHTS <= "100100"; WALKLIGHT <= '0';
	 when ST4 => STREETLIGHTS <= "100100"; WALKLIGHT <= '1';
	 when ST5 => STREETLIGHTS <= "100001"; WALKLIGHT <= '0';
	 when ST6 => STREETLIGHTS <= "100010"; WALKLIGHT <= '0';
	 when others => STREETLIGHTS <= "100100"; WALKLIGHT <= '0';
	end case;
end process;

end Behavioral;