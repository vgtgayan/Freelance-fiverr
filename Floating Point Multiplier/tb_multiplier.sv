module tb_multiplier ();

logic [31:0] a, b;
wire  [31:0] z;

fmul uut (a,b,z);


initial begin

a =32'b00000000000000000000000000000000; // 0
b =32'b00000000000000000000000000000000; // 0
#5;
a = 32'b01000000000000000000000000000000; // 2
b = 32'b01000000100000000000000000000000; // 4
#5;
a = 32'b01000000100000000000000000000000; // 4
b = 32'b01000000010000000000000000000000; // 3


#100;
$finish;

end


endmodule