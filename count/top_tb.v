`timescale 1ns / 1ns

module main_tb;

	reg clk, rst, en;
	wire [4:0] out;

	top top (.*);
	
	parameter PERIOD  = 20; // 20ns period
	parameter ENDTIME = PERIOD * 10; // run for 10 clk cycles

	initial	begin
		$dumpfile("project.vcd");
		$dumpvars;
		main;
	end

	// main task
	task main;
	fork
		init;
		clk_gen;
		rst_gen;
		operation;
		end_sim;
	join
	endtask

	// initialise inputs
	task init;
	begin
		clk = 0;
		en = 'b0;
		rst = 'b1;
	end
	endtask

	// generate 50MHz fastclk
	task clk_gen;
	begin
		forever #(PERIOD/2) clk = ~clk;
	end
	endtask

	// reset generation
	task rst_gen;
	begin
		#PERIOD rst = 0;
		#PERIOD en  = 1;
	end
	endtask

	// operation to test
	task operation;
	begin
		// no operation
	end
	endtask

	// end simulation
	task end_sim;
	begin
		#ENDTIME $finish;
	end
	endtask

endmodule
