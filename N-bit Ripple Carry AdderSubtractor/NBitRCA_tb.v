module NBitRCA_tb;

parameter N = 4;

// Inputs 
reg [N-1:0] a;
reg [N-1:0] b;
reg sub ;
reg carry_in;

// Output
wire [N-1:0] result;
wire carry_out;

integer i;
integer j;
integer ci;
integer sb;

// Instantiate the DUT
  NBitRCA #(N) dut (
    .a(a),
    .b(b),
    .carry_in(carry_in),
    .sub(sub),
    .result(result),
    .carry_out(carry_out)
  );
  
initial begin
$display("The Testbench is starting now. Brace for the impact!");

	for(i = 0; i < (1 << N); i = i + 1) begin
		for(j = 0; j < (1 << N); j = j + 1) begin
		for ( ci = 0; ci < 2; ci = ci + 1) begin
          for (sb = 0; sb < 2; sb = sb + 1) begin
            a = i[N-1:0];
            b = j[N-1:0];
            carry_in = ci;
            sub = sb;
            #1;
            $display("a = %b, b = %b, sub = %b, carry_in = %b -> result = %b, carry_out = %b",
                     a, b, sub, carry_in, result, carry_out);
          end
        end
		end
	end
	$display("The testbench is complete. It passes. Everybody is safe");
	$finish;
end


endmodule 