`timescale 1ns / 1ns

module main_tb;

	reg clk, rst, en;
	wire [4:0] out;

	top top (.*);
		
	initial begin
		$dumpfile("sim.vcd");
		$dumpvars;
		
		clk = 'b0; en = 'b0; rst = 'b1;
		repeat (4) #5 clk = ~clk;
		en = 'b1; rst = 'b0;
		repeat('h1F) #5 clk = ~clk;
		
		$finish;
	end

endmodule
