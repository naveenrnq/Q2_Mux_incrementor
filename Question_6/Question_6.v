module question_6(
    input clk,
    input rst,
    input signed [15:0] x,
    output reg signed [15:0] y
);

    reg signed [15:0] x1, x2;       
    reg signed [15:0] y1, y2, y3;  

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            x1 <= 16'sd0;
            x2 <= 16'sd0;
            y1 <= 16'sd0;
            y2 <= 16'sd0;
            y3 <= 16'sd0;
            y  <= 16'sd0;
        end else begin
            // Compute y using OLD values
            y <= x - x1 + x2 + y3 + (y1 >>> 1) + (y2 >>> 2);

            // Update delay registers AFTER computing y
            x2 <= x1;
            x1 <= x;
            y3 <= y2;
            y2 <= y1;
            y1 <= y;
        end
    end
endmodule
