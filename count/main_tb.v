`timescale 1ns / 1ns

module main_tb;

	reg clk, rst, en;
	wire [4:0] out;

	top top (.*);
	
	parameter PERIOD = 20; // 20ns period

	// generate 50MHz fastclk
	initial clk = 0;
	always #(PERIOD/2) clk = ~clk;
	
	initial begin
		$dumpfile("sim.vcd");
		$dumpvars;
		
		en = 'b0; rst = 'b1;
		#(PERIOD) en = 'b1; rst = 'b0;
		
		#(10 * PERIOD) $finish;
	end

endmodule
