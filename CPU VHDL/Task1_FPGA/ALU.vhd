library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is 
port(
    opcode      : in    std_logic_vector(3 downto 0);
    operand_1   : in    std_logic_vector(7 downto 0);
    operand_2   : in    std_logic_vector(7 downto 0);
    result      : out   std_logic_vector(7 downto 0)
    );
end entity;
architecture rtl of ALU is
    
    signal shift_num : std_logic_vector(2 downto 0);

begin

    shift_num <= operand_2 (2 downto 0);

    ALU: process(opcode, shift_num, operand_1, operand_2) is begin
        case opcode is
            when "0000" => result <= std_logic_vector(signed(operand_1) + signed(operand_2));
            when "0001" => result <= std_logic_vector(signed(operand_1) + signed(operand_2));
            when "0010" => result <= std_logic_vector(signed(operand_1) - signed(operand_2));
            when "0011" => result <= std_logic_vector(signed(operand_1) - signed(operand_2));
            when "0100" => result <= operand_1 AND operand_2;
            when "0101" => result <= operand_1 AND operand_2;
            when "0110" => result <= operand_1 OR operand_2;
            when "0111" => result <= operand_1 OR operand_2;
            when "1000" => 
                case shift_num is
                    when "000" => result <= std_logic_vector(shift_left(unsigned(operand_1),0));
                    when "001" => result <= std_logic_vector(shift_left(unsigned(operand_1),1));
                    when "010" => result <= std_logic_vector(shift_left(unsigned(operand_1),2));
                    when "011" => result <= std_logic_vector(shift_left(unsigned(operand_1),3));
                    when "100" => result <= std_logic_vector(shift_left(unsigned(operand_1),4));
                    when "101" => result <= std_logic_vector(shift_left(unsigned(operand_1),5));
                    when "110" => result <= std_logic_vector(shift_left(unsigned(operand_1),6));
                    when "111" => result <= std_logic_vector(shift_left(unsigned(operand_1),7));
                    when others => result <= (others => '0');
                end case; -- shift_left
            when "1001" => 
                case shift_num is
                    when "000" => result <= std_logic_vector(shift_right(unsigned(operand_1),0));
                    when "001" => result <= std_logic_vector(shift_right(unsigned(operand_1),1));
                    when "010" => result <= std_logic_vector(shift_right(unsigned(operand_1),2));
                    when "011" => result <= std_logic_vector(shift_right(unsigned(operand_1),3));
                    when "100" => result <= std_logic_vector(shift_right(unsigned(operand_1),4));
                    when "101" => result <= std_logic_vector(shift_right(unsigned(operand_1),5));
                    when "110" => result <= std_logic_vector(shift_right(unsigned(operand_1),6));
                    when "111" => result <= std_logic_vector(shift_right(unsigned(operand_1),7));
                    when others => result <= (others => '0');
                end case; -- shift_right
            when "1010" => result <= (others => '0');
            when "1011" => result <= (others => '0'); -- Unused
            when "1100" => result <= (others => '0');
            when "1101" => result <= (others => '0');
            when "1110" => result <= (others => '0');
            when "1111" => result <= (others => '0');
            when others => result <= (others => '0');
        end case; --opcode
    end process; --ALU
end architecture; --rtl