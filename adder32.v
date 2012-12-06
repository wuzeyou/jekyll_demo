//File Name     : adder32.v
//
//Purpose       : 32-bit square root carry select adder
//
//Author        : Zeyuan Zou
//
//Simulator     : NC-Verilog
//----------------------------------------------------------------------
module adder32(opa, opb, ci, sum, co);
//--------------------input---------------------------------------------
input[31:0] opa;
input[31:0] opb;
input ci;
//--------------------output--------------------------------------------
output[31:0] sum;
output co;
//--------------------connection----------------------------------------
wire[2:0] p1, g1, c_s1_0, c_s1_1, c1_fact;
wire[3:0] p2, g2, c_s2_0, c_s2_1, c2_fact;
wire[4:0] p3, g3, c_s3_0, c_s3_1, c3_fact;
wire[5:0] p4, g4, c_s4_0, c_s4_1, c4_fact;
wire[6:0] p5, g5, c_s5_0, c_s5_1, c5_fact;
wire[6:0] p6, g6, c_s6_0, c_s6_1, c6_fact;
//--------------------stage 1    3-------------------------------------------
assign g1 = opa[2:0] & opb[2:0];
assign p1 = opa[2:0] | opb[2:0];
assign c_s1_0[0] = g1[0];
assign c_s1_0[1] = g1[1] | (p1[1]&c_s1_0[0]);
assign c_s1_0[2] = g1[2] | (p1[2]&c_s1_0[1]);
assign c_s1_1[0] = g1[0] | p1[0];
assign c_s1_1[1] = g1[1] | (p1[1]&c_s1_1[0]);
assign c_s1_1[2] = g1[2] | (p1[2]&c_s1_1[1]);
assign c1_fact = ci ? c_s1_1 : c_s1_0;
assign sum[2:0] = opa[2:0] ^ opb[2:0] ^ {c1_fact[1:0], ci};
//--------------------stage 2     4-------------------------------------------
assign g2 = opa[6:3] & opb[6:3];
assign p2 = opa[6:3] | opb[6:3];
assign c_s2_0[0] = g2[0];
assign c_s2_0[1] = g2[1] | (p2[1]&c_s2_0[0]);
assign c_s2_0[2] = g2[2] | (p2[2]&c_s2_0[1]);
assign c_s2_0[3] = g2[3] | (p2[3]&c_s2_0[2]);
assign c_s2_1[0] = g2[0] | p2[0];
assign c_s2_1[1] = g2[1] | (p2[1]&c_s2_1[0]);
assign c_s2_1[2] = g2[2] | (p2[2]&c_s2_1[1]);
assign c_s2_1[3] = g2[3] | (p2[3]&c_s2_1[2]);
assign c2_fact = c1_fact[2] ? c_s2_1 : c_s2_0;
assign sum[6:3] = opa[6:3] ^ opb[6:3] ^ {c2_fact[2:0], c1_fact[2]};
//--------------------stage 3       5-------------------------------------------
assign g3 = opa[11:7] & opb[11:7];
assign p3 = opa[11:7] | opb[11:7];
assign c_s3_0[0] = g3[0];
assign c_s3_0[1] = g3[1] | (p3[1]&c_s3_0[0]);
assign c_s3_0[2] = g3[2] | (p3[2]&c_s3_0[1]);
assign c_s3_0[3] = g3[3] | (p3[3]&c_s3_0[2]);
assign c_s3_0[4] = g3[4] | (p3[4]&c_s3_0[3]);
assign c_s3_1[0] = g3[0] | p3[0];
assign c_s3_1[1] = g3[1] | (p3[1]&c_s3_1[0]);
assign c_s3_1[2] = g3[2] | (p3[2]&c_s3_1[1]);
assign c_s3_1[3] = g3[3] | (p3[3]&c_s3_1[2]);
assign c_s3_1[4] = g3[4] | (p3[4]&c_s3_1[3]);
assign c3_fact = c2_fact[3] ? c_s3_1 : c_s3_0;
assign sum[11:7] = opa[11:7] ^ opb[11:7] ^ {c3_fact[3:0], c2_fact[3]};
//--------------------stage 4     6-------------------------------------------
assign g4 = opa[17:12] & opb[17:12];
assign p4 = opa[17:12] | opb[17:12];
assign c_s4_0[0] = g4[0];
assign c_s4_0[1] = g4[1] | (p4[1]&c_s4_0[0]);
assign c_s4_0[2] = g4[2] | (p4[2]&c_s4_0[1]);
assign c_s4_0[3] = g4[3] | (p4[3]&c_s4_0[2]);
assign c_s4_0[4] = g4[4] | (p4[4]&c_s4_0[3]);
assign c_s4_0[5] = g4[5] | (p4[5]&c_s4_0[4]);
assign c_s4_1[0] = g4[0] | p4[0];
assign c_s4_1[1] = g4[1] | (p4[1]&c_s4_1[0]);
assign c_s4_1[2] = g4[2] | (p4[2]&c_s4_1[1]);
assign c_s4_1[3] = g4[3] | (p4[3]&c_s4_1[2]);
assign c_s4_1[4] = g4[4] | (p4[4]&c_s4_1[3]);
assign c_s4_1[5] = g4[5] | (p4[5]&c_s4_1[4]);
assign c4_fact = c3_fact[4] ? c_s4_1 : c_s4_0;
assign sum[17:12] = opa[17:12] ^ opb[17:12] ^ {c4_fact[4:0], c3_fact[4]};
//--------------------stage 5       7-------------------------------------------
assign g5 = opa[24:18] & opb[24:18];
assign p5 = opa[24:18] | opb[24:18];
assign c_s5_0[0] = g5[0];
assign c_s5_0[1] = g5[1] | (p5[1]&c_s5_0[0]);
assign c_s5_0[2] = g5[2] | (p5[2]&c_s5_0[1]);
assign c_s5_0[3] = g5[3] | (p5[3]&c_s5_0[2]);
assign c_s5_0[4] = g5[4] | (p5[4]&c_s5_0[3]);
assign c_s5_0[5] = g5[5] | (p5[5]&c_s5_0[4]);
assign c_s5_0[6] = g5[6] | (p5[6]&c_s5_0[5]);
assign c_s5_1[0] = g5[0] | p5[0];
assign c_s5_1[1] = g5[1] | (p5[1]&c_s5_1[0]);
assign c_s5_1[2] = g5[2] | (p5[2]&c_s5_1[1]);
assign c_s5_1[3] = g5[3] | (p5[3]&c_s5_1[2]);
assign c_s5_1[4] = g5[4] | (p5[4]&c_s5_1[3]);
assign c_s5_1[5] = g5[5] | (p5[5]&c_s5_1[4]);
assign c_s5_1[6] = g5[6] | (p5[6]&c_s5_1[5]);
assign c5_fact = c4_fact[5] ? c_s5_1 : c_s5_0;
assign sum[24:18] = opa[24:18] ^ opb[24:18] ^ {c5_fact[5:0], c4_fact[5]};
//--------------------stage 6       7-------------------------------------------
assign g6 = opa[31:25] & opb[31:25];
assign p6 = opa[31:25] | opb[31:25];
assign c_s6_0[0] = g6[0];
assign c_s6_0[1] = g6[1] | (p6[1]&c_s6_0[0]);
assign c_s6_0[2] = g6[2] | (p6[2]&c_s6_0[1]);
assign c_s6_0[3] = g6[3] | (p6[3]&c_s6_0[2]);
assign c_s6_0[4] = g6[4] | (p6[4]&c_s6_0[3]);
assign c_s6_0[5] = g6[5] | (p6[5]&c_s6_0[4]);
assign c_s6_0[6] = g6[6] | (p6[6]&c_s6_0[5]);
assign c_s6_1[0] = g6[0] | p6[0];
assign c_s6_1[1] = g6[1] | (p6[1]&c_s6_1[0]);
assign c_s6_1[2] = g6[2] | (p6[2]&c_s6_1[1]);
assign c_s6_1[3] = g6[3] | (p6[3]&c_s6_1[2]);
assign c_s6_1[4] = g6[4] | (p6[4]&c_s6_1[3]);
assign c_s6_1[5] = g6[5] | (p6[5]&c_s6_1[4]);
assign c_s6_1[6] = g6[6] | (p6[6]&c_s6_1[5]);
assign c6_fact = c5_fact[6] ? c_s6_1 : c_s6_0;
assign sum[31:25] = opa[31:25] ^ opb[31:25] ^ {c6_fact[5:0], c5_fact[6]};

assign co = c6_fact[6];

endmodule