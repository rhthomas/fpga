module div #(parameter N = 22) (
    input clock, reset,
    output slow_clock
);

    reg [N-1:0] count;

	always @(posedge clock, posedge reset) begin
        if (reset) begin
            count <= 0;
        end
        else begin
            count <= count + 1;
        end
    end

	assign slow_clock = count[N-1];

endmodule
