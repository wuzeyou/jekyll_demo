`timescale 1ns/100ps
module multiplier_tb;

parameter tclk = 10;
reg clk;

reg [15:0] a;
reg [15:0] b;
wire [31:0] res, res_test;

multiplier multiplier_0(
                        .opx(a), 
                        .opy(b), 
                        .res(res)
                    );
multiplier_test multiplier_test_0(
                                    .a(a),
                                    .b(b),
                                    .p(res_test)
                                    );

initial clk = 1'b0;
always #(tclk/2) clk = ~clk;

reg[31:0] res_test1, res_test2, res_test3;
reg[4:0] counter;
initial counter = 0;
always @(posedge clk)
begin
    res_test1 <= res_test;
    res_test2 <= res_test1;
    res_test3 <= res_test2;
    if (res != res_test)
        counter <= counter+1;
end

initial
begin
    repeat(200)
    begin
        a = {$random}%17'h10000;
        b = {$random}%17'h10000;
        #tclk ;
    end
    $finish;
end

initial
begin
    $dumpfile("test.vcd");
    $dumpvars(0, multiplier_tb);
end      
endmodule