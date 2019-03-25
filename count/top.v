module div (
	input clk_in,
	output clk_out
);

	reg [21:0] count;

	always @(posedge clk_in)
		count <= count + 1;

	assign clk_out = count[21];

endmodule

module count (
    input clk, rst, en,
    output [4:0] out
);

	reg [4:0] count;

    always @(posedge clk) begin
		if (rst) count <= 0;
		else if (en) count <= count + 1;
	end

	assign out = count;

endmodule

module top (
	input clk, rst, en,
	output [4:0] out
);

	wire slowclk;

	div div (
		.clk_in(clk),
		.clk_out(slowclk)
	);

	count count (
		// .clk(clk), // for simulation
		.clk(slowclk), // for sythesis
		.rst(rst),
		.en(en),
		.out(out)
	);

endmodule
