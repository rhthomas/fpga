module pc (
    input clock, reset,
    output reg [3:0] count
);

    always @(posedge clock, posedge reset) begin
        if (reset) begin
            count <= 0;
        end
        else begin
            count <= (count < 8) ? count + 1 : 0;
        end
    end

endmodule
