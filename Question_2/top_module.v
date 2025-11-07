`timescale 1ns / 1ps

module dff_8bit (
    input clk,
    input rst,
    input [7:0] d,
    output reg [7:0] q
);
    always @(posedge clk) begin
        if (rst)
            q <= 8'b0;
        else
            q <= d;
    end
endmodule

module counter_2bit (
    input clk,
    input rst,
    output reg [1:0] count
);
    always @(posedge clk) begin
        if (rst)
            count <= 2'b00;
        else
            count <= count + 1;
    end
endmodule

module mux4to1_8bit (
    input [7:0] in0,
    input [7:0] in1,
    input [7:0] in2,
    input [7:0] in3,
    input [1:0] sel,
    output reg [7:0] out
);
    always @(*) begin
        case (sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
            default: out = 8'b00000000;
        endcase
    end
endmodule

module top_module (
    input clk,
    input rst,
    input [7:0] in0, in1, in2, in3,
    output [7:0] out
);

    wire [7:0] in_0;
    wire [7:0] in_1;
    wire [7:0] in_2;
    wire [7:0] in_3;
    wire [1:0] count;

    dff_8bit u_dff0 (.clk(clk), .rst(rst), .d(in0), .q(in_0));
    dff_8bit u_dff1 (.clk(clk), .rst(rst), .d(in1), .q(in_1));
    dff_8bit u_dff2 (.clk(clk), .rst(rst), .d(in2), .q(in_2));
    dff_8bit u_dff3 (.clk(clk), .rst(rst), .d(in3), .q(in_3));

    counter_2bit u_counter (.clk(clk), .rst(rst), .count(count));

    mux4to1_8bit u_mux (.in0(in_0), .in1(in_1), .in2(in_2), .in3(in_3), .sel(count), .out(out));

endmodule
