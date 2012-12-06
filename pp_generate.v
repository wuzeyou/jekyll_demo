//File Name     : pp_generate.v
//
//Purpose       : generate partial product
//
//Author        : Zeyuan Zou
//
//Simulator     : NC-Verilog
//------------------------------------------------------------------------------
module pp_generate(x, y, pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7, s0, s1, s2, s3, s4, s5, s6, s7);
//---------------------------------input----------------------------------------
input[15:0] x, y;
//---------------------------------output---------------------------------------
output[19:0] pp0;
output[18:0] pp1, pp2, pp3, pp4, pp5, pp6;
output[17:0] pp7;
output s0, s1, s2, s3, s4, s5, s6, s7;
//---------------------------------interior connection--------------------------
wire [16:0] y_pro0, y_pro1, y_pro2, y_pro3, y_pro4, y_pro5, y_pro6, y_pro7;
wire [7:0] e;
//---------------------------------booth2 encoder-------------------------------
booth2 booth_encoder7(.x2(x[15]), .x1(x[14]), .x0(x[13]), .y(y) , .y_pro(y_pro7) , .s(s7), .e(e[7]));
booth2 booth_encoder6(.x2(x[13]), .x1(x[12]), .x0(x[11]), .y(y) , .y_pro(y_pro6) , .s(s6), .e(e[6]));
booth2 booth_encoder5(.x2(x[11]), .x1(x[10]), .x0(x[9]), .y(y) , .y_pro(y_pro5) , .s(s5), .e(e[5]));
booth2 booth_encoder4(.x2(x[9]), .x1(x[8]), .x0(x[7]), .y(y) , .y_pro(y_pro4) , .s(s4), .e(e[4]));
booth2 booth_encoder3(.x2(x[7]), .x1(x[6]), .x0(x[5]), .y(y) , .y_pro(y_pro3) , .s(s3), .e(e[3]));
booth2 booth_encoder2(.x2(x[5]), .x1(x[4]), .x0(x[3]), .y(y) , .y_pro(y_pro2) , .s(s2), .e(e[2]));
booth2 booth_encoder1(.x2(x[3]), .x1(x[2]), .x0(x[1]), .y(y) , .y_pro(y_pro1) , .s(s1), .e(e[1]));
booth2 booth_encoder0(.x2(x[1]), .x1(x[0]), .x0(1'b0), .y(y) , .y_pro(y_pro0) , .s(s0), .e(e[0]));
//---------------------------------combine y_pro and e to get pp
assign pp0 = {e[0], ~e[0], ~e[0], y_pro0};
assign pp1 = {1'b1, e[1], y_pro1};
assign pp2 = {1'b1, e[2], y_pro2};
assign pp3 = {1'b1, e[3], y_pro3};
assign pp4 = {1'b1, e[4], y_pro4};
assign pp5 = {1'b1, e[5], y_pro5};
assign pp6 = {1'b1, e[6], y_pro6};
assign pp7 = {e[7], y_pro7};
//----------------------------------register------------------------------


endmodule
