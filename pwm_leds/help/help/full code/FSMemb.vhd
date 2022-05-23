----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2018 18:49:55
-- Design Name: 
-- Module Name: FSMemb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;



entity FSMemb is
    Port ( done : in STD_LOGIC;
           clock : in STD_LOGIC;
           resetn : in STD_LOGIC;
           E_i : out STD_LOGIC;
           E_j : out STD_LOGIC;
           i : out STD_LOGIC_VECTOR (2 downto 0);
           j : out STD_LOGIC_VECTOR (1 downto 0);
           start : out STD_LOGIC;
           wr_rd : out STD_LOGIC;
           address : out STD_LOGIC_VECTOR (7 downto 0);
           data : out STD_LOGIC_VECTOR (7 downto 0));
end FSMemb;

architecture Behavioral of FSMemb is

type state is (S1, S2, S3, S4, S5, S6, S7, S8);
signal z: state;
signal I_count:STD_LOGIC_VECTOR (2 downto 0); 
signal J_count:STD_LOGIC_VECTOR (1 downto 0); 

begin
    i<=I_count;
    j<=J_count; 
    Transitions: process(resetn, clock, done)
    begin
            if resetn = '0' then
                z <= S1; I_count <= "000"; J_count <= "00";
            elsif (clock'event and clock = '1') then
                case z is
                
                when S1 =>
                    z <= S2;
               
                when S2 =>
                    if done ='0' 
                    then z <= S2; 
                    else z <= S3; 
                    end if;
                
                when S3 =>
                    z <= S4;
                
                when S4 =>
                    if done = '0' 
                    then z <= S4; 
                    else z <= S5; 
                    end if;
                
                when S5 =>
                    z <= S6;
                
                when S6 =>
                    if done = '0' 
                    then z <=S6; 
                    elsif done='1' 
                    and I_count = "111" 
                    then
                     z <=S7;
                     I_count<="000"; 
                    else I_count <= I_count +"001"; z <= S5; 
                    end if;
                
                when S7 =>
                    z <= S8;
               
                when S8 =>
                    if done ='0' then z <= S8; 
                    elsif done ='1' 
					and J_count = "11"
                     then z <= S5;
                    J_count<="00"; 
                    else J_count <= J_count + "01"; z <= S7; 
                    end if;
                end case;
            end if;
                
                
    end process;

Outputs: process(z, done,I_count,J_count)
begin
E_i <= '0';
E_j <= '0';
start <= '0';
wr_rd <= '0';
address <= "00000000";
data <= "00000000";

case z is
    when S1 =>
        address <= x"1F";
        data <= x"52";
        wr_rd <= '1';
        start <= '1';
   
   when S2=>
    
    when S3 =>
        address <= x"2D";
        data <= x"02";
        wr_rd <= '1';
        start <= '1';
    
	when S4 =>
    
    when S5 =>
        address <= I_count + "00001110";        
        wr_rd <= '0';
        start <= '1';
   
    when S6 =>
        if done = '1' then e_i <='1';
         end if;
    
	when S7 =>
       address <= J_count + "00001000";
         wr_rd <= '0';
         start <= '1';
        
    when S8 =>
        if done = '1' 
		then E_j <='1'; 
     end if;
    
    
end case;  
end process;
end Behavioral;
