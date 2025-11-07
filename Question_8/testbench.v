`timescale 1ns/1ps

module tb_question_8;

    reg clk;
    reg reset;
    reg signed [15:0] in_data;
    wire signed [31:0] acc;
    wire overflow_flag;
    wire underflow_flag;
    wire signed [15:0] min_val;
    wire signed [15:0] max_val;
    wire [31:0] cycle_count;

    question_8 dut (
        .clk(clk),
        .reset(reset),
        .in_data(in_data),
        .acc(acc),
        .overflow_flag(overflow_flag),
        .underflow_flag(underflow_flag),
        .min_val(min_val),
        .max_val(max_val),
        .cycle_count(cycle_count)
    );

    initial clk = 0;
    always #5 clk = ~clk; 

    integer i;

    initial begin
    
        reset = 1;
        in_data = 0;
        #20;
        reset = 0;

        for (i = 0; i < 200; i = i + 1) begin
            in_data = $random;   
            @(posedge clk);

            $display("Cycle=%0d | in_data=%0d | acc=%0d | min=%0d | max=%0d | overflow=%b | underflow=%b",
                     cycle_count, in_data, acc, min_val, max_val, overflow_flag, underflow_flag);

            if (overflow_flag || underflow_flag) begin
                $display(">>> Terminating: overflow/underflow detected at cycle %0d", cycle_count);
                #20 $finish;
            end
        end

        $display(">>> Simulation completed without overflow/underflow.");
        $finish;
    end

endmodule
