module traffic_signal_top (
    input  wire clk,
    input  wire reset,
    input  wire emergency_a,
    input  wire emergency_b,

    output wire a_red,
    output wire a_yellow,
    output wire a_green,

    output wire b_red,
    output wire b_yellow,
    output wire b_green
);

    // 1-second timing signal
    wire one_sec_tick;

    // Clock divider
    clock_divider u_clock_divider (
        .clk(clk),
        .reset(reset),
        .one_sec_tick(one_sec_tick)
    );

    // Traffic signal FSM
    traffic_fsm u_traffic_fsm (
        .clk(clk),
        .reset(reset),
        .one_sec_tick(one_sec_tick),
        .emergency_a(emergency_a),
        .emergency_b(emergency_b),

        .a_red(a_red),
        .a_yellow(a_yellow),
        .a_green(a_green),

        .b_red(b_red),
        .b_yellow(b_yellow),
        .b_green(b_green)
    );

endmodule