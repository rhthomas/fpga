`timescale 1ns / 100ps
//`include "main.v"

module main_tb;

	reg		CLK;
	wire [4:0] 	LED;

	top top (.*);

	initial begin
		$dumpfile("sim.vcd");
		$dumpvars;
	
		CLK = 1'b0;
		#5 CLK = ~CLK;
		#5 CLK = ~CLK;
		#5 CLK = ~CLK;
		#5 CLK = ~CLK;
		#5 CLK = ~CLK;
		#5 CLK = ~CLK;

		$finish;
	end

endmodule
