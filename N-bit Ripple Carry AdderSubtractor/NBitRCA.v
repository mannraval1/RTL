module NBitRCA #(parameter N = 4) (
  input  [N - 1:0] a,
  input  [N - 1:0] b,
  input            carry_in,
  input            sub,
  output [N - 1:0] result,
  output           carry_out
);

  wire [N-1:0] b_xor;
  wire [N:0]   carry;

  assign b_xor   = b ^ {N{sub}};
  assign carry[0] = sub ^ carry_in;

  genvar i;
  generate
    for (i = 0; i < N; i = i + 1) begin : ripple
      full_adder fa (
        .a(a[i]),
        .b(b_xor[i]),
        .carry_in(carry[i]),
        .sum(result[i]),
        .carry_out(carry[i+1])
      );
    end
  endgenerate

  assign carry_out = carry[N];

endmodule


// Full Adder Module
module full_adder(
  input  a,
  input  b,
  input  carry_in,
  output sum,
  output carry_out
);
  assign {carry_out, sum} = a + b + carry_in;
endmodule
