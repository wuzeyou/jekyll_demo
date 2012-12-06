//File Name     : compressor4_2.v
//
//Purpose       : compress 4 bits to 2 bits
//
//Author        : Zeyuan Zou
//
//Simulator     : NC-Verilog

module compressor4_2(sum, c1, c2, a, b, c, d, cin);
input a,b,c,d,cin;
output sum,c1,c2;
   
wire tmp;

assign tmp = b^c^d;
assign c1 = (b&c)|(c&d)|(b&d);
assign c2 = (a&tmp)|(tmp&cin)|(a&cin);
assign sum = a^tmp^cin;
endmodule
