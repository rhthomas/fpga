module top #(
	parameter WIDTH = 4
) (
	// inputs
	input wire [WIDTH-1:0] A, B,
	// outputs
	output wire [WIDTH-1:0] Sum
);

	assign Sum = A + B;

endmodule
