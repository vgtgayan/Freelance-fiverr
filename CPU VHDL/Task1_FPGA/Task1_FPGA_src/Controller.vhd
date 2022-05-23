----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:53:19 04/26/2018 
-- Design Name: 
-- Module Name:    Registers - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.common.all;

entity Controller is
	port ( 
		
		curr_PC     : in STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
		immediate   : in STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
		opcode 		: in STD_LOGIC_VECTOR ((opcode_width - 1) downto 0);
		result      : in STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
		Rs1_data    : in STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
		Rs2_data    : in STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
		
		new_PC      : out STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
		operand_1   : out STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
		operand_2   : out STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
		Rd_data     : out STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
		PC_incr     : out STD_LOGIC;
		PC_we       : out STD_LOGIC;
		Rd_we       : out STD_LOGIC
	     );
end Controller;

architecture Behavioral of Controller is

	--signal opcode 	: opcode_type;
	signal control_reg : STD_LOGIC_VECTOR (3 downto 0);
	signal sel_op_2 : STD_LOGIC;

begin

		-- Control signals
		PC_incr    		<= control_reg(3);
		PC_we    		<= control_reg(2);
		Rd_we			<= control_reg(1);
		sel_op_2		<= control_reg(0);
		
		
		new_PC 			<= std_logic_vector(signed(curr_PC) + signed(immediate));
		Rd_data      	<= result;
		operand_1       <= Rs1_data;

controller_process : process (opcode, sel_op_2, immediate, Rs2_data)
	begin
		
		
		

		
		-- Operand_2 mux
		if (sel_op_2 = '1') then
			operand_2       <= immediate;
		else
			operand_2       <= Rs2_data;
		end if;
		
		-- control reg [PC_incr, PC_we, Rd_we, sel_op_2]
        case opcode is
                  when "0000" =>    control_reg <= "1010";
                  when "0001" =>    control_reg <= "1011";
                  when "0010" =>    control_reg <= "1010";
                  when "0011" =>    control_reg <= "1011";
                  when "0100" =>    control_reg <= "1010";
                  when "0101" =>    control_reg <= "1011";
                  when "0110" =>    control_reg <= "1010";
                  when "0111" =>    control_reg <= "1011";
                  when "1000" =>    control_reg <= "1011";
                  when "1001" =>    control_reg <= "1011";
                  when "1010" =>    control_reg <= "0000";
                  when "1011" =>    control_reg <= "0000";
                  when "1100" =>    control_reg <= "0100";
                  when "1101" =>    control_reg <= "0100";
                  when "1110" =>    control_reg <= "0100";
                  when "1111" =>    control_reg <= "0100";
                  when others =>    control_reg <= "0000";
        end case;
		
	end process;


end Behavioral;

