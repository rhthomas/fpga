module counter (
    input clk_in,
    output wire [4:0] value
);

    reg [26:0] counter;

    always @(posedge clk_in)
        counter <= counter + 1;

    assign value = counter[26:22];

endmodule



module top (
    input CLK,
    output wire [4:0] LED
);

    counter c (
        .clk_in(CLK),
        .value(LED)
    );

endmodule
