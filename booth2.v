//File Name     : booth2.v
//
//Purpose       : booth2 encoder
//
//Author        : Zeyuan Zou
//
//Simulator     : NC-Verilog
//---------------------------------------------------------------------
module booth2(x2 , x1 , x0 , y , y_pro , s, e);
//-----------------------input-----------------------------------------
input x2 , x1 , x0;
input [15:0] y;
//-----------------------output----------------------------------------
output [16:0] y_pro;
output s, e;
//-----------------------interior connection---------------------------
wire  m1 , m2;
reg e;
always @(*)
begin
	if((y_pro == 0)&(s == 0))
   begin
      e = 1'b1;
   end
   else if ((y_pro == 17'h1ffff)&(s == 1))
   begin
      e = 1'b0;
   end
   else if(y[15]^s)
   begin
      e = 1'b0;
   end
   else 
   begin
      e = 1'b1;
   end 
end
//-----------------------booth2 encoder--------------------------------
assign m1 = x0 ^ x1;
assign m2 = (~(x0 ^ x1)) &(x1 ^ x2);
//-----------------------booth2 selector-------------------------------
assign s = x2;
assign y_pro[0] = ~((~(y[0] & m1))^s);
assign y_pro[1] = ~((~((y[1] & m1)|(y[0] & m2)))^s);
assign y_pro[2] = ~((~((y[2] & m1)|(y[1] & m2)))^s);
assign y_pro[3] = ~((~((y[3] & m1)|(y[2] & m2)))^s);
assign y_pro[4] = ~((~((y[4] & m1)|(y[3] & m2)))^s);
assign y_pro[5] = ~((~((y[5] & m1)|(y[4] & m2)))^s);
assign y_pro[6] = ~((~((y[6] & m1)|(y[5] & m2)))^s);
assign y_pro[7] = ~((~((y[7] & m1)|(y[6] & m2)))^s);
assign y_pro[8] = ~((~((y[8] & m1)|(y[7] & m2)))^s);
assign y_pro[9] = ~((~((y[9] & m1)|(y[8] & m2)))^s);
assign y_pro[10] = ~((~((y[10] & m1)|(y[9] & m2)))^s);
assign y_pro[11] = ~((~((y[11] & m1)|(y[10] & m2)))^s);
assign y_pro[12] = ~((~((y[12] & m1)|(y[11] & m2)))^s);
assign y_pro[13] = ~((~((y[13] & m1)|(y[12] & m2)))^s);
assign y_pro[14] = ~((~((y[14] & m1)|(y[13] & m2)))^s);
assign y_pro[15] = ~((~((y[15] & m1)|(y[14] & m2)))^s);
assign y_pro[16] = ~((~((y[15] & m1)|(y[15] & m2)))^s);

endmodule
