//File Name     : adder_f.v
//
//Purpose       : full adder
//
//Author        : Zeyuan Zou
//
//Simulator     : NC-Verilog
//----------------------------------------------------------------------
module adder_f(sum, cout, a, b, cin);
input a, b, cin;
output sum, cout;

assign sum = a ^ b ^ cin;
assign cout = (a&b) | (a&cin) | (b&cin);

endmodule

