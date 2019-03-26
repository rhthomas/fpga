module top (
    input clock, reset,
    output [4:0] led
);

    wire slow_clock;
    wire [3:0] addr;

    `ifndef SIM
        div div (
            .clock (clock),
            .reset (reset),
            .slow_clock (slow_clock)
        );
    `endif

    pc pc (
        `ifdef SIM
            .clock (clock),
        `else
            .clock (slow_clock),
        `endif
        .reset (reset),
        .count (addr)
    );

    mem mem (
        `ifdef SIM
            .clock (clock),
        `else
            .clock (slow_clock),
        `endif
        .addr (addr),
        .num (led)
    );

endmodule
