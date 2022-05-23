--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: top_processor_synthesis.vhd
-- /___/   /\     Timestamp: Sun May 13 09:49:32 2018
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm top_processor -w -dir netgen/synthesis -ofmt vhdl -sim top_processor.ngc top_processor_synthesis.vhd 
-- Device	: xc3s100e-4-cp132
-- Input file	: top_processor.ngc
-- Output file	: C:\Users\gayan\Documents\FVR\CPU VHDL\Task1\CPU_Task_1\netgen\synthesis\top_processor_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: top_processor
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity top_processor is
  port (
    clk : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    result : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    operand_1 : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    operand_2 : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    opcode : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end top_processor;

architecture Structure of top_processor is
  signal ALU_inst_Mmux_result_31 : STD_LOGIC; 
  signal ALU_inst_Mmux_result_34 : STD_LOGIC; 
  signal ALU_inst_Mmux_result_35 : STD_LOGIC; 
  signal ALU_inst_Mmux_result_36 : STD_LOGIC; 
  signal ALU_inst_opcode_1_11112_19 : STD_LOGIC; 
  signal ALU_inst_opcode_1_111127_20 : STD_LOGIC; 
  signal ALU_inst_opcode_1_11118_21 : STD_LOGIC; 
  signal ALU_inst_opcode_1_11_bdd1 : STD_LOGIC; 
  signal ALU_inst_opcode_1_12123_23 : STD_LOGIC; 
  signal ALU_inst_opcode_1_1217_24 : STD_LOGIC; 
  signal ALU_inst_opcode_1_1237_25 : STD_LOGIC; 
  signal ALU_inst_opcode_1_131142_26 : STD_LOGIC; 
  signal ALU_inst_opcode_1_13_bdd0 : STD_LOGIC; 
  signal ALU_inst_opcode_1_13_bdd7 : STD_LOGIC; 
  signal ALU_inst_opcode_1_151123_29 : STD_LOGIC; 
  signal ALU_inst_opcode_1_151143_30 : STD_LOGIC; 
  signal ALU_inst_opcode_1_15115_31 : STD_LOGIC; 
  signal ALU_inst_opcode_1_15_bdd0 : STD_LOGIC; 
  signal ALU_inst_opcode_1_15_bdd1 : STD_LOGIC; 
  signal ALU_inst_opcode_1_1_bdd0 : STD_LOGIC; 
  signal ALU_inst_opcode_1_1_bdd2 : STD_LOGIC; 
  signal ALU_inst_opcode_1_1_bdd4 : STD_LOGIC; 
  signal ALU_inst_opcode_1_1_bdd5 : STD_LOGIC; 
  signal ALU_inst_opcode_1_3152_38 : STD_LOGIC; 
  signal ALU_inst_opcode_1_51102_39 : STD_LOGIC; 
  signal ALU_inst_opcode_1_512_40 : STD_LOGIC; 
  signal ALU_inst_opcode_1_5122_41 : STD_LOGIC; 
  signal ALU_inst_opcode_1_5140_42 : STD_LOGIC; 
  signal ALU_inst_opcode_1_7113_43 : STD_LOGIC; 
  signal ALU_inst_opcode_1_719_44 : STD_LOGIC; 
  signal ALU_inst_opcode_1_9130_45 : STD_LOGIC; 
  signal ALU_inst_result_3_inv1_G : STD_LOGIC; 
  signal ALU_inst_result_3_inv1_G1_47 : STD_LOGIC; 
  signal ALU_inst_result_mux0000 : STD_LOGIC; 
  signal Controller_inst_Mrom_control_reg : STD_LOGIC; 
  signal Controller_inst_Mrom_control_reg11_58 : STD_LOGIC; 
  signal Controller_inst_Mrom_control_reg111 : STD_LOGIC; 
  signal Controller_inst_operand_2_1_1_60 : STD_LOGIC; 
  signal Controller_inst_operand_2_3_1 : STD_LOGIC; 
  signal Controller_inst_operand_2_3_11_62 : STD_LOGIC; 
  signal Controller_inst_operand_2_4_1 : STD_LOGIC; 
  signal Controller_inst_operand_2_4_11_64 : STD_LOGIC; 
  signal Decoder_inst_immediate_out_2_1_65 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out1_67 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out11 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out112_3_69 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out112_4_70 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out12 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out14 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out141_4_73 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out15 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out17 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out171_4_76 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out2 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out20 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out201_2_f51_79 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out201_3_80 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out21_3_81 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out23 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out231_3_83 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out26 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out261_3_85 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out27 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out291_4_87 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out30 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out321_4_89 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out37 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out401_2_f51_91 : STD_LOGIC; 
  signal Instructions_ROM_inst_Mrom_data_out9 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal N101 : STD_LOGIC; 
  signal N102 : STD_LOGIC; 
  signal N103 : STD_LOGIC; 
  signal N105 : STD_LOGIC; 
  signal N108 : STD_LOGIC; 
  signal N109 : STD_LOGIC; 
  signal N110 : STD_LOGIC; 
  signal N111 : STD_LOGIC; 
  signal N112 : STD_LOGIC; 
  signal N113 : STD_LOGIC; 
  signal N114 : STD_LOGIC; 
  signal N115 : STD_LOGIC; 
  signal N116 : STD_LOGIC; 
  signal N117 : STD_LOGIC; 
  signal N118 : STD_LOGIC; 
  signal N119 : STD_LOGIC; 
  signal N120 : STD_LOGIC; 
  signal N121 : STD_LOGIC; 
  signal N122 : STD_LOGIC; 
  signal N123 : STD_LOGIC; 
  signal N124 : STD_LOGIC; 
  signal N125 : STD_LOGIC; 
  signal N126 : STD_LOGIC; 
  signal N127 : STD_LOGIC; 
  signal N128 : STD_LOGIC; 
  signal N129 : STD_LOGIC; 
  signal N131 : STD_LOGIC; 
  signal N132 : STD_LOGIC; 
  signal N133 : STD_LOGIC; 
  signal N134 : STD_LOGIC; 
  signal N135 : STD_LOGIC; 
  signal N136 : STD_LOGIC; 
  signal N137 : STD_LOGIC; 
  signal N138 : STD_LOGIC; 
  signal N139 : STD_LOGIC; 
  signal N140 : STD_LOGIC; 
  signal N141 : STD_LOGIC; 
  signal N142 : STD_LOGIC; 
  signal N143 : STD_LOGIC; 
  signal N144 : STD_LOGIC; 
  signal N145 : STD_LOGIC; 
  signal N146 : STD_LOGIC; 
  signal N147 : STD_LOGIC; 
  signal N148 : STD_LOGIC; 
  signal N149 : STD_LOGIC; 
  signal N15 : STD_LOGIC; 
  signal N150 : STD_LOGIC; 
  signal N151 : STD_LOGIC; 
  signal N152 : STD_LOGIC; 
  signal N153 : STD_LOGIC; 
  signal N154 : STD_LOGIC; 
  signal N155 : STD_LOGIC; 
  signal N156 : STD_LOGIC; 
  signal N157 : STD_LOGIC; 
  signal N158 : STD_LOGIC; 
  signal N159 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal N160 : STD_LOGIC; 
  signal N161 : STD_LOGIC; 
  signal N162 : STD_LOGIC; 
  signal N163 : STD_LOGIC; 
  signal N164 : STD_LOGIC; 
  signal N165 : STD_LOGIC; 
  signal N166 : STD_LOGIC; 
  signal N167 : STD_LOGIC; 
  signal N21 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal N24 : STD_LOGIC; 
  signal N25 : STD_LOGIC; 
  signal N30 : STD_LOGIC; 
  signal N31 : STD_LOGIC; 
  signal N33 : STD_LOGIC; 
  signal N34 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal N44 : STD_LOGIC; 
  signal N46 : STD_LOGIC; 
  signal N53 : STD_LOGIC; 
  signal N55 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N66 : STD_LOGIC; 
  signal N67 : STD_LOGIC; 
  signal N72 : STD_LOGIC; 
  signal N76 : STD_LOGIC; 
  signal N80 : STD_LOGIC; 
  signal N81 : STD_LOGIC; 
  signal N90 : STD_LOGIC; 
  signal N91 : STD_LOGIC; 
  signal N93 : STD_LOGIC; 
  signal N95 : STD_LOGIC; 
  signal N97 : STD_LOGIC; 
  signal N99 : STD_LOGIC; 
  signal PC_incr : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg1 : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg2 : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg3 : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg4 : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg5 : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg6 : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg7 : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg_cy_0_rt_195 : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg_cy_1_rt_197 : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg_cy_2_rt_199 : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg_cy_3_rt_201 : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg_cy_4_rt_203 : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg_cy_5_rt_205 : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg_cy_6_rt_207 : STD_LOGIC; 
  signal PC_inst_Mcount_PC_reg_xor_7_rt_208 : STD_LOGIC; 
  signal Registers_inst_mux10_3_f5_217 : STD_LOGIC; 
  signal Registers_inst_mux10_4_218 : STD_LOGIC; 
  signal Registers_inst_mux10_4_f5_219 : STD_LOGIC; 
  signal Registers_inst_mux10_5_220 : STD_LOGIC; 
  signal Registers_inst_mux10_51_221 : STD_LOGIC; 
  signal Registers_inst_mux10_6_222 : STD_LOGIC; 
  signal Registers_inst_mux11_3_f5_223 : STD_LOGIC; 
  signal Registers_inst_mux11_4_224 : STD_LOGIC; 
  signal Registers_inst_mux11_4_f5_225 : STD_LOGIC; 
  signal Registers_inst_mux11_5_226 : STD_LOGIC; 
  signal Registers_inst_mux11_51_227 : STD_LOGIC; 
  signal Registers_inst_mux11_6_228 : STD_LOGIC; 
  signal Registers_inst_mux12_3_f5_229 : STD_LOGIC; 
  signal Registers_inst_mux12_4_230 : STD_LOGIC; 
  signal Registers_inst_mux12_4_f5_231 : STD_LOGIC; 
  signal Registers_inst_mux12_5_232 : STD_LOGIC; 
  signal Registers_inst_mux12_51_233 : STD_LOGIC; 
  signal Registers_inst_mux12_6_234 : STD_LOGIC; 
  signal Registers_inst_mux13_3_f5_235 : STD_LOGIC; 
  signal Registers_inst_mux13_4_236 : STD_LOGIC; 
  signal Registers_inst_mux13_4_f5_237 : STD_LOGIC; 
  signal Registers_inst_mux13_5_238 : STD_LOGIC; 
  signal Registers_inst_mux13_51_239 : STD_LOGIC; 
  signal Registers_inst_mux13_6_240 : STD_LOGIC; 
  signal Registers_inst_mux14_3_f5_241 : STD_LOGIC; 
  signal Registers_inst_mux14_4_242 : STD_LOGIC; 
  signal Registers_inst_mux14_4_f5_243 : STD_LOGIC; 
  signal Registers_inst_mux14_5_244 : STD_LOGIC; 
  signal Registers_inst_mux14_51_245 : STD_LOGIC; 
  signal Registers_inst_mux14_6_246 : STD_LOGIC; 
  signal Registers_inst_mux15_3_f5_247 : STD_LOGIC; 
  signal Registers_inst_mux15_4_248 : STD_LOGIC; 
  signal Registers_inst_mux15_4_f5_249 : STD_LOGIC; 
  signal Registers_inst_mux15_5_250 : STD_LOGIC; 
  signal Registers_inst_mux15_51_251 : STD_LOGIC; 
  signal Registers_inst_mux15_6_252 : STD_LOGIC; 
  signal Registers_inst_mux1_3_f5_253 : STD_LOGIC; 
  signal Registers_inst_mux1_4_254 : STD_LOGIC; 
  signal Registers_inst_mux1_4_f5_255 : STD_LOGIC; 
  signal Registers_inst_mux1_5_256 : STD_LOGIC; 
  signal Registers_inst_mux1_51_257 : STD_LOGIC; 
  signal Registers_inst_mux1_6_258 : STD_LOGIC; 
  signal Registers_inst_mux2_3_f5_259 : STD_LOGIC; 
  signal Registers_inst_mux2_4_260 : STD_LOGIC; 
  signal Registers_inst_mux2_4_f5_261 : STD_LOGIC; 
  signal Registers_inst_mux2_5_262 : STD_LOGIC; 
  signal Registers_inst_mux2_51_263 : STD_LOGIC; 
  signal Registers_inst_mux2_6_264 : STD_LOGIC; 
  signal Registers_inst_mux3_3_f5_265 : STD_LOGIC; 
  signal Registers_inst_mux3_4_266 : STD_LOGIC; 
  signal Registers_inst_mux3_4_f5_267 : STD_LOGIC; 
  signal Registers_inst_mux3_5_268 : STD_LOGIC; 
  signal Registers_inst_mux3_51_269 : STD_LOGIC; 
  signal Registers_inst_mux3_6_270 : STD_LOGIC; 
  signal Registers_inst_mux4_3_f5_271 : STD_LOGIC; 
  signal Registers_inst_mux4_4_272 : STD_LOGIC; 
  signal Registers_inst_mux4_4_f5_273 : STD_LOGIC; 
  signal Registers_inst_mux4_5_274 : STD_LOGIC; 
  signal Registers_inst_mux4_51_275 : STD_LOGIC; 
  signal Registers_inst_mux4_6_276 : STD_LOGIC; 
  signal Registers_inst_mux5_3_f5_277 : STD_LOGIC; 
  signal Registers_inst_mux5_4_278 : STD_LOGIC; 
  signal Registers_inst_mux5_4_f5_279 : STD_LOGIC; 
  signal Registers_inst_mux5_5_280 : STD_LOGIC; 
  signal Registers_inst_mux5_51_281 : STD_LOGIC; 
  signal Registers_inst_mux5_6_282 : STD_LOGIC; 
  signal Registers_inst_mux6_3_f5_283 : STD_LOGIC; 
  signal Registers_inst_mux6_4_284 : STD_LOGIC; 
  signal Registers_inst_mux6_4_f5_285 : STD_LOGIC; 
  signal Registers_inst_mux6_5_286 : STD_LOGIC; 
  signal Registers_inst_mux6_51_287 : STD_LOGIC; 
  signal Registers_inst_mux6_6_288 : STD_LOGIC; 
  signal Registers_inst_mux7_3_f5_289 : STD_LOGIC; 
  signal Registers_inst_mux7_4_290 : STD_LOGIC; 
  signal Registers_inst_mux7_4_f5_291 : STD_LOGIC; 
  signal Registers_inst_mux7_5_292 : STD_LOGIC; 
  signal Registers_inst_mux7_51_293 : STD_LOGIC; 
  signal Registers_inst_mux7_6_294 : STD_LOGIC; 
  signal Registers_inst_mux8_3_f5_295 : STD_LOGIC; 
  signal Registers_inst_mux8_4_296 : STD_LOGIC; 
  signal Registers_inst_mux8_4_f5_297 : STD_LOGIC; 
  signal Registers_inst_mux8_5_298 : STD_LOGIC; 
  signal Registers_inst_mux8_51_299 : STD_LOGIC; 
  signal Registers_inst_mux8_6_300 : STD_LOGIC; 
  signal Registers_inst_mux9_3_f5_301 : STD_LOGIC; 
  signal Registers_inst_mux9_4_302 : STD_LOGIC; 
  signal Registers_inst_mux9_4_f5_303 : STD_LOGIC; 
  signal Registers_inst_mux9_5_304 : STD_LOGIC; 
  signal Registers_inst_mux9_51_305 : STD_LOGIC; 
  signal Registers_inst_mux9_6_306 : STD_LOGIC; 
  signal Registers_inst_mux_3_f5_307 : STD_LOGIC; 
  signal Registers_inst_mux_4_308 : STD_LOGIC; 
  signal Registers_inst_mux_4_f5_309 : STD_LOGIC; 
  signal Registers_inst_mux_5_310 : STD_LOGIC; 
  signal Registers_inst_mux_51_311 : STD_LOGIC; 
  signal Registers_inst_mux_6_312 : STD_LOGIC; 
  signal Registers_inst_reg_1_0_313 : STD_LOGIC; 
  signal Registers_inst_reg_1_1_314 : STD_LOGIC; 
  signal Registers_inst_reg_1_2_315 : STD_LOGIC; 
  signal Registers_inst_reg_1_3_316 : STD_LOGIC; 
  signal Registers_inst_reg_1_4_317 : STD_LOGIC; 
  signal Registers_inst_reg_1_5_318 : STD_LOGIC; 
  signal Registers_inst_reg_1_6_319 : STD_LOGIC; 
  signal Registers_inst_reg_1_7_320 : STD_LOGIC; 
  signal Registers_inst_reg_1_and0000 : STD_LOGIC; 
  signal Registers_inst_reg_2_0_322 : STD_LOGIC; 
  signal Registers_inst_reg_2_1_323 : STD_LOGIC; 
  signal Registers_inst_reg_2_2_324 : STD_LOGIC; 
  signal Registers_inst_reg_2_3_325 : STD_LOGIC; 
  signal Registers_inst_reg_2_4_326 : STD_LOGIC; 
  signal Registers_inst_reg_2_5_327 : STD_LOGIC; 
  signal Registers_inst_reg_2_6_328 : STD_LOGIC; 
  signal Registers_inst_reg_2_7_329 : STD_LOGIC; 
  signal Registers_inst_reg_2_and0000 : STD_LOGIC; 
  signal Registers_inst_reg_3_0_331 : STD_LOGIC; 
  signal Registers_inst_reg_3_1_332 : STD_LOGIC; 
  signal Registers_inst_reg_3_2_333 : STD_LOGIC; 
  signal Registers_inst_reg_3_3_334 : STD_LOGIC; 
  signal Registers_inst_reg_3_4_335 : STD_LOGIC; 
  signal Registers_inst_reg_3_5_336 : STD_LOGIC; 
  signal Registers_inst_reg_3_6_337 : STD_LOGIC; 
  signal Registers_inst_reg_3_7_338 : STD_LOGIC; 
  signal Registers_inst_reg_3_and0000 : STD_LOGIC; 
  signal Registers_inst_reg_4_0_340 : STD_LOGIC; 
  signal Registers_inst_reg_4_1_341 : STD_LOGIC; 
  signal Registers_inst_reg_4_2_342 : STD_LOGIC; 
  signal Registers_inst_reg_4_3_343 : STD_LOGIC; 
  signal Registers_inst_reg_4_4_344 : STD_LOGIC; 
  signal Registers_inst_reg_4_5_345 : STD_LOGIC; 
  signal Registers_inst_reg_4_6_346 : STD_LOGIC; 
  signal Registers_inst_reg_4_7_347 : STD_LOGIC; 
  signal Registers_inst_reg_4_and0000 : STD_LOGIC; 
  signal Registers_inst_reg_5_0_349 : STD_LOGIC; 
  signal Registers_inst_reg_5_1_350 : STD_LOGIC; 
  signal Registers_inst_reg_5_2_351 : STD_LOGIC; 
  signal Registers_inst_reg_5_3_352 : STD_LOGIC; 
  signal Registers_inst_reg_5_4_353 : STD_LOGIC; 
  signal Registers_inst_reg_5_5_354 : STD_LOGIC; 
  signal Registers_inst_reg_5_6_355 : STD_LOGIC; 
  signal Registers_inst_reg_5_7_356 : STD_LOGIC; 
  signal Registers_inst_reg_5_and0000 : STD_LOGIC; 
  signal Registers_inst_reg_6_0_358 : STD_LOGIC; 
  signal Registers_inst_reg_6_1_359 : STD_LOGIC; 
  signal Registers_inst_reg_6_2_360 : STD_LOGIC; 
  signal Registers_inst_reg_6_3_361 : STD_LOGIC; 
  signal Registers_inst_reg_6_4_362 : STD_LOGIC; 
  signal Registers_inst_reg_6_5_363 : STD_LOGIC; 
  signal Registers_inst_reg_6_6_364 : STD_LOGIC; 
  signal Registers_inst_reg_6_7_365 : STD_LOGIC; 
  signal Registers_inst_reg_6_and0000 : STD_LOGIC; 
  signal Registers_inst_reg_7_0_367 : STD_LOGIC; 
  signal Registers_inst_reg_7_1_368 : STD_LOGIC; 
  signal Registers_inst_reg_7_2_369 : STD_LOGIC; 
  signal Registers_inst_reg_7_3_370 : STD_LOGIC; 
  signal Registers_inst_reg_7_4_371 : STD_LOGIC; 
  signal Registers_inst_reg_7_5_372 : STD_LOGIC; 
  signal Registers_inst_reg_7_6_373 : STD_LOGIC; 
  signal Registers_inst_reg_7_7_374 : STD_LOGIC; 
  signal Registers_inst_reg_7_and0000 : STD_LOGIC; 
  signal clk_BUFGP_393 : STD_LOGIC; 
  signal instruction_in_0_Q : STD_LOGIC; 
  signal instruction_in_10_Q : STD_LOGIC; 
  signal instruction_in_11_Q : STD_LOGIC; 
  signal instruction_in_12_Q : STD_LOGIC; 
  signal instruction_in_13_Q : STD_LOGIC; 
  signal instruction_in_15_Q : STD_LOGIC; 
  signal instruction_in_3_Q : STD_LOGIC; 
  signal instruction_in_4_Q : STD_LOGIC; 
  signal instruction_in_5_Q : STD_LOGIC; 
  signal instruction_in_6_Q : STD_LOGIC; 
  signal instruction_in_7_Q : STD_LOGIC; 
  signal instruction_in_8_Q : STD_LOGIC; 
  signal instruction_in_9_Q : STD_LOGIC; 
  signal operand_2_0_OBUF_428 : STD_LOGIC; 
  signal operand_2_1_OBUF_429 : STD_LOGIC; 
  signal operand_2_2_OBUF_430 : STD_LOGIC; 
  signal operand_2_3_OBUF_431 : STD_LOGIC; 
  signal operand_2_4_OBUF_432 : STD_LOGIC; 
  signal operand_2_5_OBUF_433 : STD_LOGIC; 
  signal operand_2_6_OBUF_434 : STD_LOGIC; 
  signal operand_2_7_OBUF_435 : STD_LOGIC; 
  signal result_0_OBUF_444 : STD_LOGIC; 
  signal result_1_OBUF_445 : STD_LOGIC; 
  signal result_2_OBUF_446 : STD_LOGIC; 
  signal result_3_OBUF_447 : STD_LOGIC; 
  signal result_4_OBUF_448 : STD_LOGIC; 
  signal result_5_OBUF_449 : STD_LOGIC; 
  signal result_6_OBUF_450 : STD_LOGIC; 
  signal result_7_OBUF_451 : STD_LOGIC; 
  signal rst_IBUF_453 : STD_LOGIC; 
  signal ALU_inst_Maddsub_result_addsub0000_cy : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal ALU_inst_Maddsub_result_addsub0000_lut : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal ALU_inst_result_addsub0000 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal PC_inst_Mcount_PC_reg_cy : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal PC_inst_PC_reg : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal Rs1_data_out : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal Rs2_data_out : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal immediate : STD_LOGIC_VECTOR ( 5 downto 5 ); 
begin
  XST_GND : GND
    port map (
      G => Instructions_ROM_inst_Mrom_data_out37
    );
  XST_VCC : VCC
    port map (
      P => Instructions_ROM_inst_Mrom_data_out1_67
    );
  PC_inst_Mcount_PC_reg_cy_0_Q : MUXCY
    port map (
      CI => Instructions_ROM_inst_Mrom_data_out1_67,
      DI => Instructions_ROM_inst_Mrom_data_out37,
      S => PC_inst_Mcount_PC_reg_cy_0_rt_195,
      O => PC_inst_Mcount_PC_reg_cy(0)
    );
  PC_inst_Mcount_PC_reg_xor_0_Q : XORCY
    port map (
      CI => Instructions_ROM_inst_Mrom_data_out1_67,
      LI => PC_inst_Mcount_PC_reg_cy_0_rt_195,
      O => PC_inst_Mcount_PC_reg
    );
  PC_inst_Mcount_PC_reg_cy_1_Q : MUXCY
    port map (
      CI => PC_inst_Mcount_PC_reg_cy(0),
      DI => Instructions_ROM_inst_Mrom_data_out37,
      S => PC_inst_Mcount_PC_reg_cy_1_rt_197,
      O => PC_inst_Mcount_PC_reg_cy(1)
    );
  PC_inst_Mcount_PC_reg_xor_1_Q : XORCY
    port map (
      CI => PC_inst_Mcount_PC_reg_cy(0),
      LI => PC_inst_Mcount_PC_reg_cy_1_rt_197,
      O => PC_inst_Mcount_PC_reg1
    );
  PC_inst_Mcount_PC_reg_cy_2_Q : MUXCY
    port map (
      CI => PC_inst_Mcount_PC_reg_cy(1),
      DI => Instructions_ROM_inst_Mrom_data_out37,
      S => PC_inst_Mcount_PC_reg_cy_2_rt_199,
      O => PC_inst_Mcount_PC_reg_cy(2)
    );
  PC_inst_Mcount_PC_reg_xor_2_Q : XORCY
    port map (
      CI => PC_inst_Mcount_PC_reg_cy(1),
      LI => PC_inst_Mcount_PC_reg_cy_2_rt_199,
      O => PC_inst_Mcount_PC_reg2
    );
  PC_inst_Mcount_PC_reg_cy_3_Q : MUXCY
    port map (
      CI => PC_inst_Mcount_PC_reg_cy(2),
      DI => Instructions_ROM_inst_Mrom_data_out37,
      S => PC_inst_Mcount_PC_reg_cy_3_rt_201,
      O => PC_inst_Mcount_PC_reg_cy(3)
    );
  PC_inst_Mcount_PC_reg_xor_3_Q : XORCY
    port map (
      CI => PC_inst_Mcount_PC_reg_cy(2),
      LI => PC_inst_Mcount_PC_reg_cy_3_rt_201,
      O => PC_inst_Mcount_PC_reg3
    );
  PC_inst_Mcount_PC_reg_cy_4_Q : MUXCY
    port map (
      CI => PC_inst_Mcount_PC_reg_cy(3),
      DI => Instructions_ROM_inst_Mrom_data_out37,
      S => PC_inst_Mcount_PC_reg_cy_4_rt_203,
      O => PC_inst_Mcount_PC_reg_cy(4)
    );
  PC_inst_Mcount_PC_reg_xor_4_Q : XORCY
    port map (
      CI => PC_inst_Mcount_PC_reg_cy(3),
      LI => PC_inst_Mcount_PC_reg_cy_4_rt_203,
      O => PC_inst_Mcount_PC_reg4
    );
  PC_inst_Mcount_PC_reg_cy_5_Q : MUXCY
    port map (
      CI => PC_inst_Mcount_PC_reg_cy(4),
      DI => Instructions_ROM_inst_Mrom_data_out37,
      S => PC_inst_Mcount_PC_reg_cy_5_rt_205,
      O => PC_inst_Mcount_PC_reg_cy(5)
    );
  PC_inst_Mcount_PC_reg_xor_5_Q : XORCY
    port map (
      CI => PC_inst_Mcount_PC_reg_cy(4),
      LI => PC_inst_Mcount_PC_reg_cy_5_rt_205,
      O => PC_inst_Mcount_PC_reg5
    );
  PC_inst_Mcount_PC_reg_cy_6_Q : MUXCY
    port map (
      CI => PC_inst_Mcount_PC_reg_cy(5),
      DI => Instructions_ROM_inst_Mrom_data_out37,
      S => PC_inst_Mcount_PC_reg_cy_6_rt_207,
      O => PC_inst_Mcount_PC_reg_cy(6)
    );
  PC_inst_Mcount_PC_reg_xor_6_Q : XORCY
    port map (
      CI => PC_inst_Mcount_PC_reg_cy(5),
      LI => PC_inst_Mcount_PC_reg_cy_6_rt_207,
      O => PC_inst_Mcount_PC_reg6
    );
  PC_inst_Mcount_PC_reg_xor_7_Q : XORCY
    port map (
      CI => PC_inst_Mcount_PC_reg_cy(6),
      LI => PC_inst_Mcount_PC_reg_xor_7_rt_208,
      O => PC_inst_Mcount_PC_reg7
    );
  PC_inst_PC_reg_0 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => PC_incr,
      CLR => rst_IBUF_453,
      D => PC_inst_Mcount_PC_reg,
      Q => PC_inst_PC_reg(0)
    );
  PC_inst_PC_reg_1 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => PC_incr,
      CLR => rst_IBUF_453,
      D => PC_inst_Mcount_PC_reg1,
      Q => PC_inst_PC_reg(1)
    );
  PC_inst_PC_reg_2 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => PC_incr,
      CLR => rst_IBUF_453,
      D => PC_inst_Mcount_PC_reg2,
      Q => PC_inst_PC_reg(2)
    );
  PC_inst_PC_reg_3 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => PC_incr,
      CLR => rst_IBUF_453,
      D => PC_inst_Mcount_PC_reg3,
      Q => PC_inst_PC_reg(3)
    );
  PC_inst_PC_reg_4 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => PC_incr,
      CLR => rst_IBUF_453,
      D => PC_inst_Mcount_PC_reg4,
      Q => PC_inst_PC_reg(4)
    );
  PC_inst_PC_reg_5 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => PC_incr,
      CLR => rst_IBUF_453,
      D => PC_inst_Mcount_PC_reg5,
      Q => PC_inst_PC_reg(5)
    );
  PC_inst_PC_reg_6 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => PC_incr,
      CLR => rst_IBUF_453,
      D => PC_inst_Mcount_PC_reg6,
      Q => PC_inst_PC_reg(6)
    );
  PC_inst_PC_reg_7 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => PC_incr,
      CLR => rst_IBUF_453,
      D => PC_inst_Mcount_PC_reg7,
      Q => PC_inst_PC_reg(7)
    );
  Instructions_ROM_inst_Mrom_data_out21_3 : LUT4
    generic map(
      INIT => X"FF7F"
    )
    port map (
      I0 => PC_inst_PC_reg(4),
      I1 => PC_inst_PC_reg(5),
      I2 => PC_inst_PC_reg(6),
      I3 => N161,
      O => Instructions_ROM_inst_Mrom_data_out21_3_81
    );
  Instructions_ROM_inst_Mrom_data_out141_4 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => PC_inst_PC_reg(6),
      I1 => PC_inst_PC_reg(5),
      I2 => PC_inst_PC_reg(4),
      I3 => N160,
      O => Instructions_ROM_inst_Mrom_data_out141_4_73
    );
  Instructions_ROM_inst_Mrom_data_out112_2_f5 : MUXF5
    port map (
      I0 => Instructions_ROM_inst_Mrom_data_out112_4_70,
      I1 => Instructions_ROM_inst_Mrom_data_out112_3_69,
      S => PC_inst_PC_reg(7),
      O => instruction_in_3_Q
    );
  Instructions_ROM_inst_Mrom_data_out112_4 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => PC_inst_PC_reg(6),
      I1 => PC_inst_PC_reg(5),
      I2 => PC_inst_PC_reg(4),
      I3 => Instructions_ROM_inst_Mrom_data_out9,
      O => Instructions_ROM_inst_Mrom_data_out112_4_70
    );
  Instructions_ROM_inst_Mrom_data_out112_3 : LUT4
    generic map(
      INIT => X"FF7F"
    )
    port map (
      I0 => PC_inst_PC_reg(4),
      I1 => PC_inst_PC_reg(5),
      I2 => PC_inst_PC_reg(6),
      I3 => Instructions_ROM_inst_Mrom_data_out11,
      O => Instructions_ROM_inst_Mrom_data_out112_3_69
    );
  Instructions_ROM_inst_Mrom_data_out171_4 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => PC_inst_PC_reg(6),
      I1 => PC_inst_PC_reg(5),
      I2 => PC_inst_PC_reg(4),
      I3 => Instructions_ROM_inst_Mrom_data_out15,
      O => Instructions_ROM_inst_Mrom_data_out171_4_76
    );
  Instructions_ROM_inst_Mrom_data_out201_3 : LUT4
    generic map(
      INIT => X"FF7F"
    )
    port map (
      I0 => PC_inst_PC_reg(4),
      I1 => PC_inst_PC_reg(5),
      I2 => PC_inst_PC_reg(6),
      I3 => Instructions_ROM_inst_Mrom_data_out20,
      O => Instructions_ROM_inst_Mrom_data_out201_3_80
    );
  Instructions_ROM_inst_Mrom_data_out291_2_f5 : MUXF5
    port map (
      I0 => Instructions_ROM_inst_Mrom_data_out291_4_87,
      I1 => Instructions_ROM_inst_Mrom_data_out201_3_80,
      S => PC_inst_PC_reg(7),
      O => instruction_in_9_Q
    );
  Instructions_ROM_inst_Mrom_data_out291_4 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => PC_inst_PC_reg(6),
      I1 => PC_inst_PC_reg(5),
      I2 => PC_inst_PC_reg(4),
      I3 => Instructions_ROM_inst_Mrom_data_out27,
      O => Instructions_ROM_inst_Mrom_data_out291_4_87
    );
  Instructions_ROM_inst_Mrom_data_out231_3 : LUT4
    generic map(
      INIT => X"FF7F"
    )
    port map (
      I0 => PC_inst_PC_reg(4),
      I1 => PC_inst_PC_reg(5),
      I2 => PC_inst_PC_reg(6),
      I3 => Instructions_ROM_inst_Mrom_data_out23,
      O => Instructions_ROM_inst_Mrom_data_out231_3_83
    );
  Instructions_ROM_inst_Mrom_data_out261_3 : LUT4
    generic map(
      INIT => X"FF7F"
    )
    port map (
      I0 => PC_inst_PC_reg(4),
      I1 => PC_inst_PC_reg(5),
      I2 => PC_inst_PC_reg(6),
      I3 => Instructions_ROM_inst_Mrom_data_out26,
      O => Instructions_ROM_inst_Mrom_data_out261_3_85
    );
  Instructions_ROM_inst_Mrom_data_out321_2_f5 : MUXF5
    port map (
      I0 => Instructions_ROM_inst_Mrom_data_out321_4_89,
      I1 => Instructions_ROM_inst_Mrom_data_out231_3_83,
      S => PC_inst_PC_reg(7),
      O => instruction_in_10_Q
    );
  Instructions_ROM_inst_Mrom_data_out321_4 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => PC_inst_PC_reg(6),
      I1 => PC_inst_PC_reg(5),
      I2 => PC_inst_PC_reg(4),
      I3 => Instructions_ROM_inst_Mrom_data_out30,
      O => Instructions_ROM_inst_Mrom_data_out321_4_89
    );
  Instructions_ROM_inst_Mrom_data_out441_2_f5 : MUXF5
    port map (
      I0 => Instructions_ROM_inst_Mrom_data_out171_4_76,
      I1 => Instructions_ROM_inst_Mrom_data_out21_3_81,
      S => PC_inst_PC_reg(7),
      O => instruction_in_15_Q
    );
  Registers_inst_mux15_4 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_7_7_374,
      I1 => Registers_inst_reg_6_7_365,
      I2 => instruction_in_6_Q,
      O => Registers_inst_mux15_4_248
    );
  Registers_inst_mux15_5 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_5_7_356,
      I1 => Registers_inst_reg_4_7_347,
      I2 => instruction_in_6_Q,
      O => Registers_inst_mux15_5_250
    );
  Registers_inst_mux15_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux15_5_250,
      I1 => Registers_inst_mux15_4_248,
      S => instruction_in_7_Q,
      O => Registers_inst_mux15_3_f5_247
    );
  Registers_inst_mux15_51 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_3_7_338,
      I1 => Registers_inst_reg_2_7_329,
      I2 => instruction_in_6_Q,
      O => Registers_inst_mux15_51_251
    );
  Registers_inst_mux15_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux15_6_252,
      I1 => Registers_inst_mux15_51_251,
      S => instruction_in_7_Q,
      O => Registers_inst_mux15_4_f5_249
    );
  Registers_inst_mux15_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux15_4_f5_249,
      I1 => Registers_inst_mux15_3_f5_247,
      S => instruction_in_8_Q,
      O => Rs1_data_out(7)
    );
  Registers_inst_mux14_4 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_7_6_373,
      I1 => Registers_inst_reg_6_6_364,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux14_4_242
    );
  Registers_inst_mux14_5 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_5_6_355,
      I1 => Registers_inst_reg_4_6_346,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux14_5_244
    );
  Registers_inst_mux14_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux14_5_244,
      I1 => Registers_inst_mux14_4_242,
      S => instruction_in_7_Q,
      O => Registers_inst_mux14_3_f5_241
    );
  Registers_inst_mux14_51 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_3_6_337,
      I1 => Registers_inst_reg_2_6_328,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux14_51_245
    );
  Registers_inst_mux14_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux14_6_246,
      I1 => Registers_inst_mux14_51_245,
      S => instruction_in_7_Q,
      O => Registers_inst_mux14_4_f5_243
    );
  Registers_inst_mux14_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux14_4_f5_243,
      I1 => Registers_inst_mux14_3_f5_241,
      S => instruction_in_8_Q,
      O => Rs1_data_out(6)
    );
  Registers_inst_mux13_4 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_7_5_372,
      I1 => Registers_inst_reg_6_5_363,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux13_4_236
    );
  Registers_inst_mux13_5 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_5_5_354,
      I1 => Registers_inst_reg_4_5_345,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux13_5_238
    );
  Registers_inst_mux13_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux13_5_238,
      I1 => Registers_inst_mux13_4_236,
      S => instruction_in_7_Q,
      O => Registers_inst_mux13_3_f5_235
    );
  Registers_inst_mux13_51 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_3_5_336,
      I1 => Registers_inst_reg_2_5_327,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux13_51_239
    );
  Registers_inst_mux13_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux13_6_240,
      I1 => Registers_inst_mux13_51_239,
      S => instruction_in_7_Q,
      O => Registers_inst_mux13_4_f5_237
    );
  Registers_inst_mux13_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux13_4_f5_237,
      I1 => Registers_inst_mux13_3_f5_235,
      S => instruction_in_8_Q,
      O => Rs1_data_out(5)
    );
  Registers_inst_mux12_4 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_7_4_371,
      I1 => Registers_inst_reg_6_4_362,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux12_4_230
    );
  Registers_inst_mux12_5 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_5_4_353,
      I1 => Registers_inst_reg_4_4_344,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux12_5_232
    );
  Registers_inst_mux12_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux12_5_232,
      I1 => Registers_inst_mux12_4_230,
      S => instruction_in_7_Q,
      O => Registers_inst_mux12_3_f5_229
    );
  Registers_inst_mux12_51 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_3_4_335,
      I1 => Registers_inst_reg_2_4_326,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux12_51_233
    );
  Registers_inst_mux12_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux12_6_234,
      I1 => Registers_inst_mux12_51_233,
      S => instruction_in_7_Q,
      O => Registers_inst_mux12_4_f5_231
    );
  Registers_inst_mux12_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux12_4_f5_231,
      I1 => Registers_inst_mux12_3_f5_229,
      S => instruction_in_8_Q,
      O => Rs1_data_out(4)
    );
  Registers_inst_mux11_4 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_7_3_370,
      I1 => Registers_inst_reg_6_3_361,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux11_4_224
    );
  Registers_inst_mux11_5 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_5_3_352,
      I1 => Registers_inst_reg_4_3_343,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux11_5_226
    );
  Registers_inst_mux11_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux11_5_226,
      I1 => Registers_inst_mux11_4_224,
      S => instruction_in_7_Q,
      O => Registers_inst_mux11_3_f5_223
    );
  Registers_inst_mux11_51 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_3_3_334,
      I1 => Registers_inst_reg_2_3_325,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux11_51_227
    );
  Registers_inst_mux11_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux11_6_228,
      I1 => Registers_inst_mux11_51_227,
      S => instruction_in_7_Q,
      O => Registers_inst_mux11_4_f5_225
    );
  Registers_inst_mux11_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux11_4_f5_225,
      I1 => Registers_inst_mux11_3_f5_223,
      S => instruction_in_8_Q,
      O => Rs1_data_out(3)
    );
  Registers_inst_mux10_4 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_7_2_369,
      I1 => Registers_inst_reg_6_2_360,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux10_4_218
    );
  Registers_inst_mux10_5 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_5_2_351,
      I1 => Registers_inst_reg_4_2_342,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux10_5_220
    );
  Registers_inst_mux10_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux10_5_220,
      I1 => Registers_inst_mux10_4_218,
      S => instruction_in_7_Q,
      O => Registers_inst_mux10_3_f5_217
    );
  Registers_inst_mux10_51 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_3_2_333,
      I1 => Registers_inst_reg_2_2_324,
      I2 => Instructions_ROM_inst_Mrom_data_out201_2_f51_79,
      O => Registers_inst_mux10_51_221
    );
  Registers_inst_mux10_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux10_6_222,
      I1 => Registers_inst_mux10_51_221,
      S => instruction_in_7_Q,
      O => Registers_inst_mux10_4_f5_219
    );
  Registers_inst_mux10_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux10_4_f5_219,
      I1 => Registers_inst_mux10_3_f5_217,
      S => instruction_in_8_Q,
      O => Rs1_data_out(2)
    );
  Registers_inst_mux9_4 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_7_1_368,
      I1 => Registers_inst_reg_6_1_359,
      I2 => instruction_in_6_Q,
      O => Registers_inst_mux9_4_302
    );
  Registers_inst_mux9_5 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_5_1_350,
      I1 => Registers_inst_reg_4_1_341,
      I2 => instruction_in_6_Q,
      O => Registers_inst_mux9_5_304
    );
  Registers_inst_mux9_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux9_5_304,
      I1 => Registers_inst_mux9_4_302,
      S => instruction_in_7_Q,
      O => Registers_inst_mux9_3_f5_301
    );
  Registers_inst_mux9_51 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_3_1_332,
      I1 => Registers_inst_reg_2_1_323,
      I2 => instruction_in_6_Q,
      O => Registers_inst_mux9_51_305
    );
  Registers_inst_mux9_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux9_6_306,
      I1 => Registers_inst_mux9_51_305,
      S => instruction_in_7_Q,
      O => Registers_inst_mux9_4_f5_303
    );
  Registers_inst_mux9_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux9_4_f5_303,
      I1 => Registers_inst_mux9_3_f5_301,
      S => instruction_in_8_Q,
      O => Rs1_data_out(1)
    );
  Registers_inst_mux8_4 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_7_0_367,
      I1 => Registers_inst_reg_6_0_358,
      I2 => instruction_in_6_Q,
      O => Registers_inst_mux8_4_296
    );
  Registers_inst_mux8_5 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_5_0_349,
      I1 => Registers_inst_reg_4_0_340,
      I2 => instruction_in_6_Q,
      O => Registers_inst_mux8_5_298
    );
  Registers_inst_mux8_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux8_5_298,
      I1 => Registers_inst_mux8_4_296,
      S => instruction_in_7_Q,
      O => Registers_inst_mux8_3_f5_295
    );
  Registers_inst_mux8_51 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_3_0_331,
      I1 => Registers_inst_reg_2_0_322,
      I2 => instruction_in_6_Q,
      O => Registers_inst_mux8_51_299
    );
  Registers_inst_mux8_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux8_6_300,
      I1 => Registers_inst_mux8_51_299,
      S => instruction_in_7_Q,
      O => Registers_inst_mux8_4_f5_297
    );
  Registers_inst_mux8_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux8_4_f5_297,
      I1 => Registers_inst_mux8_3_f5_295,
      S => instruction_in_8_Q,
      O => Rs1_data_out(0)
    );
  Registers_inst_mux7_4 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_6_7_365,
      I2 => Registers_inst_reg_7_7_374,
      O => Registers_inst_mux7_4_290
    );
  Registers_inst_mux7_5 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_4_7_347,
      I2 => Registers_inst_reg_5_7_356,
      O => Registers_inst_mux7_5_292
    );
  Registers_inst_mux7_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux7_5_292,
      I1 => Registers_inst_mux7_4_290,
      S => instruction_in_4_Q,
      O => Registers_inst_mux7_3_f5_289
    );
  Registers_inst_mux7_51 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_2_7_329,
      I2 => Registers_inst_reg_3_7_338,
      O => Registers_inst_mux7_51_293
    );
  Registers_inst_mux7_6 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => Registers_inst_reg_1_7_320,
      I1 => instruction_in_3_Q,
      O => Registers_inst_mux7_6_294
    );
  Registers_inst_mux7_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux7_6_294,
      I1 => Registers_inst_mux7_51_293,
      S => instruction_in_4_Q,
      O => Registers_inst_mux7_4_f5_291
    );
  Registers_inst_mux7_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux7_4_f5_291,
      I1 => Registers_inst_mux7_3_f5_289,
      S => instruction_in_5_Q,
      O => Rs2_data_out(7)
    );
  Registers_inst_mux6_4 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_6_6_364,
      I2 => Registers_inst_reg_7_6_373,
      O => Registers_inst_mux6_4_284
    );
  Registers_inst_mux6_5 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_4_6_346,
      I2 => Registers_inst_reg_5_6_355,
      O => Registers_inst_mux6_5_286
    );
  Registers_inst_mux6_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux6_5_286,
      I1 => Registers_inst_mux6_4_284,
      S => instruction_in_4_Q,
      O => Registers_inst_mux6_3_f5_283
    );
  Registers_inst_mux6_51 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_2_6_328,
      I2 => Registers_inst_reg_3_6_337,
      O => Registers_inst_mux6_51_287
    );
  Registers_inst_mux6_6 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => Registers_inst_reg_1_6_319,
      I1 => instruction_in_3_Q,
      O => Registers_inst_mux6_6_288
    );
  Registers_inst_mux6_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux6_6_288,
      I1 => Registers_inst_mux6_51_287,
      S => instruction_in_4_Q,
      O => Registers_inst_mux6_4_f5_285
    );
  Registers_inst_mux6_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux6_4_f5_285,
      I1 => Registers_inst_mux6_3_f5_283,
      S => instruction_in_5_Q,
      O => Rs2_data_out(6)
    );
  Registers_inst_mux5_4 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_6_5_363,
      I2 => Registers_inst_reg_7_5_372,
      O => Registers_inst_mux5_4_278
    );
  Registers_inst_mux5_5 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_4_5_345,
      I2 => Registers_inst_reg_5_5_354,
      O => Registers_inst_mux5_5_280
    );
  Registers_inst_mux5_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux5_5_280,
      I1 => Registers_inst_mux5_4_278,
      S => instruction_in_4_Q,
      O => Registers_inst_mux5_3_f5_277
    );
  Registers_inst_mux5_51 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_2_5_327,
      I2 => Registers_inst_reg_3_5_336,
      O => Registers_inst_mux5_51_281
    );
  Registers_inst_mux5_6 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => Registers_inst_reg_1_5_318,
      I1 => instruction_in_3_Q,
      O => Registers_inst_mux5_6_282
    );
  Registers_inst_mux5_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux5_6_282,
      I1 => Registers_inst_mux5_51_281,
      S => instruction_in_4_Q,
      O => Registers_inst_mux5_4_f5_279
    );
  Registers_inst_mux5_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux5_4_f5_279,
      I1 => Registers_inst_mux5_3_f5_277,
      S => instruction_in_5_Q,
      O => Rs2_data_out(5)
    );
  Registers_inst_mux4_4 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_6_4_362,
      I2 => Registers_inst_reg_7_4_371,
      O => Registers_inst_mux4_4_272
    );
  Registers_inst_mux4_5 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_4_4_344,
      I2 => Registers_inst_reg_5_4_353,
      O => Registers_inst_mux4_5_274
    );
  Registers_inst_mux4_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux4_5_274,
      I1 => Registers_inst_mux4_4_272,
      S => instruction_in_4_Q,
      O => Registers_inst_mux4_3_f5_271
    );
  Registers_inst_mux4_51 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_2_4_326,
      I2 => Registers_inst_reg_3_4_335,
      O => Registers_inst_mux4_51_275
    );
  Registers_inst_mux4_6 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => Registers_inst_reg_1_4_317,
      I1 => instruction_in_3_Q,
      O => Registers_inst_mux4_6_276
    );
  Registers_inst_mux4_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux4_6_276,
      I1 => Registers_inst_mux4_51_275,
      S => instruction_in_4_Q,
      O => Registers_inst_mux4_4_f5_273
    );
  Registers_inst_mux4_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux4_4_f5_273,
      I1 => Registers_inst_mux4_3_f5_271,
      S => instruction_in_5_Q,
      O => Rs2_data_out(4)
    );
  Registers_inst_mux3_4 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_6_3_361,
      I2 => Registers_inst_reg_7_3_370,
      O => Registers_inst_mux3_4_266
    );
  Registers_inst_mux3_5 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_4_3_343,
      I2 => Registers_inst_reg_5_3_352,
      O => Registers_inst_mux3_5_268
    );
  Registers_inst_mux3_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux3_5_268,
      I1 => Registers_inst_mux3_4_266,
      S => instruction_in_4_Q,
      O => Registers_inst_mux3_3_f5_265
    );
  Registers_inst_mux3_51 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => Registers_inst_reg_2_3_325,
      I2 => Registers_inst_reg_3_3_334,
      O => Registers_inst_mux3_51_269
    );
  Registers_inst_mux3_6 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => Registers_inst_reg_1_3_316,
      I1 => instruction_in_3_Q,
      O => Registers_inst_mux3_6_270
    );
  Registers_inst_mux3_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux3_6_270,
      I1 => Registers_inst_mux3_51_269,
      S => instruction_in_4_Q,
      O => Registers_inst_mux3_4_f5_267
    );
  Registers_inst_mux3_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux3_4_f5_267,
      I1 => Registers_inst_mux3_3_f5_265,
      S => instruction_in_5_Q,
      O => Rs2_data_out(3)
    );
  Registers_inst_mux2_4 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_7_2_369,
      I1 => Registers_inst_reg_6_2_360,
      I2 => instruction_in_3_Q,
      O => Registers_inst_mux2_4_260
    );
  Registers_inst_mux2_5 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_5_2_351,
      I1 => Registers_inst_reg_4_2_342,
      I2 => instruction_in_3_Q,
      O => Registers_inst_mux2_5_262
    );
  Registers_inst_mux2_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux2_5_262,
      I1 => Registers_inst_mux2_4_260,
      S => instruction_in_4_Q,
      O => Registers_inst_mux2_3_f5_259
    );
  Registers_inst_mux2_51 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_3_2_333,
      I1 => Registers_inst_reg_2_2_324,
      I2 => instruction_in_3_Q,
      O => Registers_inst_mux2_51_263
    );
  Registers_inst_mux2_6 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => Registers_inst_reg_1_2_315,
      I1 => instruction_in_3_Q,
      O => Registers_inst_mux2_6_264
    );
  Registers_inst_mux2_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux2_6_264,
      I1 => Registers_inst_mux2_51_263,
      S => instruction_in_4_Q,
      O => Registers_inst_mux2_4_f5_261
    );
  Registers_inst_mux2_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux2_4_f5_261,
      I1 => Registers_inst_mux2_3_f5_259,
      S => instruction_in_5_Q,
      O => Rs2_data_out(2)
    );
  Registers_inst_mux1_4 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_7_1_368,
      I1 => Registers_inst_reg_6_1_359,
      I2 => instruction_in_3_Q,
      O => Registers_inst_mux1_4_254
    );
  Registers_inst_mux1_5 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_5_1_350,
      I1 => Registers_inst_reg_4_1_341,
      I2 => instruction_in_3_Q,
      O => Registers_inst_mux1_5_256
    );
  Registers_inst_mux1_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux1_5_256,
      I1 => Registers_inst_mux1_4_254,
      S => instruction_in_4_Q,
      O => Registers_inst_mux1_3_f5_253
    );
  Registers_inst_mux1_51 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_3_1_332,
      I1 => Registers_inst_reg_2_1_323,
      I2 => instruction_in_3_Q,
      O => Registers_inst_mux1_51_257
    );
  Registers_inst_mux1_6 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => Registers_inst_reg_1_1_314,
      I1 => instruction_in_3_Q,
      O => Registers_inst_mux1_6_258
    );
  Registers_inst_mux1_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux1_6_258,
      I1 => Registers_inst_mux1_51_257,
      S => instruction_in_4_Q,
      O => Registers_inst_mux1_4_f5_255
    );
  Registers_inst_mux1_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux1_4_f5_255,
      I1 => Registers_inst_mux1_3_f5_253,
      S => instruction_in_5_Q,
      O => Rs2_data_out(1)
    );
  Registers_inst_mux_4 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_7_0_367,
      I1 => Registers_inst_reg_6_0_358,
      I2 => instruction_in_3_Q,
      O => Registers_inst_mux_4_308
    );
  Registers_inst_mux_5 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_5_0_349,
      I1 => Registers_inst_reg_4_0_340,
      I2 => instruction_in_3_Q,
      O => Registers_inst_mux_5_310
    );
  Registers_inst_mux_3_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux_5_310,
      I1 => Registers_inst_mux_4_308,
      S => instruction_in_4_Q,
      O => Registers_inst_mux_3_f5_307
    );
  Registers_inst_mux_51 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Registers_inst_reg_3_0_331,
      I1 => Registers_inst_reg_2_0_322,
      I2 => instruction_in_3_Q,
      O => Registers_inst_mux_51_311
    );
  Registers_inst_mux_6 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => Registers_inst_reg_1_0_313,
      I1 => instruction_in_3_Q,
      O => Registers_inst_mux_6_312
    );
  Registers_inst_mux_4_f5 : MUXF5
    port map (
      I0 => Registers_inst_mux_6_312,
      I1 => Registers_inst_mux_51_311,
      S => instruction_in_4_Q,
      O => Registers_inst_mux_4_f5_309
    );
  Registers_inst_mux_2_f6 : MUXF6
    port map (
      I0 => Registers_inst_mux_4_f5_309,
      I1 => Registers_inst_mux_3_f5_307,
      S => instruction_in_5_Q,
      O => Rs2_data_out(0)
    );
  Registers_inst_reg_7_7 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_7_and0000,
      CLR => rst_IBUF_453,
      D => result_7_OBUF_451,
      Q => Registers_inst_reg_7_7_374
    );
  Registers_inst_reg_7_6 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_7_and0000,
      CLR => rst_IBUF_453,
      D => result_6_OBUF_450,
      Q => Registers_inst_reg_7_6_373
    );
  Registers_inst_reg_7_5 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_7_and0000,
      CLR => rst_IBUF_453,
      D => result_5_OBUF_449,
      Q => Registers_inst_reg_7_5_372
    );
  Registers_inst_reg_7_4 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_7_and0000,
      CLR => rst_IBUF_453,
      D => result_4_OBUF_448,
      Q => Registers_inst_reg_7_4_371
    );
  Registers_inst_reg_7_3 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_7_and0000,
      CLR => rst_IBUF_453,
      D => result_3_OBUF_447,
      Q => Registers_inst_reg_7_3_370
    );
  Registers_inst_reg_7_2 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_7_and0000,
      CLR => rst_IBUF_453,
      D => result_2_OBUF_446,
      Q => Registers_inst_reg_7_2_369
    );
  Registers_inst_reg_7_1 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_7_and0000,
      CLR => rst_IBUF_453,
      D => result_1_OBUF_445,
      Q => Registers_inst_reg_7_1_368
    );
  Registers_inst_reg_7_0 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_7_and0000,
      CLR => rst_IBUF_453,
      D => result_0_OBUF_444,
      Q => Registers_inst_reg_7_0_367
    );
  Registers_inst_reg_6_7 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_6_and0000,
      CLR => rst_IBUF_453,
      D => result_7_OBUF_451,
      Q => Registers_inst_reg_6_7_365
    );
  Registers_inst_reg_6_6 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_6_and0000,
      CLR => rst_IBUF_453,
      D => result_6_OBUF_450,
      Q => Registers_inst_reg_6_6_364
    );
  Registers_inst_reg_6_5 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_6_and0000,
      CLR => rst_IBUF_453,
      D => result_5_OBUF_449,
      Q => Registers_inst_reg_6_5_363
    );
  Registers_inst_reg_6_4 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_6_and0000,
      CLR => rst_IBUF_453,
      D => result_4_OBUF_448,
      Q => Registers_inst_reg_6_4_362
    );
  Registers_inst_reg_6_3 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_6_and0000,
      CLR => rst_IBUF_453,
      D => result_3_OBUF_447,
      Q => Registers_inst_reg_6_3_361
    );
  Registers_inst_reg_6_2 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_6_and0000,
      CLR => rst_IBUF_453,
      D => result_2_OBUF_446,
      Q => Registers_inst_reg_6_2_360
    );
  Registers_inst_reg_6_1 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_6_and0000,
      CLR => rst_IBUF_453,
      D => result_1_OBUF_445,
      Q => Registers_inst_reg_6_1_359
    );
  Registers_inst_reg_6_0 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_6_and0000,
      CLR => rst_IBUF_453,
      D => result_0_OBUF_444,
      Q => Registers_inst_reg_6_0_358
    );
  Registers_inst_reg_5_7 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_5_and0000,
      CLR => rst_IBUF_453,
      D => result_7_OBUF_451,
      Q => Registers_inst_reg_5_7_356
    );
  Registers_inst_reg_5_6 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_5_and0000,
      CLR => rst_IBUF_453,
      D => result_6_OBUF_450,
      Q => Registers_inst_reg_5_6_355
    );
  Registers_inst_reg_5_5 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_5_and0000,
      CLR => rst_IBUF_453,
      D => result_5_OBUF_449,
      Q => Registers_inst_reg_5_5_354
    );
  Registers_inst_reg_5_4 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_5_and0000,
      CLR => rst_IBUF_453,
      D => result_4_OBUF_448,
      Q => Registers_inst_reg_5_4_353
    );
  Registers_inst_reg_5_3 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_5_and0000,
      CLR => rst_IBUF_453,
      D => result_3_OBUF_447,
      Q => Registers_inst_reg_5_3_352
    );
  Registers_inst_reg_5_2 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_5_and0000,
      CLR => rst_IBUF_453,
      D => result_2_OBUF_446,
      Q => Registers_inst_reg_5_2_351
    );
  Registers_inst_reg_5_1 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_5_and0000,
      CLR => rst_IBUF_453,
      D => result_1_OBUF_445,
      Q => Registers_inst_reg_5_1_350
    );
  Registers_inst_reg_5_0 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_5_and0000,
      CLR => rst_IBUF_453,
      D => result_0_OBUF_444,
      Q => Registers_inst_reg_5_0_349
    );
  Registers_inst_reg_4_7 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_4_and0000,
      CLR => rst_IBUF_453,
      D => result_7_OBUF_451,
      Q => Registers_inst_reg_4_7_347
    );
  Registers_inst_reg_4_6 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_4_and0000,
      CLR => rst_IBUF_453,
      D => result_6_OBUF_450,
      Q => Registers_inst_reg_4_6_346
    );
  Registers_inst_reg_4_5 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_4_and0000,
      CLR => rst_IBUF_453,
      D => result_5_OBUF_449,
      Q => Registers_inst_reg_4_5_345
    );
  Registers_inst_reg_4_4 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_4_and0000,
      CLR => rst_IBUF_453,
      D => result_4_OBUF_448,
      Q => Registers_inst_reg_4_4_344
    );
  Registers_inst_reg_4_3 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_4_and0000,
      CLR => rst_IBUF_453,
      D => result_3_OBUF_447,
      Q => Registers_inst_reg_4_3_343
    );
  Registers_inst_reg_4_2 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_4_and0000,
      CLR => rst_IBUF_453,
      D => result_2_OBUF_446,
      Q => Registers_inst_reg_4_2_342
    );
  Registers_inst_reg_4_1 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_4_and0000,
      CLR => rst_IBUF_453,
      D => result_1_OBUF_445,
      Q => Registers_inst_reg_4_1_341
    );
  Registers_inst_reg_4_0 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_4_and0000,
      CLR => rst_IBUF_453,
      D => result_0_OBUF_444,
      Q => Registers_inst_reg_4_0_340
    );
  Registers_inst_reg_2_7 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_2_and0000,
      CLR => rst_IBUF_453,
      D => result_7_OBUF_451,
      Q => Registers_inst_reg_2_7_329
    );
  Registers_inst_reg_2_6 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_2_and0000,
      CLR => rst_IBUF_453,
      D => result_6_OBUF_450,
      Q => Registers_inst_reg_2_6_328
    );
  Registers_inst_reg_2_5 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_2_and0000,
      CLR => rst_IBUF_453,
      D => result_5_OBUF_449,
      Q => Registers_inst_reg_2_5_327
    );
  Registers_inst_reg_2_4 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_2_and0000,
      CLR => rst_IBUF_453,
      D => result_4_OBUF_448,
      Q => Registers_inst_reg_2_4_326
    );
  Registers_inst_reg_2_3 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_2_and0000,
      CLR => rst_IBUF_453,
      D => result_3_OBUF_447,
      Q => Registers_inst_reg_2_3_325
    );
  Registers_inst_reg_2_2 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_2_and0000,
      CLR => rst_IBUF_453,
      D => result_2_OBUF_446,
      Q => Registers_inst_reg_2_2_324
    );
  Registers_inst_reg_2_1 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_2_and0000,
      CLR => rst_IBUF_453,
      D => result_1_OBUF_445,
      Q => Registers_inst_reg_2_1_323
    );
  Registers_inst_reg_2_0 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_2_and0000,
      CLR => rst_IBUF_453,
      D => result_0_OBUF_444,
      Q => Registers_inst_reg_2_0_322
    );
  Registers_inst_reg_1_7 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_1_and0000,
      CLR => rst_IBUF_453,
      D => result_7_OBUF_451,
      Q => Registers_inst_reg_1_7_320
    );
  Registers_inst_reg_1_6 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_1_and0000,
      CLR => rst_IBUF_453,
      D => result_6_OBUF_450,
      Q => Registers_inst_reg_1_6_319
    );
  Registers_inst_reg_1_5 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_1_and0000,
      CLR => rst_IBUF_453,
      D => result_5_OBUF_449,
      Q => Registers_inst_reg_1_5_318
    );
  Registers_inst_reg_1_4 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_1_and0000,
      CLR => rst_IBUF_453,
      D => result_4_OBUF_448,
      Q => Registers_inst_reg_1_4_317
    );
  Registers_inst_reg_1_3 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_1_and0000,
      CLR => rst_IBUF_453,
      D => result_3_OBUF_447,
      Q => Registers_inst_reg_1_3_316
    );
  Registers_inst_reg_1_2 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_1_and0000,
      CLR => rst_IBUF_453,
      D => result_2_OBUF_446,
      Q => Registers_inst_reg_1_2_315
    );
  Registers_inst_reg_1_1 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_1_and0000,
      CLR => rst_IBUF_453,
      D => result_1_OBUF_445,
      Q => Registers_inst_reg_1_1_314
    );
  Registers_inst_reg_1_0 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_1_and0000,
      CLR => rst_IBUF_453,
      D => result_0_OBUF_444,
      Q => Registers_inst_reg_1_0_313
    );
  Registers_inst_reg_3_7 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_3_and0000,
      CLR => rst_IBUF_453,
      D => result_7_OBUF_451,
      Q => Registers_inst_reg_3_7_338
    );
  Registers_inst_reg_3_6 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_3_and0000,
      CLR => rst_IBUF_453,
      D => result_6_OBUF_450,
      Q => Registers_inst_reg_3_6_337
    );
  Registers_inst_reg_3_5 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_3_and0000,
      CLR => rst_IBUF_453,
      D => result_5_OBUF_449,
      Q => Registers_inst_reg_3_5_336
    );
  Registers_inst_reg_3_4 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_3_and0000,
      CLR => rst_IBUF_453,
      D => result_4_OBUF_448,
      Q => Registers_inst_reg_3_4_335
    );
  Registers_inst_reg_3_3 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_3_and0000,
      CLR => rst_IBUF_453,
      D => result_3_OBUF_447,
      Q => Registers_inst_reg_3_3_334
    );
  Registers_inst_reg_3_2 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_3_and0000,
      CLR => rst_IBUF_453,
      D => result_2_OBUF_446,
      Q => Registers_inst_reg_3_2_333
    );
  Registers_inst_reg_3_1 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_3_and0000,
      CLR => rst_IBUF_453,
      D => result_1_OBUF_445,
      Q => Registers_inst_reg_3_1_332
    );
  Registers_inst_reg_3_0 : FDCE
    port map (
      C => clk_BUFGP_393,
      CE => Registers_inst_reg_3_and0000,
      CLR => rst_IBUF_453,
      D => result_0_OBUF_444,
      Q => Registers_inst_reg_3_0_331
    );
  ALU_inst_Maddsub_result_addsub0000_xor_7_Q : XORCY
    port map (
      CI => ALU_inst_Maddsub_result_addsub0000_cy(6),
      LI => ALU_inst_Maddsub_result_addsub0000_lut(7),
      O => ALU_inst_result_addsub0000(7)
    );
  ALU_inst_Maddsub_result_addsub0000_lut_7_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => ALU_inst_result_mux0000,
      I1 => Rs1_data_out(7),
      I2 => operand_2_7_OBUF_435,
      O => ALU_inst_Maddsub_result_addsub0000_lut(7)
    );
  ALU_inst_Maddsub_result_addsub0000_xor_6_Q : XORCY
    port map (
      CI => ALU_inst_Maddsub_result_addsub0000_cy(5),
      LI => ALU_inst_Maddsub_result_addsub0000_lut(6),
      O => ALU_inst_result_addsub0000(6)
    );
  ALU_inst_Maddsub_result_addsub0000_cy_6_Q : MUXCY
    port map (
      CI => ALU_inst_Maddsub_result_addsub0000_cy(5),
      DI => Rs1_data_out(6),
      S => ALU_inst_Maddsub_result_addsub0000_lut(6),
      O => ALU_inst_Maddsub_result_addsub0000_cy(6)
    );
  ALU_inst_Maddsub_result_addsub0000_xor_5_Q : XORCY
    port map (
      CI => ALU_inst_Maddsub_result_addsub0000_cy(4),
      LI => ALU_inst_Maddsub_result_addsub0000_lut(5),
      O => ALU_inst_result_addsub0000(5)
    );
  ALU_inst_Maddsub_result_addsub0000_cy_5_Q : MUXCY
    port map (
      CI => ALU_inst_Maddsub_result_addsub0000_cy(4),
      DI => Rs1_data_out(5),
      S => ALU_inst_Maddsub_result_addsub0000_lut(5),
      O => ALU_inst_Maddsub_result_addsub0000_cy(5)
    );
  ALU_inst_Maddsub_result_addsub0000_xor_4_Q : XORCY
    port map (
      CI => ALU_inst_Maddsub_result_addsub0000_cy(3),
      LI => ALU_inst_Maddsub_result_addsub0000_lut(4),
      O => ALU_inst_result_addsub0000(4)
    );
  ALU_inst_Maddsub_result_addsub0000_cy_4_Q : MUXCY
    port map (
      CI => ALU_inst_Maddsub_result_addsub0000_cy(3),
      DI => Rs1_data_out(4),
      S => ALU_inst_Maddsub_result_addsub0000_lut(4),
      O => ALU_inst_Maddsub_result_addsub0000_cy(4)
    );
  ALU_inst_Maddsub_result_addsub0000_xor_3_Q : XORCY
    port map (
      CI => ALU_inst_Maddsub_result_addsub0000_cy(2),
      LI => ALU_inst_Maddsub_result_addsub0000_lut(3),
      O => ALU_inst_result_addsub0000(3)
    );
  ALU_inst_Maddsub_result_addsub0000_cy_3_Q : MUXCY
    port map (
      CI => ALU_inst_Maddsub_result_addsub0000_cy(2),
      DI => Rs1_data_out(3),
      S => ALU_inst_Maddsub_result_addsub0000_lut(3),
      O => ALU_inst_Maddsub_result_addsub0000_cy(3)
    );
  ALU_inst_Maddsub_result_addsub0000_xor_2_Q : XORCY
    port map (
      CI => ALU_inst_Maddsub_result_addsub0000_cy(1),
      LI => ALU_inst_Maddsub_result_addsub0000_lut(2),
      O => ALU_inst_result_addsub0000(2)
    );
  ALU_inst_Maddsub_result_addsub0000_cy_2_Q : MUXCY
    port map (
      CI => ALU_inst_Maddsub_result_addsub0000_cy(1),
      DI => Rs1_data_out(2),
      S => ALU_inst_Maddsub_result_addsub0000_lut(2),
      O => ALU_inst_Maddsub_result_addsub0000_cy(2)
    );
  ALU_inst_Maddsub_result_addsub0000_xor_1_Q : XORCY
    port map (
      CI => ALU_inst_Maddsub_result_addsub0000_cy(0),
      LI => ALU_inst_Maddsub_result_addsub0000_lut(1),
      O => ALU_inst_result_addsub0000(1)
    );
  ALU_inst_Maddsub_result_addsub0000_cy_1_Q : MUXCY
    port map (
      CI => ALU_inst_Maddsub_result_addsub0000_cy(0),
      DI => Rs1_data_out(1),
      S => ALU_inst_Maddsub_result_addsub0000_lut(1),
      O => ALU_inst_Maddsub_result_addsub0000_cy(1)
    );
  ALU_inst_Maddsub_result_addsub0000_xor_0_Q : XORCY
    port map (
      CI => ALU_inst_result_mux0000,
      LI => ALU_inst_Maddsub_result_addsub0000_lut(0),
      O => ALU_inst_result_addsub0000(0)
    );
  ALU_inst_Maddsub_result_addsub0000_cy_0_Q : MUXCY
    port map (
      CI => ALU_inst_result_mux0000,
      DI => Rs1_data_out(0),
      S => ALU_inst_Maddsub_result_addsub0000_lut(0),
      O => ALU_inst_Maddsub_result_addsub0000_cy(0)
    );
  ALU_inst_Maddsub_result_addsub0000_lut_0_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => ALU_inst_result_mux0000,
      I1 => Rs1_data_out(0),
      I2 => operand_2_0_OBUF_428,
      O => ALU_inst_Maddsub_result_addsub0000_lut(0)
    );
  Registers_inst_reg_7_and00001 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => PC_incr,
      I1 => instruction_in_9_Q,
      I2 => instruction_in_10_Q,
      I3 => instruction_in_11_Q,
      O => Registers_inst_reg_7_and0000
    );
  Registers_inst_reg_6_and00001 : LUT4
    generic map(
      INIT => X"2000"
    )
    port map (
      I0 => PC_incr,
      I1 => instruction_in_9_Q,
      I2 => instruction_in_10_Q,
      I3 => instruction_in_11_Q,
      O => Registers_inst_reg_6_and0000
    );
  Registers_inst_reg_5_and00001 : LUT4
    generic map(
      INIT => X"2000"
    )
    port map (
      I0 => instruction_in_9_Q,
      I1 => instruction_in_10_Q,
      I2 => PC_incr,
      I3 => instruction_in_11_Q,
      O => Registers_inst_reg_5_and0000
    );
  Registers_inst_reg_4_and00001 : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => PC_incr,
      I1 => instruction_in_9_Q,
      I2 => instruction_in_10_Q,
      I3 => instruction_in_11_Q,
      O => Registers_inst_reg_4_and0000
    );
  Registers_inst_reg_3_and00001 : LUT4
    generic map(
      INIT => X"2000"
    )
    port map (
      I0 => instruction_in_9_Q,
      I1 => instruction_in_11_Q,
      I2 => instruction_in_10_Q,
      I3 => PC_incr,
      O => Registers_inst_reg_3_and0000
    );
  Registers_inst_reg_2_and00001 : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => instruction_in_10_Q,
      I1 => instruction_in_9_Q,
      I2 => instruction_in_11_Q,
      I3 => PC_incr,
      O => Registers_inst_reg_2_and0000
    );
  Registers_inst_reg_1_and00001 : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => instruction_in_9_Q,
      I1 => instruction_in_11_Q,
      I2 => instruction_in_10_Q,
      I3 => PC_incr,
      O => Registers_inst_reg_1_and0000
    );
  Controller_inst_operand_2_7_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => N159,
      I1 => Rs2_data_out(7),
      I2 => Controller_inst_Mrom_control_reg,
      O => operand_2_7_OBUF_435
    );
  Decoder_inst_immediate_out_2_1 : LUT4
    generic map(
      INIT => X"20E0"
    )
    port map (
      I0 => instruction_in_12_Q,
      I1 => instruction_in_15_Q,
      I2 => instruction_in_0_Q,
      I3 => N165,
      O => N132
    );
  Controller_inst_operand_2_6_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => Controller_inst_Mrom_control_reg,
      I1 => Rs2_data_out(6),
      I2 => immediate(5),
      O => operand_2_6_OBUF_434
    );
  Controller_inst_operand_2_5_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => Controller_inst_Mrom_control_reg,
      I1 => Rs2_data_out(5),
      I2 => immediate(5),
      O => operand_2_5_OBUF_433
    );
  Controller_inst_operand_2_2_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => N132,
      I1 => Rs2_data_out(2),
      I2 => N166,
      O => operand_2_2_OBUF_430
    );
  Instructions_ROM_inst_Mrom_data_out3711 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => PC_inst_PC_reg(3),
      I1 => PC_inst_PC_reg(2),
      I2 => PC_inst_PC_reg(1),
      I3 => N4,
      O => instruction_in_12_Q
    );
  ALU_inst_opcode_1_181 : LUT3
    generic map(
      INIT => X"FD"
    )
    port map (
      I0 => Rs1_data_out(0),
      I1 => operand_2_0_OBUF_428,
      I2 => operand_2_1_OBUF_429,
      O => ALU_inst_opcode_1_1_bdd2
    );
  Controller_inst_operand_2_0_1 : LUT3
    generic map(
      INIT => X"B8"
    )
    port map (
      I0 => Decoder_inst_immediate_out_2_1_65,
      I1 => Controller_inst_Mrom_control_reg111,
      I2 => Rs2_data_out(0),
      O => operand_2_0_OBUF_428
    );
  Controller_inst_Mrom_control_reg11 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => instruction_in_15_Q,
      I1 => instruction_in_12_Q,
      I2 => instruction_in_13_Q,
      O => Controller_inst_Mrom_control_reg
    );
  Instructions_ROM_inst_Mrom_data_out151 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => PC_inst_PC_reg(2),
      I1 => PC_inst_PC_reg(0),
      I2 => PC_inst_PC_reg(1),
      I3 => PC_inst_PC_reg(3),
      O => Instructions_ROM_inst_Mrom_data_out15
    );
  Instructions_ROM_inst_Mrom_data_out1 : LUT4
    generic map(
      INIT => X"FEEF"
    )
    port map (
      I0 => PC_inst_PC_reg(2),
      I1 => PC_inst_PC_reg(3),
      I2 => PC_inst_PC_reg(0),
      I3 => PC_inst_PC_reg(1),
      O => Instructions_ROM_inst_Mrom_data_out
    );
  Instructions_ROM_inst_Mrom_data_out141 : LUT3
    generic map(
      INIT => X"9F"
    )
    port map (
      I0 => PC_inst_PC_reg(0),
      I1 => PC_inst_PC_reg(1),
      I2 => PC_inst_PC_reg(3),
      O => Instructions_ROM_inst_Mrom_data_out14
    );
  ALU_inst_opcode_1_11118 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => operand_2_2_OBUF_430,
      I2 => ALU_inst_opcode_1_11_bdd1,
      O => ALU_inst_opcode_1_11118_21
    );
  ALU_inst_opcode_1_512 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => operand_2_2_OBUF_430,
      I2 => ALU_inst_opcode_1_13_bdd0,
      O => ALU_inst_opcode_1_512_40
    );
  Instructions_ROM_inst_Mrom_data_out1111 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => PC_inst_PC_reg(0),
      I1 => PC_inst_PC_reg(3),
      O => Instructions_ROM_inst_Mrom_data_out11
    );
  Instructions_ROM_inst_Mrom_data_out91 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => PC_inst_PC_reg(2),
      I1 => PC_inst_PC_reg(3),
      I2 => PC_inst_PC_reg(0),
      O => Instructions_ROM_inst_Mrom_data_out9
    );
  Controller_inst_operand_2_1_1 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => Controller_inst_Mrom_control_reg11_58,
      I1 => Decoder_inst_immediate_out_2_1_65,
      I2 => Rs2_data_out(1),
      O => operand_2_1_OBUF_429
    );
  ALU_inst_opcode_1_1512 : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => Rs1_data_out(4),
      I1 => Rs1_data_out(6),
      I2 => N167,
      O => ALU_inst_opcode_1_1_bdd5
    );
  ALU_inst_opcode_1_1312 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => Rs1_data_out(7),
      I1 => Rs1_data_out(5),
      I2 => operand_2_1_OBUF_429,
      O => ALU_inst_opcode_1_1_bdd4
    );
  ALU_inst_opcode_1_15115 : LUT4
    generic map(
      INIT => X"AAA8"
    )
    port map (
      I0 => instruction_in_12_Q,
      I1 => instruction_in_13_Q,
      I2 => operand_2_2_OBUF_430,
      I3 => ALU_inst_opcode_1_15_bdd0,
      O => ALU_inst_opcode_1_15115_31
    );
  ALU_inst_opcode_1_12123 : LUT4
    generic map(
      INIT => X"3332"
    )
    port map (
      I0 => operand_2_2_OBUF_430,
      I1 => instruction_in_12_Q,
      I2 => instruction_in_13_Q,
      I3 => ALU_inst_opcode_1_1_bdd2,
      O => ALU_inst_opcode_1_12123_23
    );
  rst_IBUF : IBUF
    port map (
      I => rst,
      O => rst_IBUF_453
    );
  result_7_OBUF : OBUF
    port map (
      I => result_7_OBUF_451,
      O => result(7)
    );
  result_6_OBUF : OBUF
    port map (
      I => result_6_OBUF_450,
      O => result(6)
    );
  result_5_OBUF : OBUF
    port map (
      I => result_5_OBUF_449,
      O => result(5)
    );
  result_4_OBUF : OBUF
    port map (
      I => result_4_OBUF_448,
      O => result(4)
    );
  result_3_OBUF : OBUF
    port map (
      I => result_3_OBUF_447,
      O => result(3)
    );
  result_2_OBUF : OBUF
    port map (
      I => result_2_OBUF_446,
      O => result(2)
    );
  result_1_OBUF : OBUF
    port map (
      I => result_1_OBUF_445,
      O => result(1)
    );
  result_0_OBUF : OBUF
    port map (
      I => result_0_OBUF_444,
      O => result(0)
    );
  operand_1_7_OBUF : OBUF
    port map (
      I => Rs1_data_out(7),
      O => operand_1(7)
    );
  operand_1_6_OBUF : OBUF
    port map (
      I => Rs1_data_out(6),
      O => operand_1(6)
    );
  operand_1_5_OBUF : OBUF
    port map (
      I => Rs1_data_out(5),
      O => operand_1(5)
    );
  operand_1_4_OBUF : OBUF
    port map (
      I => Rs1_data_out(4),
      O => operand_1(4)
    );
  operand_1_3_OBUF : OBUF
    port map (
      I => Rs1_data_out(3),
      O => operand_1(3)
    );
  operand_1_2_OBUF : OBUF
    port map (
      I => Rs1_data_out(2),
      O => operand_1(2)
    );
  operand_1_1_OBUF : OBUF
    port map (
      I => Rs1_data_out(1),
      O => operand_1(1)
    );
  operand_1_0_OBUF : OBUF
    port map (
      I => Rs1_data_out(0),
      O => operand_1(0)
    );
  operand_2_7_OBUF : OBUF
    port map (
      I => operand_2_7_OBUF_435,
      O => operand_2(7)
    );
  operand_2_6_OBUF : OBUF
    port map (
      I => operand_2_6_OBUF_434,
      O => operand_2(6)
    );
  operand_2_5_OBUF : OBUF
    port map (
      I => operand_2_5_OBUF_433,
      O => operand_2(5)
    );
  operand_2_4_OBUF : OBUF
    port map (
      I => operand_2_4_OBUF_432,
      O => operand_2(4)
    );
  operand_2_3_OBUF : OBUF
    port map (
      I => operand_2_3_OBUF_431,
      O => operand_2(3)
    );
  operand_2_2_OBUF : OBUF
    port map (
      I => operand_2_2_OBUF_430,
      O => operand_2(2)
    );
  operand_2_1_OBUF : OBUF
    port map (
      I => operand_2_1_OBUF_429,
      O => operand_2(1)
    );
  operand_2_0_OBUF : OBUF
    port map (
      I => operand_2_0_OBUF_428,
      O => operand_2(0)
    );
  opcode_3_OBUF : OBUF
    port map (
      I => instruction_in_15_Q,
      O => opcode(3)
    );
  opcode_2_OBUF : OBUF
    port map (
      I => Instructions_ROM_inst_Mrom_data_out37,
      O => opcode(2)
    );
  opcode_1_OBUF : OBUF
    port map (
      I => instruction_in_13_Q,
      O => opcode(1)
    );
  opcode_0_OBUF : OBUF
    port map (
      I => instruction_in_12_Q,
      O => opcode(0)
    );
  PC_inst_Mcount_PC_reg_cy_0_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PC_inst_PC_reg(0),
      O => PC_inst_Mcount_PC_reg_cy_0_rt_195
    );
  PC_inst_Mcount_PC_reg_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PC_inst_PC_reg(1),
      O => PC_inst_Mcount_PC_reg_cy_1_rt_197
    );
  PC_inst_Mcount_PC_reg_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PC_inst_PC_reg(2),
      O => PC_inst_Mcount_PC_reg_cy_2_rt_199
    );
  PC_inst_Mcount_PC_reg_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PC_inst_PC_reg(3),
      O => PC_inst_Mcount_PC_reg_cy_3_rt_201
    );
  PC_inst_Mcount_PC_reg_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PC_inst_PC_reg(4),
      O => PC_inst_Mcount_PC_reg_cy_4_rt_203
    );
  PC_inst_Mcount_PC_reg_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PC_inst_PC_reg(5),
      O => PC_inst_Mcount_PC_reg_cy_5_rt_205
    );
  PC_inst_Mcount_PC_reg_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PC_inst_PC_reg(6),
      O => PC_inst_Mcount_PC_reg_cy_6_rt_207
    );
  PC_inst_Mcount_PC_reg_xor_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      O => PC_inst_Mcount_PC_reg_xor_7_rt_208
    );
  Instructions_ROM_inst_Mrom_data_out201_2_f51 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => Instructions_ROM_inst_Mrom_data_out141_4_73,
      I2 => Instructions_ROM_inst_Mrom_data_out201_3_80,
      O => instruction_in_6_Q
    );
  Instructions_ROM_inst_Mrom_data_out231_2_f51 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => Instructions_ROM_inst_Mrom_data_out231_3_83,
      I2 => Instructions_ROM_inst_Mrom_data_out171_4_76,
      O => instruction_in_7_Q
    );
  Instructions_ROM_inst_Mrom_data_out261_2_f51 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => Instructions_ROM_inst_Mrom_data_out261_3_85,
      I2 => Instructions_ROM_inst_Mrom_data_out171_4_76,
      O => instruction_in_8_Q
    );
  Instructions_ROM_inst_Mrom_data_out351_2_f51 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => Instructions_ROM_inst_Mrom_data_out171_4_76,
      I2 => Instructions_ROM_inst_Mrom_data_out261_3_85,
      O => instruction_in_11_Q
    );
  Instructions_ROM_inst_Mrom_data_out401_2_f51 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => Instructions_ROM_inst_Mrom_data_out21_3_81,
      I2 => Instructions_ROM_inst_Mrom_data_out171_4_76,
      O => instruction_in_13_Q
    );
  ALU_inst_opcode_1_7147_SW0 : LUT4
    generic map(
      INIT => X"40EA"
    )
    port map (
      I0 => operand_2_0_OBUF_428,
      I1 => ALU_inst_opcode_1_7113_43,
      I2 => ALU_inst_opcode_1_719_44,
      I3 => ALU_inst_opcode_1_1_bdd5,
      O => N6
    );
  Registers_inst_mux15_6 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => Registers_inst_reg_1_7_320,
      I1 => PC_inst_PC_reg(7),
      I2 => Instructions_ROM_inst_Mrom_data_out141_4_73,
      I3 => Instructions_ROM_inst_Mrom_data_out201_3_80,
      O => Registers_inst_mux15_6_252
    );
  Registers_inst_mux14_6 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => Registers_inst_reg_1_6_319,
      I1 => PC_inst_PC_reg(7),
      I2 => Instructions_ROM_inst_Mrom_data_out141_4_73,
      I3 => Instructions_ROM_inst_Mrom_data_out201_3_80,
      O => Registers_inst_mux14_6_246
    );
  Registers_inst_mux13_6 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => Registers_inst_reg_1_5_318,
      I1 => PC_inst_PC_reg(7),
      I2 => Instructions_ROM_inst_Mrom_data_out141_4_73,
      I3 => Instructions_ROM_inst_Mrom_data_out201_3_80,
      O => Registers_inst_mux13_6_240
    );
  Registers_inst_mux12_6 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => Registers_inst_reg_1_4_317,
      I1 => PC_inst_PC_reg(7),
      I2 => Instructions_ROM_inst_Mrom_data_out141_4_73,
      I3 => Instructions_ROM_inst_Mrom_data_out201_3_80,
      O => Registers_inst_mux12_6_234
    );
  Registers_inst_mux11_6 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => Registers_inst_reg_1_3_316,
      I1 => PC_inst_PC_reg(7),
      I2 => Instructions_ROM_inst_Mrom_data_out141_4_73,
      I3 => Instructions_ROM_inst_Mrom_data_out201_3_80,
      O => Registers_inst_mux11_6_228
    );
  Registers_inst_mux10_6 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => Registers_inst_reg_1_2_315,
      I1 => PC_inst_PC_reg(7),
      I2 => Instructions_ROM_inst_Mrom_data_out141_4_73,
      I3 => Instructions_ROM_inst_Mrom_data_out201_3_80,
      O => Registers_inst_mux10_6_222
    );
  Registers_inst_mux9_6 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => Registers_inst_reg_1_1_314,
      I1 => PC_inst_PC_reg(7),
      I2 => Instructions_ROM_inst_Mrom_data_out141_4_73,
      I3 => Instructions_ROM_inst_Mrom_data_out201_3_80,
      O => Registers_inst_mux9_6_306
    );
  Registers_inst_mux8_6 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => Registers_inst_reg_1_0_313,
      I1 => PC_inst_PC_reg(7),
      I2 => Instructions_ROM_inst_Mrom_data_out141_4_73,
      I3 => Instructions_ROM_inst_Mrom_data_out201_3_80,
      O => Registers_inst_mux8_6_300
    );
  Instructions_ROM_inst_Mrom_data_out171 : LUT4
    generic map(
      INIT => X"AF9F"
    )
    port map (
      I0 => PC_inst_PC_reg(2),
      I1 => PC_inst_PC_reg(1),
      I2 => PC_inst_PC_reg(3),
      I3 => PC_inst_PC_reg(0),
      O => Instructions_ROM_inst_Mrom_data_out17
    );
  ALU_inst_Maddsub_result_addsub0000_lut_1_Q : LUT4
    generic map(
      INIT => X"53AC"
    )
    port map (
      I0 => N16,
      I1 => N15,
      I2 => Rs2_data_out(1),
      I3 => Rs1_data_out(1),
      O => ALU_inst_Maddsub_result_addsub0000_lut(1)
    );
  ALU_inst_Maddsub_result_addsub0000_lut_2_Q : LUT4
    generic map(
      INIT => X"47B8"
    )
    port map (
      I0 => N16,
      I1 => Rs2_data_out(2),
      I2 => N15,
      I3 => Rs1_data_out(2),
      O => ALU_inst_Maddsub_result_addsub0000_lut(2)
    );
  ALU_inst_Maddsub_result_addsub0000_lut_3_Q : LUT4
    generic map(
      INIT => X"27D8"
    )
    port map (
      I0 => Rs2_data_out(3),
      I1 => N22,
      I2 => N21,
      I3 => Rs1_data_out(3),
      O => ALU_inst_Maddsub_result_addsub0000_lut(3)
    );
  ALU_inst_Maddsub_result_addsub0000_lut_4_Q : LUT4
    generic map(
      INIT => X"27D8"
    )
    port map (
      I0 => Rs2_data_out(4),
      I1 => N25,
      I2 => N24,
      I3 => Rs1_data_out(4),
      O => ALU_inst_Maddsub_result_addsub0000_lut(4)
    );
  ALU_inst_opcode_1_51102 : LUT4
    generic map(
      INIT => X"0145"
    )
    port map (
      I0 => instruction_in_12_Q,
      I1 => ALU_inst_opcode_1_13_bdd7,
      I2 => N33,
      I3 => N34,
      O => ALU_inst_opcode_1_51102_39
    );
  ALU_inst_result_5_inv1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => instruction_in_15_Q,
      I1 => ALU_inst_result_addsub0000(5),
      I2 => ALU_inst_Mmux_result_35,
      O => result_5_OBUF_449
    );
  ALU_inst_result_4_inv1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => instruction_in_15_Q,
      I1 => ALU_inst_result_addsub0000(4),
      I2 => ALU_inst_Mmux_result_34,
      O => result_4_OBUF_448
    );
  ALU_inst_result_7_inv1 : LUT4
    generic map(
      INIT => X"5072"
    )
    port map (
      I0 => instruction_in_15_Q,
      I1 => ALU_inst_opcode_1_15115_31,
      I2 => ALU_inst_result_addsub0000(7),
      I3 => N53,
      O => result_7_OBUF_451
    );
  ALU_inst_result_2_inv1 : LUT4
    generic map(
      INIT => X"444E"
    )
    port map (
      I0 => instruction_in_15_Q,
      I1 => ALU_inst_result_addsub0000(2),
      I2 => ALU_inst_opcode_1_51102_39,
      I3 => N55,
      O => result_2_OBUF_446
    );
  ALU_inst_result_6_inv1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => instruction_in_15_Q,
      I1 => ALU_inst_result_addsub0000(6),
      I2 => ALU_inst_Mmux_result_36,
      O => result_6_OBUF_450
    );
  ALU_inst_result_1_inv1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => instruction_in_15_Q,
      I1 => ALU_inst_result_addsub0000(1),
      I2 => ALU_inst_Mmux_result_31,
      O => result_1_OBUF_445
    );
  Controller_inst_operand_2_1_1_SW0 : LUT4
    generic map(
      INIT => X"9AEE"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => instruction_in_15_Q,
      I2 => instruction_in_12_Q,
      I3 => instruction_in_0_Q,
      O => N15
    );
  Controller_inst_operand_2_1_1_SW1 : LUT4
    generic map(
      INIT => X"1613"
    )
    port map (
      I0 => instruction_in_0_Q,
      I1 => instruction_in_13_Q,
      I2 => instruction_in_15_Q,
      I3 => instruction_in_12_Q,
      O => N16
    );
  Controller_inst_operand_2_4_1_SW0 : LUT4
    generic map(
      INIT => X"FF6A"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => instruction_in_4_Q,
      I2 => instruction_in_12_Q,
      I3 => instruction_in_15_Q,
      O => N24
    );
  Controller_inst_operand_2_4_1_SW1 : LUT4
    generic map(
      INIT => X"3633"
    )
    port map (
      I0 => instruction_in_4_Q,
      I1 => instruction_in_13_Q,
      I2 => instruction_in_15_Q,
      I3 => instruction_in_12_Q,
      O => N25
    );
  ALU_inst_Maddsub_result_addsub0000_lut_6_Q : LUT4
    generic map(
      INIT => X"D827"
    )
    port map (
      I0 => Rs2_data_out(6),
      I1 => N67,
      I2 => N66,
      I3 => Rs1_data_out(6),
      O => ALU_inst_Maddsub_result_addsub0000_lut(6)
    );
  ALU_inst_Maddsub_result_addsub0000_lut_5_Q : LUT4
    generic map(
      INIT => X"D827"
    )
    port map (
      I0 => Rs2_data_out(5),
      I1 => N67,
      I2 => N66,
      I3 => Rs1_data_out(5),
      O => ALU_inst_Maddsub_result_addsub0000_lut(5)
    );
  ALU_inst_opcode_1_1275_SW0 : LUT4
    generic map(
      INIT => X"A888"
    )
    port map (
      I0 => instruction_in_12_Q,
      I1 => N162,
      I2 => ALU_inst_opcode_1_1217_24,
      I3 => ALU_inst_opcode_1_1237_25,
      O => N30
    );
  ALU_inst_opcode_1_719 : LUT4
    generic map(
      INIT => X"D8FF"
    )
    port map (
      I0 => N163,
      I1 => Rs2_data_out(1),
      I2 => instruction_in_0_Q,
      I3 => Rs1_data_out(3),
      O => ALU_inst_opcode_1_719_44
    );
  ALU_inst_result_7_inv1_SW0_SW0 : LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => N164,
      I1 => ALU_inst_opcode_1_151123_29,
      I2 => ALU_inst_opcode_1_151143_30,
      O => N80
    );
  ALU_inst_result_7_inv1_SW0_SW1 : LUT4
    generic map(
      INIT => X"4555"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => operand_2_2_OBUF_430,
      I2 => ALU_inst_opcode_1_151123_29,
      I3 => ALU_inst_opcode_1_151143_30,
      O => N81
    );
  ALU_inst_opcode_1_3183_SW0 : LUT4
    generic map(
      INIT => X"FBEA"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => operand_2_1_OBUF_429,
      I2 => N91,
      I3 => N90,
      O => N46
    );
  ALU_inst_opcode_1_13115_SW0 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => operand_2_2_OBUF_430,
      I2 => ALU_inst_opcode_1_13_bdd0,
      O => N95
    );
  ALU_inst_opcode_1_31117_SW0 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => operand_2_2_OBUF_430,
      I2 => ALU_inst_opcode_1_11_bdd1,
      O => N97
    );
  ALU_inst_opcode_1_5169_SW0_SW0 : LUT4
    generic map(
      INIT => X"D8FF"
    )
    port map (
      I0 => Controller_inst_Mrom_control_reg,
      I1 => N132,
      I2 => Rs2_data_out(2),
      I3 => ALU_inst_opcode_1_5122_41,
      O => N93
    );
  ALU_inst_result_0_inv1 : LUT4
    generic map(
      INIT => X"444E"
    )
    port map (
      I0 => instruction_in_15_Q,
      I1 => ALU_inst_result_addsub0000(0),
      I2 => ALU_inst_opcode_1_12123_23,
      I3 => N99,
      O => result_0_OBUF_444
    );
  Controller_inst_operand_2_5_1_SW0_SW0 : LUT4
    generic map(
      INIT => X"0905"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => instruction_in_5_Q,
      I2 => instruction_in_15_Q,
      I3 => instruction_in_12_Q,
      O => N66
    );
  Controller_inst_operand_2_5_1_SW0_SW1 : LUT4
    generic map(
      INIT => X"A9AA"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => instruction_in_5_Q,
      I2 => instruction_in_15_Q,
      I3 => instruction_in_12_Q,
      O => N67
    );
  Controller_inst_operand_2_3_1_SW1 : LUT4
    generic map(
      INIT => X"3633"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => instruction_in_13_Q,
      I2 => instruction_in_15_Q,
      I3 => instruction_in_12_Q,
      O => N22
    );
  Controller_inst_operand_2_3_1_SW0 : LUT4
    generic map(
      INIT => X"FF6A"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => instruction_in_12_Q,
      I2 => instruction_in_3_Q,
      I3 => instruction_in_15_Q,
      O => N21
    );
  ALU_inst_result_mux00002 : LUT4
    generic map(
      INIT => X"FFD8"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => Instructions_ROM_inst_Mrom_data_out21_3_81,
      I2 => Instructions_ROM_inst_Mrom_data_out171_4_76,
      I3 => instruction_in_15_Q,
      O => ALU_inst_result_mux0000
    );
  ALU_inst_opcode_1_1275_SW1 : MUXF5
    port map (
      I0 => N101,
      I1 => N102,
      S => ALU_inst_opcode_1_1237_25,
      O => N31
    );
  ALU_inst_opcode_1_1275_SW1_G : LUT4
    generic map(
      INIT => X"8A88"
    )
    port map (
      I0 => instruction_in_12_Q,
      I1 => instruction_in_13_Q,
      I2 => operand_2_2_OBUF_430,
      I3 => ALU_inst_opcode_1_1217_24,
      O => N102
    );
  ALU_inst_opcode_1_1341_SW0 : MUXF5
    port map (
      I0 => N103,
      I1 => Instructions_ROM_inst_Mrom_data_out37,
      S => operand_2_2_OBUF_430,
      O => N33
    );
  ALU_inst_opcode_1_1341_SW0_F : LUT4
    generic map(
      INIT => X"0545"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => Rs1_data_out(1),
      I2 => operand_2_0_OBUF_428,
      I3 => operand_2_1_OBUF_429,
      O => N103
    );
  ALU_inst_opcode_1_1341_SW1 : MUXF5
    port map (
      I0 => N105,
      I1 => Instructions_ROM_inst_Mrom_data_out37,
      S => operand_2_2_OBUF_430,
      O => N34
    );
  ALU_inst_opcode_1_1341_SW1_F : LUT4
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => Rs1_data_out(1),
      I2 => operand_2_0_OBUF_428,
      I3 => operand_2_1_OBUF_429,
      O => N105
    );
  ALU_inst_opcode_1_151123 : MUXF5
    port map (
      I0 => N109,
      I1 => N110,
      S => Controller_inst_Mrom_control_reg,
      O => ALU_inst_opcode_1_151123_29
    );
  ALU_inst_opcode_1_151123_F : LUT4
    generic map(
      INIT => X"CDEF"
    )
    port map (
      I0 => Rs2_data_out(1),
      I1 => Rs2_data_out(0),
      I2 => Rs1_data_out(7),
      I3 => Rs1_data_out(5),
      O => N109
    );
  ALU_inst_opcode_1_1217 : MUXF5
    port map (
      I0 => N111,
      I1 => N112,
      S => Controller_inst_Mrom_control_reg,
      O => ALU_inst_opcode_1_1217_24
    );
  ALU_inst_opcode_1_1217_F : LUT4
    generic map(
      INIT => X"CDEF"
    )
    port map (
      I0 => Rs2_data_out(1),
      I1 => Rs2_data_out(0),
      I2 => Rs1_data_out(0),
      I3 => Rs1_data_out(2),
      O => N111
    );
  ALU_inst_opcode_1_1321 : MUXF5
    port map (
      I0 => N113,
      I1 => N114,
      S => Controller_inst_Mrom_control_reg,
      O => ALU_inst_opcode_1_13_bdd0
    );
  ALU_inst_opcode_1_1321_F : LUT4
    generic map(
      INIT => X"AEBF"
    )
    port map (
      I0 => Rs2_data_out(1),
      I1 => Rs2_data_out(0),
      I2 => Rs1_data_out(7),
      I3 => Rs1_data_out(6),
      O => N113
    );
  ALU_inst_opcode_1_1141 : MUXF5
    port map (
      I0 => N115,
      I1 => N116,
      S => Controller_inst_Mrom_control_reg,
      O => ALU_inst_opcode_1_11_bdd1
    );
  ALU_inst_opcode_1_1141_F : LUT4
    generic map(
      INIT => X"AEBF"
    )
    port map (
      I0 => Rs2_data_out(1),
      I1 => Rs2_data_out(0),
      I2 => Rs1_data_out(0),
      I3 => Rs1_data_out(1),
      O => N115
    );
  ALU_inst_opcode_1_5122 : MUXF5
    port map (
      I0 => N117,
      I1 => N118,
      S => Controller_inst_Mrom_control_reg,
      O => ALU_inst_opcode_1_5122_41
    );
  ALU_inst_opcode_1_5122_F : LUT4
    generic map(
      INIT => X"37BF"
    )
    port map (
      I0 => Rs2_data_out(1),
      I1 => Rs2_data_out(0),
      I2 => Rs1_data_out(3),
      I3 => Rs1_data_out(5),
      O => N117
    );
  ALU_inst_opcode_1_5140 : MUXF5
    port map (
      I0 => N119,
      I1 => N120,
      S => Controller_inst_Mrom_control_reg,
      O => ALU_inst_opcode_1_5140_42
    );
  ALU_inst_opcode_1_5140_F : LUT4
    generic map(
      INIT => X"CEDF"
    )
    port map (
      I0 => Rs2_data_out(1),
      I1 => Rs2_data_out(0),
      I2 => Rs1_data_out(4),
      I3 => Rs1_data_out(2),
      O => N119
    );
  ALU_inst_opcode_1_151143 : MUXF5
    port map (
      I0 => N121,
      I1 => N122,
      S => Controller_inst_Mrom_control_reg,
      O => ALU_inst_opcode_1_151143_30
    );
  ALU_inst_opcode_1_151143_F : LUT4
    generic map(
      INIT => X"3B7F"
    )
    port map (
      I0 => Rs2_data_out(1),
      I1 => Rs2_data_out(0),
      I2 => Rs1_data_out(4),
      I3 => Rs1_data_out(6),
      O => N121
    );
  ALU_inst_opcode_1_1237 : MUXF5
    port map (
      I0 => N123,
      I1 => N124,
      S => Controller_inst_Mrom_control_reg,
      O => ALU_inst_opcode_1_1237_25
    );
  ALU_inst_opcode_1_1237_F : LUT4
    generic map(
      INIT => X"37BF"
    )
    port map (
      I0 => Rs2_data_out(1),
      I1 => Rs2_data_out(0),
      I2 => Rs1_data_out(1),
      I3 => Rs1_data_out(3),
      O => N123
    );
  ALU_inst_opcode_1_131163_SW0_SW0_F : LUT4
    generic map(
      INIT => X"082A"
    )
    port map (
      I0 => Rs2_data_out(2),
      I1 => Rs2_data_out(0),
      I2 => Rs1_data_out(1),
      I3 => Rs1_data_out(2),
      O => N125
    );
  ALU_inst_opcode_1_3183_SW0_SW0 : MUXF5
    port map (
      I0 => N127,
      I1 => N128,
      S => Controller_inst_Mrom_control_reg,
      O => N90
    );
  ALU_inst_opcode_1_3183_SW0_SW0_F : LUT4
    generic map(
      INIT => X"082A"
    )
    port map (
      I0 => Rs2_data_out(2),
      I1 => Rs2_data_out(0),
      I2 => Rs1_data_out(6),
      I3 => Rs1_data_out(5),
      O => N127
    );
  ALU_inst_opcode_1_131163_SW0_SW1_F : LUT3
    generic map(
      INIT => X"8A"
    )
    port map (
      I0 => Rs2_data_out(2),
      I1 => Rs2_data_out(0),
      I2 => Rs1_data_out(0),
      O => N129
    );
  ALU_inst_opcode_1_3183_SW0_SW1 : MUXF5
    port map (
      I0 => N131,
      I1 => N132,
      S => Controller_inst_Mrom_control_reg,
      O => N91
    );
  ALU_inst_opcode_1_3183_SW0_SW1_F : LUT3
    generic map(
      INIT => X"8A"
    )
    port map (
      I0 => Rs2_data_out(2),
      I1 => Rs2_data_out(0),
      I2 => Rs1_data_out(7),
      O => N131
    );
  ALU_inst_opcode_1_1275_SW1_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => instruction_in_12_Q,
      I1 => PC_inst_PC_reg(7),
      I2 => Instructions_ROM_inst_Mrom_data_out171_4_76,
      I3 => Instructions_ROM_inst_Mrom_data_out21_3_81,
      O => N101
    );
  Instructions_ROM_inst_Mrom_data_out301 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => PC_inst_PC_reg(2),
      I1 => PC_inst_PC_reg(3),
      I2 => PC_inst_PC_reg(1),
      I3 => PC_inst_PC_reg(0),
      O => Instructions_ROM_inst_Mrom_data_out30
    );
  Instructions_ROM_inst_Mrom_data_out271 : LUT4
    generic map(
      INIT => X"FFEF"
    )
    port map (
      I0 => PC_inst_PC_reg(3),
      I1 => PC_inst_PC_reg(2),
      I2 => PC_inst_PC_reg(0),
      I3 => PC_inst_PC_reg(1),
      O => Instructions_ROM_inst_Mrom_data_out27
    );
  Controller_inst_control_reg_3_1 : LUT4
    generic map(
      INIT => X"1BFF"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => Instructions_ROM_inst_Mrom_data_out171_4_76,
      I2 => Instructions_ROM_inst_Mrom_data_out21_3_81,
      I3 => instruction_in_15_Q,
      O => PC_incr
    );
  ALU_inst_opcode_1_151123_G1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => N132,
      I1 => Rs1_data_out(7),
      O => N110
    );
  ALU_inst_opcode_1_1217_G1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => N132,
      I1 => Rs1_data_out(0),
      O => N112
    );
  ALU_inst_opcode_1_1321_G1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => N132,
      I1 => Rs1_data_out(6),
      O => N114
    );
  ALU_inst_opcode_1_1141_G1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => N132,
      I1 => Rs1_data_out(1),
      O => N116
    );
  ALU_inst_opcode_1_5122_G1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => N132,
      I1 => Rs1_data_out(5),
      O => N118
    );
  ALU_inst_opcode_1_5140_G1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => N132,
      I1 => Rs1_data_out(2),
      O => N120
    );
  ALU_inst_opcode_1_151143_G1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => N132,
      I1 => Rs1_data_out(4),
      O => N122
    );
  ALU_inst_opcode_1_1237_G1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => N132,
      I1 => Rs1_data_out(3),
      O => N124
    );
  ALU_inst_opcode_1_131163_SW0_SW0_G1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => N132,
      I1 => Rs1_data_out(1),
      O => N126
    );
  ALU_inst_opcode_1_3183_SW0_SW0_G1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => N132,
      I1 => Rs1_data_out(6),
      O => N128
    );
  ALU_inst_result_3_inv11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => instruction_in_15_Q,
      I1 => ALU_inst_result_addsub0000(3),
      I2 => N108,
      O => result_3_OBUF_447
    );
  Controller_inst_Mrom_control_reg11_1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => instruction_in_15_Q,
      I1 => instruction_in_12_Q,
      I2 => Instructions_ROM_inst_Mrom_data_out401_2_f51_91,
      O => Controller_inst_Mrom_control_reg11_58
    );
  Instructions_ROM_inst_Mrom_data_out201_2_f51_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => Instructions_ROM_inst_Mrom_data_out141_4_73,
      I2 => Instructions_ROM_inst_Mrom_data_out201_3_80,
      O => Instructions_ROM_inst_Mrom_data_out201_2_f51_79
    );
  Decoder_inst_immediate_out_2_1_1 : LUT4
    generic map(
      INIT => X"20E0"
    )
    port map (
      I0 => instruction_in_12_Q,
      I1 => instruction_in_15_Q,
      I2 => instruction_in_0_Q,
      I3 => Instructions_ROM_inst_Mrom_data_out401_2_f51_91,
      O => Decoder_inst_immediate_out_2_1_65
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_393
    );
  ALU_inst_opcode_1_1521 : MUXF5
    port map (
      I0 => N133,
      I1 => N134,
      S => Controller_inst_Mrom_control_reg,
      O => ALU_inst_opcode_1_15_bdd0
    );
  ALU_inst_opcode_1_1521_F : LUT3
    generic map(
      INIT => X"FB"
    )
    port map (
      I0 => Rs2_data_out(0),
      I1 => Rs1_data_out(7),
      I2 => Rs2_data_out(1),
      O => N133
    );
  ALU_inst_opcode_1_1521_G : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => Rs1_data_out(7),
      I1 => N132,
      O => N134
    );
  Instructions_ROM_inst_Mrom_data_out141_2_f51 : MUXF5
    port map (
      I0 => N135,
      I1 => N136,
      S => PC_inst_PC_reg(5),
      O => instruction_in_4_Q
    );
  Instructions_ROM_inst_Mrom_data_out141_2_f51_F : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => PC_inst_PC_reg(6),
      I2 => PC_inst_PC_reg(4),
      I3 => Instructions_ROM_inst_Mrom_data_out12,
      O => N135
    );
  Instructions_ROM_inst_Mrom_data_out141_2_f51_G : LUT4
    generic map(
      INIT => X"FF7F"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => PC_inst_PC_reg(6),
      I2 => PC_inst_PC_reg(4),
      I3 => Instructions_ROM_inst_Mrom_data_out14,
      O => N136
    );
  Instructions_ROM_inst_Mrom_data_out171_2_f51 : MUXF5
    port map (
      I0 => N137,
      I1 => N138,
      S => PC_inst_PC_reg(5),
      O => instruction_in_5_Q
    );
  Instructions_ROM_inst_Mrom_data_out171_2_f51_F : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => PC_inst_PC_reg(6),
      I2 => PC_inst_PC_reg(4),
      I3 => Instructions_ROM_inst_Mrom_data_out15,
      O => N137
    );
  Instructions_ROM_inst_Mrom_data_out171_2_f51_G : LUT4
    generic map(
      INIT => X"FF7F"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => PC_inst_PC_reg(6),
      I2 => PC_inst_PC_reg(4),
      I3 => Instructions_ROM_inst_Mrom_data_out17,
      O => N138
    );
  ALU_inst_opcode_1_11112 : MUXF5
    port map (
      I0 => N139,
      I1 => N140,
      S => operand_2_0_OBUF_428,
      O => ALU_inst_opcode_1_11112_19
    );
  ALU_inst_opcode_1_11112_F : LUT4
    generic map(
      INIT => X"FF27"
    )
    port map (
      I0 => operand_2_1_OBUF_429,
      I1 => Rs1_data_out(7),
      I2 => Rs1_data_out(5),
      I3 => N10,
      O => N139
    );
  ALU_inst_opcode_1_11112_G : LUT4
    generic map(
      INIT => X"FFEF"
    )
    port map (
      I0 => operand_2_1_OBUF_429,
      I1 => operand_2_2_OBUF_430,
      I2 => Rs1_data_out(6),
      I3 => instruction_in_13_Q,
      O => N140
    );
  ALU_inst_opcode_1_3152 : MUXF5
    port map (
      I0 => N141,
      I1 => N142,
      S => operand_2_0_OBUF_428,
      O => ALU_inst_opcode_1_3152_38
    );
  ALU_inst_opcode_1_3152_F : LUT4
    generic map(
      INIT => X"0207"
    )
    port map (
      I0 => operand_2_1_OBUF_429,
      I1 => Rs1_data_out(3),
      I2 => operand_2_2_OBUF_430,
      I3 => Rs1_data_out(1),
      O => N141
    );
  ALU_inst_opcode_1_3152_G : LUT4
    generic map(
      INIT => X"0207"
    )
    port map (
      I0 => operand_2_1_OBUF_429,
      I1 => Rs1_data_out(4),
      I2 => operand_2_2_OBUF_430,
      I3 => Rs1_data_out(2),
      O => N142
    );
  Instructions_ROM_inst_Mrom_data_out21_2_f51 : MUXF5
    port map (
      I0 => N143,
      I1 => N144,
      S => PC_inst_PC_reg(5),
      O => instruction_in_0_Q
    );
  Instructions_ROM_inst_Mrom_data_out21_2_f51_F : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => PC_inst_PC_reg(6),
      I2 => PC_inst_PC_reg(4),
      I3 => Instructions_ROM_inst_Mrom_data_out,
      O => N143
    );
  Instructions_ROM_inst_Mrom_data_out21_2_f51_G : LUT4
    generic map(
      INIT => X"FF7F"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => PC_inst_PC_reg(4),
      I2 => PC_inst_PC_reg(6),
      I3 => Instructions_ROM_inst_Mrom_data_out2,
      O => N144
    );
  ALU_inst_opcode_1_131142 : MUXF5
    port map (
      I0 => N145,
      I1 => N146,
      S => operand_2_0_OBUF_428,
      O => ALU_inst_opcode_1_131142_26
    );
  ALU_inst_opcode_1_131142_F : LUT4
    generic map(
      INIT => X"0207"
    )
    port map (
      I0 => operand_2_1_OBUF_429,
      I1 => Rs1_data_out(4),
      I2 => operand_2_2_OBUF_430,
      I3 => Rs1_data_out(6),
      O => N145
    );
  ALU_inst_opcode_1_131142_G : LUT4
    generic map(
      INIT => X"0207"
    )
    port map (
      I0 => operand_2_1_OBUF_429,
      I1 => Rs1_data_out(3),
      I2 => operand_2_2_OBUF_430,
      I3 => Rs1_data_out(5),
      O => N146
    );
  ALU_inst_opcode_1_131163_SW0 : MUXF5
    port map (
      I0 => N147,
      I1 => N148,
      S => operand_2_1_OBUF_429,
      O => N44
    );
  ALU_inst_opcode_1_131163_SW0_F : LUT4
    generic map(
      INIT => X"0207"
    )
    port map (
      I0 => Controller_inst_Mrom_control_reg,
      I1 => N126,
      I2 => instruction_in_13_Q,
      I3 => N125,
      O => N147
    );
  ALU_inst_opcode_1_131163_SW0_G : LUT4
    generic map(
      INIT => X"0207"
    )
    port map (
      I0 => Controller_inst_Mrom_control_reg,
      I1 => N132,
      I2 => instruction_in_13_Q,
      I3 => N129,
      O => N148
    );
  ALU_inst_opcode_1_111127 : MUXF5
    port map (
      I0 => N149,
      I1 => N150,
      S => operand_2_0_OBUF_428,
      O => ALU_inst_opcode_1_111127_20
    );
  ALU_inst_opcode_1_111127_F : LUT4
    generic map(
      INIT => X"0207"
    )
    port map (
      I0 => operand_2_1_OBUF_429,
      I1 => Rs1_data_out(3),
      I2 => operand_2_2_OBUF_430,
      I3 => Rs1_data_out(5),
      O => N149
    );
  ALU_inst_opcode_1_111127_G : LUT4
    generic map(
      INIT => X"0207"
    )
    port map (
      I0 => operand_2_1_OBUF_429,
      I1 => Rs1_data_out(2),
      I2 => operand_2_2_OBUF_430,
      I3 => Rs1_data_out(4),
      O => N150
    );
  ALU_inst_opcode_1_9130 : MUXF5
    port map (
      I0 => N151,
      I1 => N152,
      S => operand_2_0_OBUF_428,
      O => ALU_inst_opcode_1_9130_45
    );
  ALU_inst_opcode_1_9130_F : LUT4
    generic map(
      INIT => X"0207"
    )
    port map (
      I0 => operand_2_1_OBUF_429,
      I1 => Rs1_data_out(2),
      I2 => operand_2_2_OBUF_430,
      I3 => Rs1_data_out(4),
      O => N151
    );
  ALU_inst_opcode_1_9130_G : LUT4
    generic map(
      INIT => X"0207"
    )
    port map (
      I0 => operand_2_1_OBUF_429,
      I1 => Rs1_data_out(1),
      I2 => operand_2_2_OBUF_430,
      I3 => Rs1_data_out(3),
      O => N152
    );
  ALU_inst_opcode_1_9158 : MUXF5
    port map (
      I0 => N153,
      I1 => N154,
      S => instruction_in_12_Q,
      O => ALU_inst_Mmux_result_34
    );
  ALU_inst_opcode_1_9158_F : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => operand_2_2_OBUF_430,
      I2 => ALU_inst_opcode_1_1_bdd2,
      I3 => ALU_inst_opcode_1_9130_45,
      O => N153
    );
  ALU_inst_opcode_1_9158_G : LUT4
    generic map(
      INIT => X"FF27"
    )
    port map (
      I0 => operand_2_0_OBUF_428,
      I1 => ALU_inst_opcode_1_1_bdd4,
      I2 => ALU_inst_opcode_1_1_bdd5,
      I3 => N10,
      O => N154
    );
  ALU_inst_opcode_1_1531 : MUXF5
    port map (
      I0 => N155,
      I1 => N156,
      S => operand_2_0_OBUF_428,
      O => ALU_inst_opcode_1_15_bdd1
    );
  ALU_inst_opcode_1_1531_F : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => operand_2_1_OBUF_429,
      I1 => Rs1_data_out(3),
      I2 => Rs1_data_out(1),
      O => N155
    );
  ALU_inst_opcode_1_1531_G : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => operand_2_1_OBUF_429,
      I1 => Rs1_data_out(2),
      I2 => Rs1_data_out(0),
      O => N156
    );
  ALU_inst_opcode_1_1111 : MUXF5
    port map (
      I0 => N157,
      I1 => N158,
      S => operand_2_0_OBUF_428,
      O => ALU_inst_opcode_1_1_bdd0
    );
  ALU_inst_opcode_1_1111_F : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => Controller_inst_operand_2_1_1_60,
      I1 => Rs1_data_out(4),
      I2 => Rs1_data_out(6),
      O => N157
    );
  ALU_inst_opcode_1_1111_G : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => operand_2_1_OBUF_429,
      I1 => Rs1_data_out(5),
      I2 => Rs1_data_out(7),
      O => N158
    );
  Controller_inst_operand_2_4_11 : LUT4
    generic map(
      INIT => X"08FF"
    )
    port map (
      I0 => instruction_in_12_Q,
      I1 => instruction_in_4_Q,
      I2 => instruction_in_15_Q,
      I3 => Controller_inst_Mrom_control_reg,
      O => Controller_inst_operand_2_4_1
    );
  Controller_inst_operand_2_4_12 : LUT4
    generic map(
      INIT => X"2000"
    )
    port map (
      I0 => instruction_in_4_Q,
      I1 => instruction_in_15_Q,
      I2 => instruction_in_12_Q,
      I3 => Controller_inst_Mrom_control_reg,
      O => Controller_inst_operand_2_4_11_64
    );
  Controller_inst_operand_2_4_1_f5 : MUXF5
    port map (
      I0 => Controller_inst_operand_2_4_11_64,
      I1 => Controller_inst_operand_2_4_1,
      S => Rs2_data_out(4),
      O => operand_2_4_OBUF_432
    );
  Controller_inst_operand_2_3_11 : LUT4
    generic map(
      INIT => X"08FF"
    )
    port map (
      I0 => instruction_in_12_Q,
      I1 => instruction_in_3_Q,
      I2 => instruction_in_15_Q,
      I3 => Controller_inst_Mrom_control_reg,
      O => Controller_inst_operand_2_3_1
    );
  Controller_inst_operand_2_3_12 : LUT4
    generic map(
      INIT => X"2000"
    )
    port map (
      I0 => instruction_in_3_Q,
      I1 => instruction_in_15_Q,
      I2 => instruction_in_12_Q,
      I3 => Controller_inst_Mrom_control_reg,
      O => Controller_inst_operand_2_3_11_62
    );
  Controller_inst_operand_2_3_1_f5 : MUXF5
    port map (
      I0 => Controller_inst_operand_2_3_11_62,
      I1 => Controller_inst_operand_2_3_1,
      S => Rs2_data_out(3),
      O => operand_2_3_OBUF_431
    );
  ALU_inst_result_3_inv1_G1 : LUT4
    generic map(
      INIT => X"0207"
    )
    port map (
      I0 => operand_2_2_OBUF_430,
      I1 => ALU_inst_opcode_1_15_bdd0,
      I2 => instruction_in_13_Q,
      I3 => N6,
      O => ALU_inst_result_3_inv1_G
    );
  ALU_inst_result_3_inv1_G2 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => ALU_inst_opcode_1_15_bdd1,
      I1 => N72,
      O => ALU_inst_result_3_inv1_G1_47
    );
  ALU_inst_result_3_inv1_G_f5 : MUXF5
    port map (
      I0 => ALU_inst_result_3_inv1_G1_47,
      I1 => ALU_inst_result_3_inv1_G,
      S => instruction_in_12_Q,
      O => N108
    );
  immediate_5_1 : LUT3_D
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => instruction_in_5_Q,
      I1 => instruction_in_12_Q,
      I2 => instruction_in_15_Q,
      LO => N159,
      O => immediate(5)
    );
  Instructions_ROM_inst_Mrom_data_out261 : LUT4_L
    generic map(
      INIT => X"FF1F"
    )
    port map (
      I0 => PC_inst_PC_reg(0),
      I1 => PC_inst_PC_reg(1),
      I2 => PC_inst_PC_reg(3),
      I3 => PC_inst_PC_reg(2),
      LO => Instructions_ROM_inst_Mrom_data_out26
    );
  Instructions_ROM_inst_Mrom_data_out3711_SW0 : LUT4_L
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => PC_inst_PC_reg(6),
      I1 => PC_inst_PC_reg(4),
      I2 => PC_inst_PC_reg(5),
      I3 => PC_inst_PC_reg(7),
      LO => N4
    );
  Instructions_ROM_inst_Mrom_data_out231 : LUT4_L
    generic map(
      INIT => X"FF1F"
    )
    port map (
      I0 => PC_inst_PC_reg(0),
      I1 => PC_inst_PC_reg(2),
      I2 => PC_inst_PC_reg(3),
      I3 => PC_inst_PC_reg(1),
      LO => Instructions_ROM_inst_Mrom_data_out23
    );
  Instructions_ROM_inst_Mrom_data_out201 : LUT4_L
    generic map(
      INIT => X"FF1F"
    )
    port map (
      I0 => PC_inst_PC_reg(1),
      I1 => PC_inst_PC_reg(2),
      I2 => PC_inst_PC_reg(3),
      I3 => PC_inst_PC_reg(0),
      LO => Instructions_ROM_inst_Mrom_data_out20
    );
  Instructions_ROM_inst_Mrom_data_out121 : LUT3_D
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => PC_inst_PC_reg(2),
      I1 => PC_inst_PC_reg(3),
      I2 => PC_inst_PC_reg(1),
      LO => N160,
      O => Instructions_ROM_inst_Mrom_data_out12
    );
  ALU_inst_opcode_1_111155 : LUT4_L
    generic map(
      INIT => X"DDD8"
    )
    port map (
      I0 => instruction_in_12_Q,
      I1 => ALU_inst_opcode_1_11112_19,
      I2 => ALU_inst_opcode_1_111127_20,
      I3 => ALU_inst_opcode_1_11118_21,
      LO => ALU_inst_Mmux_result_35
    );
  ALU_inst_opcode_1_1351 : LUT3_L
    generic map(
      INIT => X"53"
    )
    port map (
      I0 => Rs1_data_out(0),
      I1 => Rs1_data_out(2),
      I2 => operand_2_1_OBUF_429,
      LO => ALU_inst_opcode_1_13_bdd7
    );
  Instructions_ROM_inst_Mrom_data_out21 : LUT4_D
    generic map(
      INIT => X"01FF"
    )
    port map (
      I0 => PC_inst_PC_reg(2),
      I1 => PC_inst_PC_reg(1),
      I2 => PC_inst_PC_reg(0),
      I3 => PC_inst_PC_reg(3),
      LO => N161,
      O => Instructions_ROM_inst_Mrom_data_out2
    );
  ALU_inst_opcode_1_914_SW0 : LUT4_D
    generic map(
      INIT => X"FAEE"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => Rs2_data_out(2),
      I2 => N132,
      I3 => Controller_inst_Mrom_control_reg,
      LO => N162,
      O => N10
    );
  ALU_inst_opcode_1_719_SW0 : LUT3_D
    generic map(
      INIT => X"B1"
    )
    port map (
      I0 => instruction_in_15_Q,
      I1 => instruction_in_12_Q,
      I2 => instruction_in_13_Q,
      LO => N163,
      O => N76
    );
  ALU_inst_opcode_1_7113 : LUT4_L
    generic map(
      INIT => X"1BFF"
    )
    port map (
      I0 => N76,
      I1 => instruction_in_0_Q,
      I2 => Rs2_data_out(1),
      I3 => Rs1_data_out(5),
      LO => ALU_inst_opcode_1_7113_43
    );
  ALU_inst_result_7_inv1_SW0 : LUT4_L
    generic map(
      INIT => X"0415"
    )
    port map (
      I0 => instruction_in_12_Q,
      I1 => ALU_inst_opcode_1_15_bdd1,
      I2 => N81,
      I3 => N80,
      LO => N53
    );
  ALU_inst_opcode_1_151181_SW0_SW0 : LUT4_D
    generic map(
      INIT => X"0511"
    )
    port map (
      I0 => instruction_in_13_Q,
      I1 => Rs2_data_out(2),
      I2 => N132,
      I3 => Controller_inst_Mrom_control_reg,
      LO => N164,
      O => N72
    );
  ALU_inst_result_2_inv1_SW0 : LUT4_L
    generic map(
      INIT => X"AA08"
    )
    port map (
      I0 => instruction_in_12_Q,
      I1 => ALU_inst_opcode_1_5140_42,
      I2 => N93,
      I3 => ALU_inst_opcode_1_512_40,
      LO => N55
    );
  ALU_inst_opcode_1_131194 : LUT4_L
    generic map(
      INIT => X"EF45"
    )
    port map (
      I0 => instruction_in_12_Q,
      I1 => ALU_inst_opcode_1_131142_26,
      I2 => N44,
      I3 => N95,
      LO => ALU_inst_Mmux_result_36
    );
  ALU_inst_opcode_1_31119 : LUT4_L
    generic map(
      INIT => X"AF8D"
    )
    port map (
      I0 => instruction_in_12_Q,
      I1 => ALU_inst_opcode_1_3152_38,
      I2 => N97,
      I3 => N46,
      LO => ALU_inst_Mmux_result_31
    );
  ALU_inst_opcode_1_12126_SW0 : LUT3_L
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => N30,
      I1 => N31,
      I2 => ALU_inst_opcode_1_1_bdd0,
      LO => N99
    );
  Instructions_ROM_inst_Mrom_data_out401_2_f51_1 : LUT3_D
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => PC_inst_PC_reg(7),
      I1 => Instructions_ROM_inst_Mrom_data_out21_3_81,
      I2 => Instructions_ROM_inst_Mrom_data_out171_4_76,
      LO => N165,
      O => Instructions_ROM_inst_Mrom_data_out401_2_f51_91
    );
  Controller_inst_Mrom_control_reg11_2 : LUT3_D
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => instruction_in_15_Q,
      I1 => instruction_in_12_Q,
      I2 => instruction_in_13_Q,
      LO => N166,
      O => Controller_inst_Mrom_control_reg111
    );
  Controller_inst_operand_2_1_1_1 : LUT3_D
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => Controller_inst_Mrom_control_reg11_58,
      I1 => Decoder_inst_immediate_out_2_1_65,
      I2 => Rs2_data_out(1),
      LO => N167,
      O => Controller_inst_operand_2_1_1_60
    );

end Structure;

