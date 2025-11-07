`timescale 1ns / 1ps

module tb_top_module;

    reg clk;
    reg rst;
    reg [7:0] in0, in1, in2, in3;
    wire [7:0] out;

    top_module uut (
        .clk(clk),
        .rst(rst),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .out(out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        in0 = 8'hAA;
        in1 = 8'hBB;
        in2 = 8'hCC;
        in3 = 8'hDD;

        #10 rst = 0;

        #30 in0 = 8'h11;
             in1 = 8'h22;
             in2 = 8'h33;
             in3 = 8'h44;

        #50 in0 = 8'h55;
             in1 = 8'h66;
             in2 = 8'h77;
             in3 = 8'h88;

        #100;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | count=%0d | out=%h", $time, uut.count, out);
    end

endmodule
