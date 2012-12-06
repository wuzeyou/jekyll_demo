`timescale 1ns/100ps
module booth2_tb;
    
reg[2:0] x;
reg[15:0] y;
wire x2, x1, x0;
assign x2 = x[2];
assign x1 = x[1];
assign x0 = x[0];

wire [16:0] y_pro;
wire s;
wire e;
booth2 booth2_0(
                .x2(x2),
                .x1(x1),
                .x0(x0),
                .y(y),
                .y_pro(y_pro),
                .s(s),
                .e(e)
                );


initial
begin
    x = 3'b000;
    repeat(20)
    begin
        x = x + 3'b001;
        y = 16'h4d6f;
        #20 ;
    end
end

initial
begin
    $dumpfile("test.vcd");
    $dumpvars(0, booth2_tb);
end      
endmodule