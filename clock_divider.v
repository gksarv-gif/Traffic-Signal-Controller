module clock_divider (
    input  wire clk,
    input  wire reset,
    output reg  one_sec_tick
);

    // AC701 FPGA clock = 200 MHz
    parameter integer COUNT_MAX = 200_000_000 - 1;

    reg [27:0] count;

    always @(posedge clk) begin
        if (reset) begin
            count        <= 28'd0;
            one_sec_tick <= 1'b0;
        end
        else begin
            if (count == COUNT_MAX) begin
                count        <= 28'd0;
                one_sec_tick <= 1'b1;
            end
            else begin
                count        <= count + 1'b1;
                one_sec_tick <= 1'b0;
            end
        end
    end

endmodule