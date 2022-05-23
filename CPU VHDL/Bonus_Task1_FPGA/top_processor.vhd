library ieee;
use ieee.std_logic_1164.all;

use work.common.all;

entity top_processor is 
    port(
        clk         : in    std_logic;
        rst         : in    std_logic;
        mode        : in    std_logic; -- mode: 0 =regular, 1 = tracing
        reg_addr    : in    std_logic_vector(2 downto 0);
        opcode      : out   std_logic_vector(3 downto 0);
        operand_1   : out   std_logic_vector(7 downto 0);
        operand_2   : out   std_logic_vector(7 downto 0);
        result      : out   std_logic_vector(7 downto 0)
        );
end entity;

architecture rtl of top_processor is

    component PC
        port(
            clk             : in    std_logic;
            rst             : in    std_logic;

            PC_incr         : in    std_logic;
            PC_we           : in    std_logic;
            PC_in           : in    std_logic_vector(7 downto 0);
            PC_out          : out   std_logic_vector(7 downto 0)
            );
    end component; --PC
    
    component Registers
        port(
            clk             : in    std_logic;
            rst             : in    std_logic;

            Rd_we           : in    std_logic;
            Rd_addr_in      : in    std_logic_vector(2 downto 0);
            Rd_data_in      : in    std_logic_vector(7 downto 0);

            Rs1_addr_in     : in    std_logic_vector(2 downto 0);
            Rs2_addr_in     : in    std_logic_vector(2 downto 0);

            Rs1_data_out    : out   std_logic_vector(7 downto 0);
            Rs2_data_out    : out   std_logic_vector(7 downto 0)
            );
    end component; --Registers

    component ALU
        port(
            opcode          : in    std_logic_vector(3 downto 0);
            operand_1       : in    std_logic_vector(7 downto 0);
            operand_2       : in    std_logic_vector(7 downto 0);
            result          : out   std_logic_vector(7 downto 0)
            );
    end component; --ALU

    component Instructions_ROM
        port(
            rst             : in STD_LOGIC;
            address_in      : in STD_LOGIC_VECTOR ((address_width - 1) downto 0);
            data_out        : out STD_LOGIC_VECTOR ((instruction_width - 1) downto 0)
            );
    end component; --Instructions_ROM

    component Controller
        port(
            curr_PC         : in STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
            immediate       : in STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
            opcode          : in STD_LOGIC_VECTOR ((opcode_width - 1) downto 0);
            result          : in STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
            Rs1_data        : in STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
            Rs2_data        : in STD_LOGIC_VECTOR ((reg_size - 1) downto 0);            
            new_PC          : out STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
            operand_1       : out STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
            operand_2       : out STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
            Rd_data         : out STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
            PC_incr         : out STD_LOGIC;
            PC_we           : out STD_LOGIC;
            Rd_we           : out STD_LOGIC
            );
    end component; --Controller

    component Decoder
        port(
            instruction_in  : in    std_logic_vector(15 downto 0);

            immediate_out   : out   std_logic_vector(7 downto 0);
            
            opcode_bits_out : out   std_logic_vector(3 downto 0);
            opcode_out      : out   std_logic_vector(3 downto 0);

            Rd_addr_out     : out   std_logic_vector(2 downto 0);

            Rs1_addr_out    : out   std_logic_vector(2 downto 0);
            Rs2_addr_out    : out   std_logic_vector(2 downto 0)
        );
    end component; --Decoder

