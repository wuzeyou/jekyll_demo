//File Name     : wallace_tree.v
//
//Purpose       : wallace tree
//
//Author        : Zeyuan Zou
//
//Simulator     : NC-Verilog
//--------------------------------------------------------------------
module wallace_tree(clk, pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7, s0, s1, s2, s3, s4, s5, s6, s7, opa, opb);
//----------------------input-----------------------------------------
input clk;
input [19:0] pp0;
input[18:0] pp1, pp2, pp3, pp4, pp5, pp6;
input[17:0] pp7;
input s0, s1, s2, s3, s4, s5, s6, s7;
//----------------------output----------------------------------------
output[31:0] opa, opb;
//----------------------interior connection---------------------------
wire r20,r21,r22,r23,r49,r50,r51,r52,r53,r54,r55,r56,r57,r48,k19,k20,k21,r19,r58,r59,r60,r61,r62,r63,r64,r65,r66,r67,r68,r69,r70,r71,r72,r73,k48,k49,k50,k51,k52,k53,k54,k55,k56,k57,k58,k59,k60,k61,k62,k63,k64,k65,k66,k67,k68,k69,k70,k71,k72;
wire r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r24,r25,r26,r27,r28,r29,r30,r31,r32,r33,r34,r35,r36,r37,r38,r39,r40,r41,r42,r43,r44,r45,r46,r47;
wire k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16,k17,k18,k22,k23,k24,k25,k26,k27,k28,k29,k30,k31,k32,k33,k34,k35,k36,k37,k38,k39,k40,k41,k42,k43,k44,k45,k46,k47,k73;
wire j0,j1,j2,j3,j4,j5,j6,j7,j8,j9,j10,j11,j12,j13,j14,j15,j16,j17,j18,j19,j20,j21,j22,j23,j24,j25,j26,j27,j28,j29,j30,j31,j32,j33,j34,j35,j36,j37,j38,j39,j40,j41,j42,j43,j44,j45,j46,j47,j48,j49,j50;
//----------------------wallace tree-----------------------------------
adder_h ah0(.sum(r0) , .cout(k0) , .a(s7) , .b(pp7[0]));
adder_h ah1(.sum(r1) , .cout(k1) , .a(pp6[3]) , .b(pp7[1]));
adder_h ah2(.sum(r2) , .cout(k2) , .a(pp6[4]) , .b(pp7[2]));
adder_h ah3(.sum(r3) , .cout(k3) , .a(pp6[5]) , .b(pp7[3]));
adder_h ah4(.sum(r4) , .cout(k4) , .a(pp6[6]) , .b(pp7[4]));
adder_h ah5(.sum(r5) , .cout(k5) , .a(pp6[7]) , .b(pp7[5]));

