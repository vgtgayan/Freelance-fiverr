module fmul
(
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] z
);
// Internal variables
//logic       [31:0] a, b, z;
logic       [23:0] a_m, b_m, z_m;
logic       [9:0] a_e, b_e, z_e;
logic       a_s, b_s, z_s;
logic       [49:0] product;

//Unpack input values
assign a_m = a[22 : 0];
assign b_m = b[22 : 0];
assign a_e = a[30 : 23] - 127;
assign b_e = b[30 : 23] - 127;
assign a_s = a[31];
assign b_s = b[31];


always_comb begin

        //if a is zero return zero
        if (($signed(a_e) == -127) && (a_m == 0)) begin
          z_s <= a_s ^ b_s;
          z_e <= -127;
          z_m <= 0;
          product <= 0;
          
        //if b is zero return zero
        end else if (($signed(b_e) == -127) && (b_m == 0)) begin
          z_s <= a_s ^ b_s;
          z_e <= -127;
          z_m <= 0;
          product <= 0;
         
        end else begin

          z_s <= a_s ^ b_s;
          //z_e <= a_e + b_e + 1;
          z_e <= a_e + b_e;
          product <= a_m * b_m * 4;
          z_m <= product[49:26];
        end
end

//Pack output value
assign z[22 : 0]  = z_m[22:0];
assign z[30 : 23] = z_e[7:0] + 127;
assign z[31]      = z_s;


endmodule
