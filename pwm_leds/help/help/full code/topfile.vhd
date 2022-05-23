----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2018 18:53:37
-- Design Name: 
-- Module Name: topfile - Behavioral
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


entity topfile is
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
end topfile;

architecture Behavioral of topfile is

component my_rege is
generic (N: INTEGER:= 8);
	port ( clock, resetn: in std_logic;
	       E, sclr: in std_logic; -- sclr: Synchronous clear
			 D: in std_logic_vector (N-1 downto 0);
	       Q: out std_logic_vector (N-1 downto 0));
end component;

component wr_reg_axl362 is
    generic (SCLK_T: INTEGER:= 10*(10**5)); -- Time (in periods of clock) of a period of SCLK
	port (resetn, clock: in std_logic;
			start: in std_logic;
			address, data: in std_logic_vector (7 downto 0);
			wr_rd: in std_logic; -- wr_rd = '0' -> Request a read, wr_rd = '1' -> Request a write
			odata: out std_logic_vector (7 downto 0);
			done: out std_logic;
			-- SPI signals
			nCS: out std_logic;
			MOSI: out std_logic;
			MISO: in std_logic;
			SCLK: out std_logic);
end component;

component my_dec2to4 is

    port ( E_j: in std_logic;
            j: in std_logic_vector(1 downto 0);
           yj: out std_logic_vector(3 downto 0)) ;
           
end component;


component my_dec2to8 is

    port ( E_i: in std_logic;
            i: in std_logic_vector(2 downto 0);
           yi: out std_logic_vector(7 downto 0)) ;
           
end component;

component MUX is
      port (x, y, z, t: in std_logic_vector(15 downto 0);
            sel: in std_logic_vector (1 downto 0);
            ODATA_LEDS: out std_logic_vector(15 downto 0));
end component;


component serializer is
    port (resetn, clock: in std_logic; -- resetn: active-low input, pause: active-high input
	      A, B, C, D, I, F, G, H: in std_logic_vector (3 downto 0);
			DAT_7SEG: out std_logic_vector (6 downto 0);
			AN_7SEG: out std_logic_vector (7 downto 0)); -- eight 7-segment displays
end component;


component FSMemb is
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
end component;

signal odata: std_logic_vector(7 downto 0);
signal i: std_logic_vector(2 downto 0);
signal e_i, e_j, done, start, wr_rd: std_logic;
signal x_h, x_l, y_h, y_l, z_h, z_l, t_h, t_l, yi, xdata, ydata, zdata, status, address, data: std_logic_vector(7 downto 0);
signal x_tot, y_tot, z_tot, t_tot: std_logic_vector(15 downto 0);
signal yj: std_logic_vector(3 downto 0);
signal j: std_logic_vector(1 downto 0);


begin

f0: my_dec2to8 port map(E_i => E_i,
 i => i, 
 yi => yi);

f1: my_dec2to4 port map(E_j => E_j, 
j => j, 
yj => yj);

f2: my_rege port map(E => yi(1), clock => clock, 
resetn => resetn, 
sclr => '0',
 D => odata, 
 Q => x_h);

f3: my_rege port map(E => yi(0), 
 clock => clock, 
 resetn => resetn, 
 sclr => '0', 
 D => odata, 
 Q => x_l);

f4: my_rege port map(E => yi(3), 
clock => clock, 
resetn => resetn, 
sclr => '0', 
D => odata, 
Q => y_h);

f5: my_rege port map(E => yi(2), 
clock => clock, 
resetn => resetn, 
sclr => '0', 
D => odata, 
Q => y_l);

f6: my_rege port map(E => yi(5),
 clock => clock, 
 resetn => resetn,
 sclr => '0', 
 D => odata,
 Q => z_h);

 f7: my_rege port map(E => yi(4), 
 clock => clock, 
 resetn => resetn, 
 sclr => '0', 
 D => odata,
 Q => z_l);

 f8: my_rege port map(E => yi(7), 
 clock => clock, 
 resetn => resetn,
 sclr => '0', 
 D => odata,
 Q => t_h);

 f9: my_rege port map(E => yi(6), 
 clock => clock, 
 resetn => resetn, 
 sclr => '0', 
 D => odata, 
 Q => t_l);
 
x_tot <= x_h&x_l;
y_tot <= y_h&y_l;
z_tot <= z_h&z_l;
t_tot <= t_h&t_l;

f10: MUX port map(x => x_tot,
 y =>y_tot, 
 z =>z_tot, 
 t =>t_tot, 
 ODATA_LEDS => ODATA_LEDS,
 sel => sel);

f11: my_rege port map(E => yj(0),
 clock => clock, 
 resetn => resetn, 
 sclr => '0', 
 D => odata, 
 Q => xdata);

f12: my_rege port map(E => yj(1), 
 clock => clock, 
 resetn => resetn, 
 sclr => '0', 
 D => odata, 
 Q => ydata);

f13: my_rege port map(E => yj(2), 
 clock => clock, 
 resetn => resetn, 
 sclr => '0', 
 D => odata, 
 Q => zdata);

f14: my_rege port map(E => yj(3), 
 clock => clock, 
 resetn => resetn, 
 sclr => '0', 
 D => odata, 
 Q => status);

f15: serializer port map(I => status(3 downto 0),
H => status(7 downto 4), 
 G => zdata(3 downto 0), 
 F => zdata(7 downto 4), 
 D => ydata(3 downto 0), 
 C => ydata(7 downto 4), 
 B => xdata(3 downto 0), 
 A => xdata(7 downto 4), 
 DAT_7SEG => DAT_7SEG,
 AN_7SEG => AN_7SEG,
resetn => resetn, 
clock => clock);

f16: FSMemb port map(done => done, 
clock => clock, 
resetn => resetn, 
E_i => E_i, 
E_j => E_j, 
i => i, 
j => j,
start => start, 
wr_rd => wr_rd, 
address => address,
 data => data);

f17: wr_reg_axl362 generic map(SCLK_T => 10**5)
 port map(resetn => resetn,
 clock => clock, 
 start => start, 
 address => address, 
 data => data, 
 wr_rd => wr_rd,
  odata => odata,
  nCS => nCS, 
  MOSI => MOSI, 
  MISO => MISO,
  SCLK => SCLK,
  done=>done);
                                  

end Behavioral;

