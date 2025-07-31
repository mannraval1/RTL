module muxN2x1 #(parameter N = 4)
(
x0, x1, s , f
);

	input [N - 1:0] x0;
	input [N - 1:0] x1;
	input s;
	output [N - 1:0] f;
	
	assign f = s ? x1 : x0;

endmodule 