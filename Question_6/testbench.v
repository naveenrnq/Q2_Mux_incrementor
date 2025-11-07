`timescale 1ns/1ps

module tb_question_6;

    reg clk;
    reg rst;
    reg signed [15:0] x;
    wire signed [15:0] y;

    question_6 dut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y)
    );


    initial clk = 0;
    always #5 clk = ~clk;

    integer i = 0;

    initial begin

        rst = 1;
        x   = 0;
        #20;
        rst = 0;

        $display("=== Directed Test Sequence ===");
        x = 16'sd1; @(posedge clk);
        x = 16'sd2; @(posedge clk);
        x = 16'sd3; @(posedge clk);
        x = 16'sd4; @(posedge clk);
        x = -16'sd5; @(posedge clk);


        $display("=== Random Test Sequence ===");
        for (i = 0; i < 20; i = i + 1) begin
            x = $random;  
            @(posedge clk);
            $display("Cycle=%0d | x=%0d | y=%0d", i, x, y);
        end

        $display(">>> Simulation finished.");
        $finish;
    end

endmodule

