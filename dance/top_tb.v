`timescale 1ns / 1ns

module top_tb;

    parameter PERIOD = 20;

    reg clock;
    reg reset;
    wire [4:0] led;

    top top (
        .clock (clock),
        .reset (reset),
        .led   (led)
    );

    event terminate;
    event reset_enable, reset_done;

    reg [4:0] test_data [0:8];
    integer err_cnt, i;

    // load test data
    initial begin
        $readmemb("prog.hex", test_data);
    end

    // clock
    initial begin
        forever #(PERIOD/2) clock = !clock;
    end

    // write to VCD
    initial begin
		$dumpfile("dance.vcd");
		$dumpvars;
        $display("----------------------------------------");
	end

    initial begin
        @(reset_enable);
        $display("Resetting DUT");

        err_cnt = 0;
        clock   = 0;
        reset   = 1;

        #15 reset = 0;
        @(posedge clock);

        $display("Reset complete");
        -> reset_done;
    end

    // main test routine
    initial begin
        -> reset_enable;
        @(reset_done);

        for (i = 0; i < 8; i++) begin
            @(posedge clock);
            if (led !== test_data[i]) begin
                err_cnt++;
                $display("[%dns] Expected %b, got %b", $time, test_data[i],
                         led);
            end
        end
        -> terminate;
    end

    // end simulation
    initial begin
        @(terminate);
        $display("Simulation complete!");
        $display("%0d errors", err_cnt);
        $display("----------------------------------------");
        $finish;
    end

endmodule
