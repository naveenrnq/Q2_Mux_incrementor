`timescale 1ns / 1ps

module fa(
    input  A, B, Cin,
    output S, Co
);
    xor xor1(S, A, B, Cin);
    assign Co = (A & B) | (B & Cin) | (Cin & A);
endmodule

module ha(
    input  A, B,
    output S, C
);
    xor x1(S, A, B);
    and x2(C, A, B);
endmodule

module PGGen(output g, p, input a, b);
    and (g, a, b);
    xor (p, a, b);
endmodule

module CLA11(
    output [10:0] sum,
    output        cout,
    input  [10:0] a,
    input  [10:0] b
);
    wire [10:0] g, p;
    wire [65:0] e;
    wire [10:0] c;
    wire        cin;

    assign cin = 1'b0;

    // c[0]
    and (e[0], cin, p[0]);
    or  (c[0], e[0], g[0]);

    // c[1]
    and (e[1], cin, p[0], p[1]);
    and (e[2], g[0], p[1]);
    or  (c[1], e[1], e[2], g[1]);

    // c[2]
    and (e[3], cin, p[0], p[1], p[2]);
    and (e[4], g[0], p[1], p[2]);
    and (e[5], g[1], p[2]);
    or  (c[2], e[3], e[4], e[5], g[2]);

    // c[3]
    and (e[6],  cin, p[0], p[1], p[2], p[3]);
    and (e[7],  g[0], p[1], p[2], p[3]);
    and (e[8],  g[1], p[2], p[3]);
    and (e[9],  g[2], p[3]);
    or  (c[3],  e[6], e[7], e[8], e[9], g[3]);

    // c[4]
    and (e[10], cin, p[0], p[1], p[2], p[3], p[4]);
    and (e[11], g[0], p[1], p[2], p[3], p[4]);
    and (e[12], g[1], p[2], p[3], p[4]);
    and (e[13], g[2], p[3], p[4]);
    and (e[14], g[3], p[4]);
    or  (c[4],  e[10], e[11], e[12], e[13], e[14], g[4]);

    // c[5]
    and (e[15], cin, p[0], p[1], p[2], p[3], p[4], p[5]);
    and (e[16], g[0], p[1], p[2], p[3], p[4], p[5]);
    and (e[17], g[1], p[2], p[3], p[4], p[5]);
    and (e[18], g[2], p[3], p[4], p[5]);
    and (e[19], g[3], p[4], p[5]);
    and (e[20], g[4], p[5]);
    or  (c[5],  e[15], e[16], e[17], e[18], e[19], e[20], g[5]);

    // c[6]
    and (e[21], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6]);
    and (e[22], g[0], p[1], p[2], p[3], p[4], p[5], p[6]);
    and (e[23], g[1], p[2], p[3], p[4], p[5], p[6]);
    and (e[24], g[2], p[3], p[4], p[5], p[6]);
    and (e[25], g[3], p[4], p[5], p[6]);
    and (e[26], g[4], p[5], p[6]);
    and (e[27], g[5], p[6]);
    or  (c[6],  e[21], e[22], e[23], e[24], e[25], e[26], e[27], g[6]);

    // c[7]
    and (e[28], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7]);
    and (e[29], g[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7]);
    and (e[30], g[1], p[2], p[3], p[4], p[5], p[6], p[7]);
    and (e[31], g[2], p[3], p[4], p[5], p[6], p[7]);
    and (e[32], g[3], p[4], p[5], p[6], p[7]);
    and (e[33], g[4], p[5], p[6], p[7]);
    and (e[34], g[5], p[6], p[7]);
    and (e[35], g[6], p[7]);
    or  (c[7],  e[28], e[29], e[30], e[31], e[32], e[33], e[34], e[35], g[7]);

    // c[8]
    and (e[36], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8]);
    and (e[37], g[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8]);
    and (e[38], g[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8]);
    and (e[39], g[2], p[3], p[4], p[5], p[6], p[7], p[8]);
    and (e[40], g[3], p[4], p[5], p[6], p[7], p[8]);
    and (e[41], g[4], p[5], p[6], p[7], p[8]);
    and (e[42], g[5], p[6], p[7], p[8]);
    and (e[43], g[6], p[7], p[8]);
    and (e[44], g[7], p[8]);
    or  (c[8],  e[36], e[37], e[38], e[39], e[40], e[41], e[42], e[43], e[44], g[8]);

    // c[9]
    and (e[45], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9]);
    and (e[46], g[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9]);
    and (e[47], g[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9]);
    and (e[48], g[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9]);
    and (e[49], g[3], p[4], p[5], p[6], p[7], p[8], p[9]);
    and (e[50], g[4], p[5], p[6], p[7], p[8], p[9]);
    and (e[51], g[5], p[6], p[7], p[8], p[9]);
    and (e[52], g[6], p[7], p[8], p[9]);
    and (e[53], g[7], p[8], p[9]);
    and (e[54], g[8], p[9]);
    or  (c[9],  e[45], e[46], e[47], e[48], e[49], e[50], e[51], e[52], e[53], e[54], g[9]);

    // c[10]
    and (e[55], cin, p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10]);
    and (e[56], g[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10]);
    and (e[57], g[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10]);
    and (e[58], g[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10]);
    and (e[59], g[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10]);
    and (e[60], g[4], p[5], p[6], p[7], p[8], p[9], p[10]);
    and (e[61], g[5], p[6], p[7], p[8], p[9], p[10]);
    and (e[62], g[6], p[7], p[8], p[9], p[10]);
    and (e[63], g[7], p[8], p[9], p[10]);
    and (e[64], g[8], p[9], p[10]);
    and (e[65], g[9], p[10]);
    or  (c[10], e[55], e[56], e[57], e[58], e[59], e[60], e[61], e[62], e[63], e[64], e[65], g[10]);

    xor (sum[0], p[0], cin);
    xor x[10:1](sum[10:1], p[10:1], c[9:0]);
    buf (cout, c[10]);
    PGGen pggen[10:0](g[10:0], p[10:0], a[10:0], b[10:0]);
    
endmodule


module dadda6x6(
    input  [5:0]  a, b,
    output [11:0] prod
);

    wire [35:0] pp_flat;

    genvar i, j;
    generate
        for (i = 0; i < 6; i = i + 1) begin : GEN_PP_ROW
            for (j = 0; j < 6; j = j + 1) begin : GEN_PP_COL
                assign pp_flat[i*6 + j] = a[j] & b[i];
            end
        end
    endgenerate

    `define PP(i,j) pp_flat[(i)*6 + (j)]

    wire [14:1] fa_s, fa_c;
    wire [6:1]  ha_s, ha_c;

    // Stage 1
    fa fa1(.A(`PP(0,5)), .B(`PP(1,4)), .Cin(`PP(2,3)), .S(fa_s[1]), .Co(fa_c[1]));
    fa fa2(.A(`PP(1,5)), .B(`PP(2,4)), .Cin(`PP(3,3)), .S(fa_s[2]), .Co(fa_c[2]));
    fa fa3(.A(`PP(2,5)), .B(`PP(3,4)), .Cin(`PP(4,3)), .S(fa_s[3]), .Co(fa_c[3]));

    ha ha1(.A(`PP(0,4)), .B(`PP(1,3)), .S(ha_s[1]), .C(ha_c[1]));
    ha ha2(.A(`PP(3,2)), .B(`PP(4,1)), .S(ha_s[2]), .C(ha_c[2]));
    ha ha3(.A(`PP(4,2)), .B(`PP(5,1)), .S(ha_s[3]), .C(ha_c[3]));

    // Stage 2
    fa fa4(.A(ha_s[1]), .B(`PP(2,2)), .Cin(`PP(3,1)), .S(fa_s[4]), .Co(fa_c[4]));
    fa fa5(.A(ha_c[1]), .B(fa_s[1]), .Cin(ha_s[2]), .S(fa_s[5]), .Co(fa_c[5]));
    fa fa6(.A(fa_c[1]), .B(ha_c[2]), .Cin(fa_s[2]), .S(fa_s[6]), .Co(fa_c[6]));
    fa fa7(.A(fa_c[2]), .B(ha_c[3]), .Cin(fa_s[3]), .S(fa_s[7]), .Co(fa_c[7]));
    fa fa8(.A(fa_c[3]), .B(`PP(3,5)), .Cin(`PP(4,4)), .S(fa_s[8]), .Co(fa_c[8]));

    ha ha4(.A(`PP(0,3)), .B(`PP(1,2)), .S(ha_s[4]), .C(ha_c[4]));

    // Final accumulation into two 11-bit vectors for CLA
    wire [10:0] to_FA0, to_FA1;

    // Stage 3 (column-wise alignment preserved)
    fa fa9 (.A(ha_s[4]), .B(`PP(2,1)), .Cin(`PP(3,0)),    .S(to_FA0[3]),  .Co(to_FA1[4]));
    fa fa10(.A(ha_c[4]), .B(fa_s[4]), .Cin(`PP(4,0)),    .S(to_FA0[4]),  .Co(to_FA1[5]));
    fa fa11(.A(fa_c[4]), .B(fa_s[5]), .Cin(`PP(5,0)),    .S(to_FA0[5]),  .Co(to_FA1[6]));
    fa fa12(.A(fa_c[5]), .B(fa_s[6]), .Cin(ha_s[3]),     .S(to_FA0[6]),  .Co(to_FA1[7]));
    fa fa13(.A(fa_c[6]), .B(fa_s[7]), .Cin(`PP(5,2)),    .S(to_FA0[7]),  .Co(to_FA1[8]));
    fa fa14(.A(fa_c[7]), .B(fa_s[8]), .Cin(`PP(5,3)),    .S(to_FA0[8]),  .Co(to_FA1[9]));
    fa fa15(.A(`PP(4,5)), .B(`PP(5,4)), .Cin(fa_c[8]),   .S(to_FA0[9]),  .Co(to_FA1[10]));

    ha ha5(.A(`PP(0,2)), .B(`PP(1,1)), .S(to_FA0[2]), .C(to_FA1[3]));

    assign to_FA0[0]  = `PP(0,0);
    assign to_FA1[0]  = 1'b0;

    assign to_FA0[1]  = `PP(0,1);
    assign to_FA1[1]  = `PP(1,0);

    assign to_FA1[2]  = `PP(2,0);

    assign to_FA0[10] = `PP(5,5);

    // Fast adder
    CLA11 fast_adder1(
        .sum(prod[10:0]),
        .cout(prod[11]),
        .a(to_FA0),
        .b(to_FA1)
    );

endmodule
