`define SYNTH

module top (
    input clock, reset,
    output [4:0] led
);

    wire slow_clock;
    wire [3:0] addr;

    div div (
        .clock (clock),
        .reset (reset),
        .slow_clock (slow_clock)
    );

    pc pc (
        `ifdef SYNTH
            .clock (slow_clock),
        `else
            .clock (clock),
        `endif
        .reset (reset),
        .count (addr)
    );

    mem mem (
        `ifdef SYNTH
            .clock (slow_clock),
        `else
            .clock (clock),
        `endif
        .addr (addr),
        .num (led)
    );

endmodule
