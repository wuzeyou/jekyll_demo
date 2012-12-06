//File Name     : multiplier.v
//
//Purpose       : 16 bits signed multiplier
//
//Author        : Zeyuan Zou
//
//Simulator     : NC-Verilog
//----------------------------------------------------------------------
module multiplier(opx, opy, res);
//----------------input-------------------------------------------------
input[15:0] opx, opy;
//----------------output------------------------------------------------
output[31:0] res;
//---------------------interior connnection-----------------------------
wire[19:0] pp0;
wire[18:0] pp1, pp2, pp3, pp4, pp5, pp6;
wire[17:0] pp7;
wire s0, s1, s2, s3, s4, s5, s6, s7;
wire[31:0] opa, opb;
//----------------partial product generation----------------------------
pp_generate pp_generate_0(
							.x(opx), 
							.y(opy), 
							.pp0(pp0), 
							.pp1(pp1),
							.pp2(pp2), 
							.pp3(pp3), 
							.pp4(pp4), 
							.pp5(pp5),
							.pp6(pp6), 
							.pp7(pp7), 
							.s0(s0), 
							.s1(s1), 
							.s2(s2), 
							.s3(s3), 
							.s4(s4), 
							.s5(s5), 
							.s6(s6), 
							.s7(s7)
						);
//--------------------wallace tree--------------------------------------
wallace_tree wallace_tree_0(
							.pp0(pp0), 
							.pp1(pp1),
							.pp2(pp2), 
							.pp3(pp3), 
							.pp4(pp4), 
							.pp5(pp5),
							.pp6(pp6), 
							.pp7(pp7), 
							.s0(s0), 
							.s1(s1), 
							.s2(s2), 
							.s3(s3), 
							.s4(s4), 
							.s5(s5), 
							.s6(s6), 
							.s7(s7), 
							.opa(opa), 
							.opb(opb)
						);
//----------------------add sum and carry-------------------------------
adder32 adder32_0(
					.opa(opa), 
					.opb(opb), 
					.ci(1'b0), 
					.sum(res), 
					.co()
				);

//assign res = opa + opb;
endmodule