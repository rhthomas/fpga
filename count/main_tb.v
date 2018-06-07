`timescale 1ns / 1ns

module main_tb;

	reg CLK;
	wire [4:0] LED;

	integer x = 0;

	top top (.*);
		
	initial begin
		$dumpfile("sim.vcd");
		$dumpvars;
		
		CLK = 1'b0;
		while (x <= 'h1F) begin
			#5 CLK = ~CLK;
			x = x + 1;
		end
		
		$finish;
	end

endmodule
