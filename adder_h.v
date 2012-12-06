//File Name     : adder_h.v
//
//Purpose       : half adder
//
//Author        : Zeyuan Zou
//
//Simulator     : NC-Verilog
//----------------------------------------------------------------------
module adder_h(sum, cout, a, b);
input a, b;
output sum, cout;

assign sum = a ^ b;
assign cout = a & b;

endmodule

