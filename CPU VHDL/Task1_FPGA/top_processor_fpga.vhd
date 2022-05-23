library ieee;
use ieee.std_logic_1164.all;

use work.common.all;

entity top_processor_fpga is 
    port(
        sys_clk     : in    std_logic;
        cpu_clk     : in    std_logic;
        cpu_clk_led : out   std_logic;
        rst         : in    std_logic;
        rst_led     : out   std_logic;
        DAT_7SEG    : out   std_logic_vector (6 downto 0);
        AN_7SEG     : out   std_logic_vector (3 downto 0)
        );
end entity;

architecture rtl of top_processor_fpga is

    component top_processor
        port(
            clk         : in    std_logic;
            rst         : in    std_logic;
            opcode      : out   std_logic_vector(3 downto 0);
            operand_1   : out   std_logic_vector(7 downto 0);
            operand_2   : out   std_logic_vector(7 downto 0);
            result      : out   std_logic_vector(7 downto 0)
            );
    end component; --top_processor 

    component serializer
    port (resetn, clock: in std_logic; -- resetn: active-low input, pause: active-high input
          halt : in std_logic; -- halt signal (will display H when high)
          A, B, C, D: in std_logic_vector (3 downto 0);
            DAT_7SEG: out std_logic_vector (6 downto 0);
            AN_7SEG: out std_logic_vector (3 downto 0)); -- four 7-segment displays
    end component;

    component debouncer
    port (clk, reset: in std_logic; -- clk frequency = 50Mhz
            pb: in std_logic;
            pb_debounced: out std_logic
            );
    end component;


    signal opcode      :   std_logic_vector(3 downto 0);
    signal operand_1   :   std_logic_vector(7 downto 0);
    signal operand_2   :   std_logic_vector(7 downto 0);
    signal result      :   std_logic_vector(7 downto 0);

    signal resetn       : std_logic;
    signal cpu_clk_db   : std_logic;
    signal halt         : std_logic;
begin

    resetn <= not(rst);
    cpu_clk_led <= cpu_clk_db;
    rst_led     <= rst;

    top_processor_inst: top_processor
        port map(
            clk         => cpu_clk_db  ,
            rst         => rst      ,
            opcode      => opcode   ,
            operand_1   => operand_1,
            operand_2   => operand_2,
            result      => result   
            );

    seven_seg_inst: serializer 
    port map( 
            A           => operand_1 (3 downto 0), 
            B           => operand_2 (3 downto 0), 
            C           => opcode    (3 downto 0),
            D           => result    (3 downto 0),
            halt        => halt ,
            DAT_7SEG    => DAT_7SEG,
            AN_7SEG     => AN_7SEG,
            resetn      => resetn, 
            clock       => sys_clk
            );

    halt_process: process (opcode)
        begin
            if (opcode = "1010") then
                halt <= '1';
            else 
                halt <= '0';
        end if; -- halt
        end process;

    debouncer_cpu_clk: debouncer
        port map(
            clk          => sys_clk   ,
            reset        => rst       ,
            pb           => cpu_clk   ,
            pb_debounced => cpu_clk_db
            );


end architecture; --rtl
