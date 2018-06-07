module top #(
	parameter WIDTH = 4
) (
	// inputs
	input wire [WIDTH-1:0] A, B,
	input wire Cin,
	// outputs
	output wire [WIDTH-1:0] Sum,
	output wire Cout
);

	assign Sum  = (A ^ B) ^ Cin;
	assign Cout = (A & ~B & Cin) | (~A & B & Cin) | (A & B);

endmodule

