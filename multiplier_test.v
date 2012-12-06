module multiplier_test(a, b, p);

input signed[15:0] a, b;
output signed[31:0] p;
assign p = a*b;

endmodule