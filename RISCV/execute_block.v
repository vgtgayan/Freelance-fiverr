
// lab3 execute stage for a RISCV CPU.
// It must work for a RV64I CPU (this includes 32 and 64 bit instructions)

`include "rv64.vh"

module execute_block
(input clk,
 input reset,

 input  [64-1:0] pc_i,
 input           pc_i_valid,

 input  [64-1:0] in1_i,
 input           in1_i_valid,

 input  [64-1:0] in2_i,
 input           in2_i_valid,

 input  [32-1:0] inst_i,
 input           inst_i_valid,

 output [64-1:0] pc_o,
 output          pc_o_valid,

 output [32-1:0] inst_o,
 output          inst_o_valid,

 output [64-1:0] rdata_o,
 output          rdata_o_valid, //replace with inst_o

 output [64-1:0] raddr_o,
 output          raddr_o_valid,

 output [64-1:0] branch_pc_o,
 output          branch_pc_o_valid
 );

 reg [64-1:0] branch_pc_o_next;
 reg          branch_pc_o_valid_next;

 reg [64-1:0] pc_o;
 reg          pc_o_valid;

 reg [32-1:0] inst_o;
 reg          inst_o_valid;

 reg [64-1:0] rdata_o;
 reg          rdata_o_valid;

 reg [64-1:0] raddr_o;
 reg          raddr_o_valid;

 reg [64-1:0] branch_pc_o;
 reg          branch_pc_o_valid;

 reg	    [64-1:0]pc_o_next;
 reg		  [64-1:0]inst_o_next;
 reg 		  [64-1:0]rdata_o_next;
 reg		  [64-1:0]raddr_o_next;
 reg		  pc_o_valid_next;
 reg		  inst_o_valid_next;
 reg 		  rdata_o_valid_next;
 reg		  raddr_o_valid_next;

 wire all_valid;

 assign all_valid = in1_i_valid & in2_i_valid & pc_i_valid & inst_i_valid;

 wire [7-1:0] op;
 wire temp;
 wire [7-1:0] funct7;
 wire [7-1:0] funct3;

 assign funct7 = inst_i[31:25];

 always @(*) begin
   if (op == `OP_ARITH && funct3 == `FUNCT3_ARTIH_ADD && funct7 == `FUNCT7_ARTIH_ADD) begin
	 //ADD
     rdata_o_next = $signed(in1_i) + $signed(in2_i);
     rdata_o_valid_next = all_valid;
	 //rdata_o_valid = 1'd1;
	   pc_o_next = pc_i + 4;
     pc_o_valid_next = 1'd1;

   end else if (op == `OP_ARITH && funct3 == `FUNCT3_ARTIH_SUB && funct7 == `FUNCT7_ARTIH_SUB) begin
	 //SUB
	 rdata_o_next = $signed(in1_i) - $signed(in2_i);
     rdata_o_valid_next = all_valid;
	 //rdata_o_valid = 1'd1;
	 pc_o_next = pc_i + 4;
     pc_o_valid_next = 1'd1;
   end else if (op == `OP_ARITH && funct3 == `FUNCT3_ARTIH_SLL && funct7 == `FUNCT7_ARTIH_ADD) begin
	 //SLL
	 rdata_o_next = $signed(in1_i) < $signed(in2_i);
     rdata_o_valid_next = all_valid;
	 //rdata_o_valid = 1'd1;
	 pc_o_next = pc_i + 4;
     pc_o_valid_next = 1'd1;
   end else if (op == `OP_ARITH && funct3 == `FUNCT3_ARTIH_SLT && funct7 == `FUNCT7_ARTIH_ADD) begin
	 //SLT
	 
     if ($signed(in1_i) < $signed(in2_i)) begin
		rdata_o_next = 32'd1;
	 end else begin
		rdata_o_next = 32'd0;
	 end
     rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i + 4;
     pc_o_valid_next = 1'd1;

   end else if (op == `OP_ARITH && funct3 == `FUNCT3_ARTIH_SLT && funct7 == `FUNCT7_ARTIH_ADD) begin
	 //SLTU
	 
     if ($unsigned(in1_i) < (in2_i)) begin
		rdata_o_next = 32'd1;
	 end else begin
		rdata_o_next = 32'd0;
	 end
     rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i + 4;
     pc_o_valid_next = 1'd1;

   end else if (op == `OP_ARITH && funct3 == `FUNCT3_ARTIH_XOR && funct7 == `FUNCT7_ARTIH_ADD) begin
	 //XOR
	 rdata_o_next = $signed(in1_i) ^ $signed(in2_i);
     rdata_o_valid_next = all_valid;
	 //rdata_o_valid = 1'd1;
	 pc_o_next = pc_i + 4;
     pc_o_valid_next = 1'd1;

   end else if (op == `OP_ARITH && funct3 == `FUNCT3_ARTIH_SLL && funct7 == `FUNCT7_ARTIH_ADD) begin
	 //SRL
	 rdata_o_next = $signed(in1_i) >> $signed(in2_i);
     rdata_o_valid_next = all_valid;

	 pc_o_next = pc_i + 4;
     pc_o_valid_next = 1'd1;

   end else if (op == `OP_ARITH && funct3 == `FUNCT3_ARTIH_SRA && funct7 == `FUNCT7_ARTIH_SUB) begin
	 //SRA
	 rdata_o_next = $signed(in1_i) >>> $signed(in2_i);
     rdata_o_valid_next = all_valid;

	 pc_o_next = pc_i + 4;
     pc_o_valid_next = 1'd1;

   end else if (op == `OP_ARITH && funct3 == `FUNCT3_ARTIH_OR && funct7 == `FUNCT7_ARTIH_ADD) begin
	 //OR
	 rdata_o_next = $signed(in1_i) | $signed(in2_i);
     rdata_o_valid_next = all_valid;

	 pc_o_next = pc_i + 4;
     pc_o_valid_next = 1'd1;

   end else if (op == `OP_ARITH && funct3 == `FUNCT3_ARTIH_AND && funct7 == `FUNCT7_ARTIH_ADD) begin
	 //AND
	 rdata_o_next = $signed(in1_i) & $signed(in2_i);
     rdata_o_valid_next = all_valid;

	 pc_o_next = pc_i + 4;
     pc_o_valid_next = 1'd1;

   end else if (op == `OP_THEI && funct3 == `FUNCT3_ARIIH_SLLI && funct7 == `FUNCT7_ARTIH_ADD) begin
	 //SLLI
	 rdata_o_next = $signed(in1_i) << $signed(in2_i);
     rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i + 4;
     pc_o_valid_next = 1'd1;
   end else if (op == `OP_THEI && funct3 == `FUNCT3_ARIIH_SRLI && funct7 == `FUNCT7_ARTIH_ADD) begin
	 //SRLI
	 rdata_o_next = $signed(in1_i) >> $signed(inst_i[31:20]);
     rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i + 4;
     pc_o_valid_next = 1'd1;
   end else if (op == `OP_THEI && funct3 == `FUNCT3_ARITH_SRAI && funct7 == `FUNCT7_ARTIH_SUB) begin
	 //SRAI
	 rdata_o_next = $signed(in1_i) >>> $signed(inst_i[31:20]);
     rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i + 4;
     pc_o_valid_next = 1'd1;

   end else if (op == `OP_THEI && funct3 == `FUNCT3_ARTIH_ADDI) begin
	 //ADDI
	 rdata_o_next = $signed(in1_i) + $signed(inst_i[31:20]);
	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i + 4;
	 pc_o_valid_next = 1'd1;
   end else if (op == `OP_THEI && funct3 == `FUNCT3_ARTIH_SLTI) begin
	 //SLTI
	 
     if ($signed(in1_i) < $signed(inst_i[31:20])) begin
		rdata_o_next = 32'd1;
	 end else begin
		rdata_o_next = 32'd0;
	 end
	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i +4;
	 pc_o_valid_next = 1'd1;
   end else if (op == `OP_THEI && funct3 == `FUNCT3_ARTIH_SLTIU) begin
	 //SLTIU
	 //rdata_o_next = $unsigned(in1_i) < (inst_i[31:20]);
     if ($unsigned(in1_i) < (inst_i[31:20])) begin
		rdata_o_next = 32'd1;
	 end else begin
		rdata_o_next = 32'd0;
	 end
	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i +4;
	 pc_o_valid_next = 1'd1;
   end else if (op == `OP_THEI && funct3 == `FUNCT3_ARTIH_XORI) begin
	 //XORI
	 rdata_o_next = $signed(in1_i) ^ $signed(inst_i[31:20]);
	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i +4;
	 pc_o_valid_next = 1'd1;
   end else if (op == `OP_THEI && funct3 == `FUNCT3_ARTIH_ORI) begin
	 //ORI
	 rdata_o_next = $signed(in1_i) | $signed(inst_i[31:20]);
	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i +4;
	 pc_o_valid_next = 1'd1;
   end else if (op == `OP_THEI && funct3 == `FUNCT3_ARTIH_ANDI) begin
	 //ANDI
	 rdata_o_next = $signed(in1_i) & $signed(inst_i[31:20]);
	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i +4;
	 pc_o_valid_next = 1'd1;
   end else if (op == `OP_ADDIW && funct3 == `FUNCT3_ARTIH_ADDIW) begin 
	 //ADDIW
	 temp = $signed(in1_i) + $signed(inst_i[31:20]);
	 rdata_o_next = { {32{temp[31]} },temp};	//sign extention.

	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i +4;
	 pc_o_valid_next = 1'd1;
   end else if (op == `OP_ADDIW && funct3 == `FUNCT3_ARTIH_SLLIW && `FUNCT7_ARTIH_ADD) begin 
	 //SLLIW
	 temp = $signed(in1_i) << $signed(inst_i[31:20]);
	 rdata_o_next = { {32{temp[31]} },temp};	//sign extention.

	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i +4;
	 pc_o_valid_next = 1'd1;
   end else if (op == `OP_ADDIW && funct3 == `FUNCT3_ARTIH_SRLIW && `FUNCT7_ARTIH_ADD) begin 
	 //SRLIW
	 temp = $signed(in1_i) >> $signed(inst_i[31:20]);
	 rdata_o_next = { {32{temp[31]} },temp};	//sign extention.

	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i +4;
	 pc_o_valid_next = 1'd1;
   end else if (op == `OP_ADDIW && funct3 == `FUNCT3_ARTIH_SRAIW && `FUNCT7_ARTIH_SUB) begin 
	 //SRAIW
	 temp = $signed(in1_i) >>> $signed(inst_i[31:20]);
	 rdata_o_next = { {32{temp[31]} },temp};	//sign extention.

	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i +4;
	 pc_o_valid_next = 1'd1;
   end else if (op == `OP_ADDW && funct3 == `FUNCT3_ARTIH_ADDW && `FUNCT7_ARTIH_ADD) begin 
	 //ADDW
	 temp = $signed(in1_i) + $signed(inst_i[31:20]);
	 rdata_o_next = { {32{temp[31]} },temp};	//sign extention.

	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i +4;
	 pc_o_valid_next = 1'd1;
   end else if (op == `OP_ADDW && funct3 == `FUNCT3_ARTIH_SUBW && `FUNCT7_ARTIH_SUB) begin 
	 //SUBW
	 temp = $signed(in1_i) + $signed(inst_i[31:20]);
	 rdata_o_next = { {32{temp[31]} },temp};	//sign extention.

	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i +4;
	 pc_o_valid_next = 1'd1;
   end else if (op == `OP_ADDW && funct3 == `FUNCT3_ARTIH_SLLW && `FUNCT7_ARTIH_ADD) begin 
	 //SLLW
	 temp = $signed(in1_i) << $signed(inst_i[31:20]);
	 rdata_o_next = { {32{temp[31]} },temp};	//sign extention.

	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i +4;
	 pc_o_valid_next = 1'd1;
   end else if (op == `OP_ADDW && funct3 == `FUNCT3_ARTIH_SRLW && `FUNCT7_ARTIH_ADD) begin 
	 //SRLW
	 temp = $signed(in1_i) <<< $signed(inst_i[31:20]);
	 rdata_o_next = { {32{temp[31]} },temp};	//sign extention.

	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i +4;
	 pc_o_valid_next = 1'd1;
   end else if (op == `OP_ADDW && funct3 == `FUNCT3_ARTIH_SRAIW && `FUNCT7_ARTIH_SUB) begin 
	 //SRLW
	 temp = $signed(in1_i) <<< $signed(inst_i[31:20]);
	 rdata_o_next = { {32{temp[31]} },temp};	//sign extention.

	 rdata_o_valid_next = all_valid;
	 pc_o_next = pc_i +4;
	 pc_o_valid_next = 1'd1;
   end
 end


 flop
 #(.Bits(64+1)) f_br
 (.clk     (clk),
   .reset  (reset),
   .d      ({branch_pc_o_next,branch_pc_o_valid_next}),
   .q      ({branch_pc_o     ,branch_pc_o_valid     })
 );

endmodule

