`timescale 1ns / 1ns

module main_tb;

	// top inputs

	// top outputs

	// top instance
	top top (.*);

	always #5 clk = ~clk;

	initial begin
		$dumpfile("sim.vcd");
		$dumpvars;
	
		// write tests here

		$finish;
	end

endmodule