-- Internal wires
    
    signal PC_in            :  STD_LOGIC_VECTOR ((address_width - 1) downto 0);
    signal PC_out           :  STD_LOGIC_VECTOR ((address_width - 1) downto 0);
    signal PC_we            :  STD_LOGIC;
    signal PC_incr          :  STD_LOGIC;

    signal Rs1_addr_in      :  STD_LOGIC_VECTOR ((reg_addr_width - 1) downto 0);
    signal Rs1_addr_out     :  STD_LOGIC_VECTOR ((reg_addr_width - 1) downto 0);
    signal Rs1_data_out     :  STD_LOGIC_VECTOR ((data_width - 1) downto 0);
    signal Rs2_addr_in      :  STD_LOGIC_VECTOR ((reg_addr_width - 1) downto 0);
    signal Rs2_data_out     :  STD_LOGIC_VECTOR ((data_width - 1) downto 0);
    signal Rd_addr_in       :  STD_LOGIC_VECTOR ((reg_addr_width - 1) downto 0);
    signal Rd_data_in       :  STD_LOGIC_VECTOR ((data_width - 1) downto 0);
    signal Rd_we            :  STD_LOGIC;

    --signal curr_PC          :  STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
    signal immediate        :  STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
    --signal opcode           :  STD_LOGIC_VECTOR ((opcode_width - 1) downto 0);
    signal result_tmp           :  STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
    --signal Rs1_data         :  STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
    --signal Rs2_data         :  STD_LOGIC_VECTOR ((reg_size - 1) downto 0);   
    --signal new_PC           :  STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
    signal operand_1_tmp        :  STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
    signal operand_2_tmp        :  STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
    --signal Rd_data          :  STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
    --signal PC_incr          :  STD_LOGIC;
    --signal PC_we            :  STD_LOGIC;
    --signal Rd_we            :  STD_LOGIC;

    signal instruction_in   :  STD_LOGIC_VECTOR ((instruction_width - 1) downto 0);
    signal opcode_out       :  STD_LOGIC_VECTOR ((opcode_width - 1) downto 0);

begin

    operand_1 <= operand_1_tmp;
    operand_2 <= operand_2_tmp;
    result    <= result_tmp;

    --Mux for Rs1_addr
    Rs1_addr_in <= reg_addr when mode = '1' else
                   Rs1_addr_out;


    PC_inst: PC
        port map(
            clk      => clk    ,       
            rst      => rst    ,       
            PC_incr  => PC_incr ,       
            PC_we    => PC_we  ,       
            PC_in    => PC_in  ,       
            PC_out   => PC_out        
            );--PC
    
    Registers_inst: Registers
        port map(
            clk            => clk          , 
            rst            => rst          , 
            Rd_we          => Rd_we        , 
            Rd_addr_in     => Rd_addr_in   , 
            Rd_data_in     => Rd_data_in   , 
            Rs1_addr_in    => Rs1_addr_in  , 
            Rs2_addr_in    => Rs2_addr_in  , 
            Rs1_data_out   => Rs1_data_out , 
            Rs2_data_out   => Rs2_data_out  
            ); --Registers

    ALU_inst: ALU
        port map(
            opcode         => opcode_out,
            operand_1      => operand_1_tmp ,
            operand_2      => operand_2_tmp ,
            result         => result_tmp    
            ); --ALU

    Instructions_ROM_inst: Instructions_ROM
        port map(
            rst            => rst ,
            address_in     => PC_out,
            data_out       => instruction_in
            ); --Instructions_ROM

    Controller_inst: Controller
        port map(
            curr_PC        => PC_out   ,
            immediate      => immediate ,
            opcode         => opcode_out    ,
            result         => result_tmp    ,
            Rs1_data       => Rs1_data_out  ,
            Rs2_data       => Rs2_data_out  ,
            new_PC         => PC_in    ,
            operand_1      => operand_1_tmp ,
            operand_2      => operand_2_tmp ,
            Rd_data        => Rd_data_in   ,
            PC_incr        => PC_incr   ,
            PC_we          => PC_we     ,
            Rd_we          => Rd_we     
            ); --Controller

    Decoder_inst: Decoder
        port map(
            instruction_in  => instruction_in  ,
            immediate_out   => immediate   ,
            opcode_bits_out => opcode ,
            opcode_out      => opcode_out      ,
            Rd_addr_out     => Rd_addr_in     ,
            Rs1_addr_out    => Rs1_addr_out    ,
            Rs2_addr_out    => Rs2_addr_in    
        );


end architecture; --rtl
