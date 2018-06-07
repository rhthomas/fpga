`timescale 1ns / 1ns

module main_tb #(parameter WIDTH = 4);

	reg [WIDTH-1:0] A, B;
	wire [WIDTH-1:0] Sum;

	integer i = 0;

	top adder (.A(A), .B(B), .Sum(Sum));

	initial begin
		$dumpfile("sim.vcd");
		$dumpvars;

		// initialise inputs
		{A,B} = 0;
	
		// cycle through possible combinations
		for (i=1; i<'hFF; i=i+1) begin
			#5 {A, B} = i;
		end	

		$finish;
	end

endmodule
