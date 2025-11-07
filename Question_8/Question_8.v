`timescale 1ns / 1ps


module question_8 (
    input  wire        clk,
    input  wire        reset,
    input  wire signed [15:0] in_data,
    output reg  signed [31:0] acc,
    output reg         overflow_flag,
    output reg         underflow_flag,
    output reg  signed [15:0] min_val,
    output reg  signed [15:0] max_val,
    output reg  [31:0] cycle_count
);

    reg signed [31:0] acc_next;
    reg overflow_detected;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            acc              <= 32'sd0;
            min_val          <= 16'sh7FFF;  
            max_val          <= 16'sh8000;  
            cycle_count      <= 32'd0;
            overflow_flag    <= 1'b0;
            underflow_flag   <= 1'b0;
            overflow_detected<= 1'b0;
        end else begin
            acc_next = acc + in_data;
 
            if (!overflow_detected) begin
                cycle_count <= cycle_count + 1;

                if (acc_next > 32'sh7FFFFFFF) begin
                    overflow_flag     <= 1'b1;
                    overflow_detected <= 1'b1;
                end

                else if (acc_next < 32'sh80000000) begin
                    underflow_flag    <= 1'b1;
                    overflow_detected <= 1'b1;
                end
                else begin
                    acc <= acc_next;

                    if (in_data < min_val)
                        min_val <= in_data;
                    if (in_data > max_val)
                        max_val <= in_data;
                end
            end
        end
    end
endmodule
