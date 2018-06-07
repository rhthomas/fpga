`timescale 1ns / 1ns

module main_tb #(parameter WIDTH = 4);

	reg Cin;
	wire Cout;
	reg [WIDTH-1:0] A, B;
	wire [WIDTH-1:0] Sum;

	integer i = 0;

	top adder (.A(A), .B(B), .Sum(Sum), .Cin(Cin), .Cout(Cout));

	initial begin
		$dumpfile("sim.vcd");
		$dumpvars;

		// initialise inputs
		{A,B,Cin} = 0;
	
		// cycle through possible combinations
		for (i=1; i<256; i=i+1) begin
			#5 {A, B} = i;
		end	

		$finish;
	end

endmodule
