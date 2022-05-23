-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Wed Feb 28 19:33:40 2018
-- Host        : HP-HP running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/HP/Desktop/lamo/lab33/lab33.sim/sim_1/synth/func/xsim/testbench_func_synth.vhd
-- Design      : testbench
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FSMemb is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
end FSMemb;

architecture STRUCTURE of FSMemb is
  signal z : STD_LOGIC_VECTOR ( 2 downto 1 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of z : signal is "yes";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_z_reg[0]\ : label is "s1:000,s2:001,s3:010,s4:011,s5:100,s6:101,s7:110,s8:111";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_z_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_z_reg[1]\ : label is "s1:000,s2:001,s3:010,s4:011,s5:100,s6:101,s7:110,s8:111";
  attribute KEEP of \FSM_sequential_z_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_z_reg[2]\ : label is "s1:000,s2:001,s3:010,s4:011,s5:100,s6:101,s7:110,s8:111";
  attribute KEEP of \FSM_sequential_z_reg[2]\ : label is "yes";
begin
\FSM_sequential_z_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => '1',
      CE => '1',
      D => '1',
      Q => \out\(0),
      R => '0'
    );
\FSM_sequential_z_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => '1',
      CE => '1',
      D => z(1),
      Q => z(1),
      R => '0'
    );
\FSM_sequential_z_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => '1',
      CE => '1',
      D => z(2),
      Q => z(2),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity wr_reg_axl362 is
  port (
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end wr_reg_axl362;

architecture STRUCTURE of wr_reg_axl362 is
  signal \FSM_sequential_y[0]_i_1_n_0\ : STD_LOGIC;
  signal y : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of y : signal is "yes";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_y_reg[0]\ : label is "s1:000,s2:001,s3:010,s4:011,s5:100,s6:101,s7:110,s8:111";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_y_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_y_reg[1]\ : label is "s1:000,s2:001,s3:010,s4:011,s5:100,s6:101,s7:110,s8:111";
  attribute KEEP of \FSM_sequential_y_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_y_reg[2]\ : label is "s1:000,s2:001,s3:010,s4:011,s5:100,s6:101,s7:110,s8:111";
  attribute KEEP of \FSM_sequential_y_reg[2]\ : label is "yes";
begin
\FSM_sequential_y[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CCCD"
    )
        port map (
      I0 => y(1),
      I1 => y(0),
      I2 => y(2),
      I3 => \out\(0),
      O => \FSM_sequential_y[0]_i_1_n_0\
    );
\FSM_sequential_y_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => '1',
      CE => '1',
      D => \FSM_sequential_y[0]_i_1_n_0\,
      Q => y(0),
      R => '0'
    );
\FSM_sequential_y_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => '1',
      CE => '1',
      D => y(1),
      Q => y(1),
      R => '0'
    );
\FSM_sequential_y_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => '1',
      CE => '1',
      D => y(2),
      Q => y(2),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity topfile is
end topfile;

architecture STRUCTURE of topfile is
  signal f16_n_0 : STD_LOGIC;
begin
f16: entity work.FSMemb
     port map (
      \out\(0) => f16_n_0
    );
f17: entity work.wr_reg_axl362
     port map (
      \out\(0) => f16_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity testbench is
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of testbench : entity is true;
end testbench;

architecture STRUCTURE of testbench is
begin
end STRUCTURE;
