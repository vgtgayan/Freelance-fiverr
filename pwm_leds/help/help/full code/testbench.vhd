----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2018 18:58:15
-- Design Name: 
-- Module Name: testbench - Behavioral
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



entity testbench is
end testbench;

architecture Behavioral of testbench is

component topfile is
    Port ( resetn : in STD_LOGIC;
           clock : in STD_LOGIC;
           nCS : out STD_LOGIC;
           MOSI : out STD_LOGIC;
           MISO : in STD_LOGIC;
           SCLK : out STD_LOGIC;
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           AN_7SEG : out STD_LOGIC_VECTOR (7 downto 0);
           DAT_7SEG : out STD_LOGIC_VECTOR (6 downto 0);
           ODATA_LEDS : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal resetn, clock, nCS, MOSI, MISO, SCLK: std_logic;
signal sel: std_logic_vector(1 downto 0);
signal AN_7SEG : STD_LOGIC_VECTOR (7 downto 0);
signal DAT_7SEG : STD_LOGIC_VECTOR (6 downto 0);
signal ODATA_LEDS :  STD_LOGIC_VECTOR (15 downto 0);

constant clock_time: time := 10ns;

begin

uut: topfile port map(resetn => resetn,
 clock => clock, 
 nCS => nCS,
 MOSI => MOSI,
 MISO => MISO,
 SCLK => SCLK, 
 sel => sel, 
 AN_7SEG => AN_7SEG,
 DAT_7SEG => DAT_7SEG, 
 ODATA_LEDS => ODATA_LEDS);
                       
clock_process :process
begin
      clock <= '0';
      wait for clock_time/2;
      clock <= '1';
      wait for clock_time/2;
      end process;
                            
      full_proc : process
      begin
        resetn <= '0';
        MISO <= '1';
        sel <= "11";
        
        
       wait for clock_time;
        resetn <='1';
        wait;
end process;             


end Behavioral;
