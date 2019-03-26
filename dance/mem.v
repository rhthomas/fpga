module mem (
    input clock,
    input [3:0] addr,
    output reg [4:0] num
);

    reg [4:0] memory [0:8];

    initial begin
        $readmemb("prog.hex", memory);
    end

    always @(posedge clock) begin
        num <= memory[addr];
    end

endmodule
