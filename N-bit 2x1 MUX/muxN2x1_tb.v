module muxN2x1_tb;
// Parameter
parameter N = 4;

// Inputs 
reg [N-1 :0] x0;
reg [N-1 :0] x1;
reg s;

// Output 
wire [N-1:0] f;



// Connection to the Design
muxN2x1 #(N) top(.x0(x0), .x1(x1), .s(s), .f(f));

task run_task(input [N-1:0] in0, input [N-1:0] in1, input sel);
	begin
		x0 = in0;
		x1 = in1;
		s = sel;
		#10;
		$display("x0 = %b. x1 = %b, s = %b, f = %b", x0, x1, s, f);
	end
endtask

// Testing All input combinations
initial begin
integer i, j;
	$display("Starting 2x1 Testbench");
	for(i = 0; i < 2**N; i = i + 1) begin
		for(j = 0; j < 2**N; j = j + 1) begin
			run_task(i[N-1:0], j[N-1:0],0);
			run_task(i[N-1:0], j[N-1:0],1);
		end
	end
	$display("Testbench Complete");
	$finish;
end



endmodule
