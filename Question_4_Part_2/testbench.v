
`timescale 1ns / 1ps

module tb_dadda6x6;

  reg  [5:0] a, b;
  wire [11:0] prod;

  dadda6x6 uut (
    .a(a),
    .b(b),
    .prod(prod)
  );

  integer i;
  reg [11:0] expected;

  initial begin
  
    for (i = 0; i < 10000; i = i + 1) begin
      a = $random;   
      b = $random;

      #1;

      expected = a * b;

      if (prod !== expected) begin
        $display("ERROR at iteration %0d: a=%0d b=%0d DUT=%0d Expected=%0d",
                  i, a, b, prod, expected);
      end
    end

    $display("Simulation finished after %0d iterations.", i);
    $finish;
  end

endmodule
