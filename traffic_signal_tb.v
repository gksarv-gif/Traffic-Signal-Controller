`timescale 1ns / 1ps

module traffic_signal_tb;

    // Testbench signals
    reg clk;
    reg reset;
    reg emergency_a;
    reg emergency_b;

    // Outputs from DUT
    wire a_red;
    wire a_yellow;
    wire a_green;

    wire b_red;
    wire b_yellow;
    wire b_green;

    // Instantiate the design under test
    traffic_signal_top dut (
        .clk(clk),
        .reset(reset),
        .emergency_a(emergency_a),
        .emergency_b(emergency_b),

        .a_red(a_red),
        .a_yellow(a_yellow),
        .a_green(a_green),

        .b_red(b_red),
        .b_yellow(b_yellow),
        .b_green(b_green)
    );

    // For simulation only:
    // Make 10 clock cycles represent approximately 1 second.
    defparam dut.u_clock_divider.COUNT_MAX = 9;

    // Generate clock
    initial begin
        clk = 1'b0;

        forever #5 clk = ~clk;
    end

    // Test sequence
   initial begin

    // Initial conditions
    reset = 1'b1;
    emergency_a = 1'b0;
    emergency_b = 1'b0;

    // Reset
    #20;

    // Start normal operation
    reset = 1'b0;

    // Normal operation
    #1200;

    // Emergency vehicle on Road A
    emergency_a = 1'b1;
    #200;

    // Emergency A leaves
    emergency_a = 1'b0;
    #300;

    // Emergency vehicle on Road B
    emergency_b = 1'b1;
    #200;

    // Emergency B leaves
    emergency_b = 1'b0;
    #1200;

    // Finish simulation
    $finish;

end

endmodule