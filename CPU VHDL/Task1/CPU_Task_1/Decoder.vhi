
-- VHDL Instantiation Created from source file Decoder.vhd -- 09:45:47 05/04/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Decoder
	PORT(
		instruction_in : IN std_logic_vector(15 downto 0);          
		immediate_out : OUT std_logic_vector(7 downto 0);
		opcode_bits_out : OUT std_logic_vector(3 downto 0);
		opcode_out : OUT std_logic_vector(3 downto 0);
		Rd_addr_out : OUT std_logic_vector(2 downto 0);
		Rs1_addr_out : OUT std_logic_vector(2 downto 0);
		Rs2_addr_out : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	Inst_Decoder: Decoder PORT MAP(
		instruction_in => ,
		immediate_out => ,
		opcode_bits_out => ,
		opcode_out => ,
		Rd_addr_out => ,
		Rs1_addr_out => ,
		Rs2_addr_out => 
	);