adder_h ah6(.sum(r6) , .cout(k6) , .a(s5) , .b(pp5[0]));
adder_h ah7(.sum(r7) , .cout(k7) , .a(pp4[3]) , .b(pp5[1]));
compressor4_2 c0 (.sum(r8) , .c1(j0) , .c2(k8) , .a(s6) , .b(pp6[0]) , .c(pp5[2]) , .d(pp4[4]) , .cin(1'b0));
compressor4_2 c1 (.sum(r9) , .c1(j1) , .c2(k9) , .a(1'b0) , .b(pp6[1]) , .c(pp5[3]) , .d(pp4[5]) , .cin(j0));
compressor4_2 c2 (.sum(r10) , .c1(j2) , .c2(k10) , .a(r0) , .b(pp6[2]) , .c(pp5[4]) , .d(pp4[6]) , .cin(j1));
compressor4_2 c3 (.sum(r11) , .c1(j3) , .c2(k11) , .a(k0) , .b(r1) , .c(pp5[5]) , .d(pp4[7]) , .cin(j2));
compressor4_2 c4 (.sum(r12) , .c1(j4) , .c2(k12) , .a(k1) , .b(r2) , .c(pp5[6]) , .d(pp4[8]) , .cin(j3));
compressor4_2 c5 (.sum(r13) , .c1(j5) , .c2(k13) , .a(k2) , .b(r3) , .c(pp5[7]) , .d(pp4[9]) , .cin(j4));
compressor4_2 c6 (.sum(r14) , .c1(j6) , .c2(k14) , .a(k3) , .b(r4) , .c(pp5[8]) , .d(pp4[10]) , .cin(j5));
compressor4_2 c7 (.sum(r15) , .c1(j7) , .c2(k15) , .a(k4) , .b(r5) , .c(pp5[9]) , .d(pp4[11]) , .cin(j6));
compressor4_2 c8 (.sum(r16) , .c1(j8) , .c2(k16) , .a(k5) , .b(pp7[6]) , .c(pp6[8]) , .d(pp5[10]) , .cin(j7));
adder_f af0(.sum(r17) , .cout(k17) , .a(pp7[7]) , .b(pp6[9]) , .cin(j8));
adder_h ah8(.sum(r18) , .cout(k18) , .a(pp7[8]) , .b(pp6[10]));

adder_h ah9 (.sum(r19) , .cout(k19) , .a(pp1[0]) , .b(s1));
adder_h ah10(.sum(r20) , .cout(k20) , .a(pp1[1]) , .b(pp0[3]));
compressor4_2 c9 (.sum(r21) , .c1(j9) , .c2(k21) , .a(s2) , .b(pp2[0]) , .c(pp1[2]) , .d(pp0[4]) , .cin(1'b0));
compressor4_2 c10 (.sum(r22) , .c1(j10) , .c2(k22) , .a(1'b0) , .b(pp2[1]) , .c(pp1[3]) , .d(pp0[5]) , .cin(j9));
compressor4_2 c11 (.sum(r23) , .c1(j11) , .c2(k23) , .a(pp3[0]) , .b(pp2[2]) , .c(pp1[4]) , .d(pp0[6]) , .cin(j10));
compressor4_2 c12 (.sum(r24) , .c1(j12) , .c2(k24) , .a(pp3[1]) , .b(pp2[3]) , .c(pp1[5]) , .d(pp0[7]) , .cin(j11));
compressor4_2 c13 (.sum(r25) , .c1(j13) , .c2(k25) , .a(pp3[2]) , .b(pp2[4]) , .c(pp1[6]) , .d(pp0[8]) , .cin(j12));
compressor4_2 c14 (.sum(r26) , .c1(j14) , .c2(k26) , .a(pp3[3]) , .b(pp2[5]) , .c(pp1[7]) , .d(pp0[9]) , .cin(j13));
compressor4_2 c15 (.sum(r27) , .c1(j15) , .c2(k27) , .a(pp3[4]) , .b(pp2[6]) , .c(pp1[8]) , .d(pp0[10]) , .cin(j14));
compressor4_2 c16 (.sum(r28) , .c1(j16) , .c2(k28) , .a(pp3[5]) , .b(pp2[7]) , .c(pp1[9]) , .d(pp0[11]) , .cin(j15));
compressor4_2 c17 (.sum(r29) , .c1(j17) , .c2(k29) , .a(pp3[6]) , .b(pp2[8]) , .c(pp1[10]) , .d(pp0[12]) , .cin(j16));
compressor4_2 c18 (.sum(r30) , .c1(j18) , .c2(k30) , .a(pp3[7]) , .b(pp2[9]) , .c(pp1[11]) , .d(pp0[13]) , .cin(j17));
compressor4_2 c19 (.sum(r31) , .c1(j19) , .c2(k31) , .a(pp3[8]) , .b(pp2[10]) , .c(pp1[12]) , .d(pp0[14]) , .cin(j18));
compressor4_2 c20 (.sum(r32) , .c1(j20) , .c2(k32) , .a(pp3[9]) , .b(pp2[11]) , .c(pp1[13]) , .d(pp0[15]) , .cin(j19));
compressor4_2 c21 (.sum(r33) , .c1(j21) , .c2(k33) , .a(pp3[10]) , .b(pp2[12]) , .c(pp1[14]) , .d(pp0[16]) , .cin(j20));
compressor4_2 c22 (.sum(r34) , .c1(j22) , .c2(k34) , .a(pp3[11]) , .b(pp2[13]) , .c(pp1[15]) , .d(pp0[17]) , .cin(j21));
compressor4_2 c23 (.sum(r35) , .c1(j23) , .c2(k35) , .a(pp3[12]) , .b(pp2[14]) , .c(pp1[16]) , .d(pp0[18]) , .cin(j22));
compressor4_2 c24 (.sum(r36) , .c1(j24) , .c2(k36) , .a(pp3[13]) , .b(pp2[15]) , .c(pp1[17]) , .d(pp0[19]) , .cin(j23));
compressor4_2 c25 (.sum(r37) , .c1(j25) , .c2(k37) , .a(pp4[12]) , .b(pp3[14]) , .c(pp2[16]) , .d(pp1[18]) , .cin(j24));
compressor4_2 c26 (.sum(r38) , .c1(j26) , .c2(k38) , .a(pp5[11]) , .b(pp4[13]) , .c(pp3[15]) , .d(pp2[17]) , .cin(j25));
compressor4_2 c27 (.sum(r39) , .c1(j27) , .c2(k39) , .a(pp5[12]) , .b(pp4[14]) , .c(pp3[16]) , .d(pp2[18]) , .cin(j26));
compressor4_2 c28 (.sum(r40) , .c1(j28) , .c2(k40) , .a(pp6[11]) , .b(pp5[13]) , .c(pp4[15]) , .d(pp3[17]) , .cin(j27));
compressor4_2 c29 (.sum(r41) , .c1(j29) , .c2(k41) , .a(pp6[12]) , .b(pp5[14]) , .c(pp4[16]) , .d(pp3[18]) , .cin(j28));
compressor4_2 c30 (.sum(r42) , .c1(j30) , .c2(k42) , .a(pp7[11]) , .b(pp6[13]) , .c(pp5[15]) , .d(pp4[17]) , .cin(j29));
compressor4_2 c31 (.sum(r43) , .c1(j31) , .c2(k43) , .a(pp7[12]) , .b(pp6[14]) , .c(pp5[16]) , .d(pp4[18]) , .cin(j30));
compressor4_2 c32 (.sum(r44) , .c1(j32) , .c2(k44) , .a(1'b0) , .b(pp7[13]) , .c(pp6[15]) , .d(pp5[17]) , .cin(j31));
compressor4_2 c33 (.sum(r45) , .c1(j33) , .c2(k45) , .a(1'b0) , .b(pp7[14]) , .c(pp6[16]) , .d(pp5[18]) , .cin(j32));
adder_f af1(.sum(r46) , .cout(k46) , .a(pp7[15]) , .b(pp6[17]) , .cin(j33));
adder_h ah11(.sum(r47) , .cout(k47) , .a(pp7[16]) , .b(pp6[18]));

adder_h ah12 (.sum(r48) , .cout(k48) , .a(s3) , .b(k22));
adder_h ah13 (.sum(r49) , .cout(k49) , .a(k23) , .b(r24));
compressor4_2 c34 (.sum(r50) , .c1(j34) , .c2(k50) , .a(s4) , .b(pp4[0]) , .c(k24) , .d(r25) , .cin(1'b0));
compressor4_2 c35 (.sum(r51) , .c1(j35) , .c2(k51) , .a(1'b0) , .b(pp4[1]) , .c(k25) , .d(r26) , .cin(j34));
compressor4_2 c36 (.sum(r52) , .c1(j36) , .c2(k52) , .a(r6) , .b(pp4[2]) , .c(k26) , .d(r27) , .cin(j35));
compressor4_2 c37 (.sum(r53) , .c1(j37) , .c2(k53) , .a(k6) , .b(r7) , .c(k27) , .d(r28) , .cin(j36));
compressor4_2 c38 (.sum(r54) , .c1(j38) , .c2(k54) , .a(k7) , .b(r8) , .c(k28) , .d(r29) , .cin(j37));
compressor4_2 c39 (.sum(r55) , .c1(j39) , .c2(k55) , .a(k8) , .b(r9) , .c(k29) , .d(r30) , .cin(j38));
compressor4_2 c40 (.sum(r56) , .c1(j40) , .c2(k56) , .a(k9) , .b(r10) , .c(k30) , .d(r31) , .cin(j39));
compressor4_2 c41 (.sum(r57) , .c1(j41) , .c2(k57) , .a(k10) , .b(r11) , .c(k31) , .d(r32) , .cin(j40));
compressor4_2 c42 (.sum(r58) , .c1(j42) , .c2(k58) , .a(k11) , .b(r12) , .c(k32) , .d(r33) , .cin(j41));
compressor4_2 c43 (.sum(r59) , .c1(j43) , .c2(k59) , .a(k12) , .b(r13) , .c(k33) , .d(r34) , .cin(j42));
compressor4_2 c44 (.sum(r60) , .c1(j44) , .c2(k60) , .a(k13) , .b(r14) , .c(k34) , .d(r35) , .cin(j43));
compressor4_2 c45 (.sum(r61) , .c1(j45) , .c2(k61) , .a(k14) , .b(r15) , .c(k35) , .d(r36) , .cin(j44));
compressor4_2 c46 (.sum(r62) , .c1(j46) , .c2(k62) , .a(k15) , .b(r16) , .c(k36) , .d(r37) , .cin(j45));
compressor4_2 c47 (.sum(r63) , .c1(j47) , .c2(k63) , .a(k16) , .b(r17) , .c(k37) , .d(r38) , .cin(j46));
compressor4_2 c48 (.sum(r64) , .c1(j48) , .c2(k64) , .a(k17) , .b(r18) , .c(k38) , .d(r39) , .cin(j47));
compressor4_2 c49 (.sum(r65) , .c1(j49) , .c2(k65) , .a(k18) , .b(pp7[9]) , .c(k39) , .d(r40) , .cin(j48));
compressor4_2 c50 (.sum(r66) , .c1(j50) , .c2(k66) , .a(1'b0) , .b(pp7[10]) , .c(k40) , .d(r41) , .cin(j49));
adder_f af2(.sum(r67) , .cout(k67) , .a(k41) , .b(r42) , .cin(j50));
adder_h ah14(.sum(r68) , .cout(k68) , .a(k42) , .b(r43));
adder_h ah15(.sum(r69) , .cout(k69) , .a(k43) , .b(r44));
adder_h ah16(.sum(r70) , .cout(k70) , .a(k44) , .b(r45));
adder_h ah17(.sum(r71) , .cout(k71) , .a(k45) , .b(r46));
adder_h ah18(.sum(r72) , .cout(k72) , .a(k46) , .b(r47));
adder_h ah19(.sum(r73) , .cout(k73) , .a(k47) , .b(pp7[17]));
assign opa = {r73,r72,r71,r70,r69,r68,r67,r66,r65,r64,r63,r62,r61,r60,r59,r58,r57,r56,r55,r54,r53,r52,r51,r50,r49,r23,r22,r21,r20,pp0[2:0]};
assign opb = {k72,k71,k70,k69,k68,k67,k66,k65,k64,k63,k62,k61,k60,k59,k58,k57,k56,k55,k54,k53,k52,k51,k50,k49,k48,r48,k21,k20,k19,r19,1'b0,s0};


endmodule
