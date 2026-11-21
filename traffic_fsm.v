module traffic_fsm (
    input  wire clk,
    input  wire reset,
    input  wire one_sec_tick,
    input  wire emergency_a,
    input  wire emergency_b,

    output reg a_red,
    output reg a_yellow,
    output reg a_green,

    output reg b_red,
    output reg b_yellow,
    output reg b_green
);

    // Traffic signal states
    localparam A_GREEN          = 3'd0;
    localparam A_YELLOW         = 3'd1;
    localparam ALL_RED_1        = 3'd2;
    localparam B_GREEN          = 3'd3;
    localparam B_YELLOW         = 3'd4;
    localparam ALL_RED_2        = 3'd5;
    localparam A_EMERGENCY      = 3'd6;
    localparam B_EMERGENCY      = 3'd7;

    reg [2:0] state;
    reg [3:0] timer;

    // State register and timer
    always @(posedge clk) begin
        if (reset) begin
            state <= A_GREEN;
            timer <= 4'd0;
        end
        else begin

            // Emergency A
            if (emergency_a && !emergency_b) begin
                state <= A_EMERGENCY;
                timer <= 4'd0;
            end

            // Emergency B
            else if (emergency_b && !emergency_a) begin
                state <= B_EMERGENCY;
                timer <= 4'd0;
            end

            // Normal operation
            else if (one_sec_tick) begin

                case (state)

                    A_GREEN: begin
                        if (timer == 4'd9) begin
                            state <= A_YELLOW;
                            timer <= 4'd0;
                        end
                        else begin
                            timer <= timer + 1'b1;
                        end
                    end

                    A_YELLOW: begin
                        if (timer == 4'd2) begin
                            state <= ALL_RED_1;
                            timer <= 4'd0;
                        end
                        else begin
                            timer <= timer + 1'b1;
                        end
                    end

                    ALL_RED_1: begin
                        if (timer == 4'd1) begin
                            state <= B_GREEN;
                            timer <= 4'd0;
                        end
                        else begin
                            timer <= timer + 1'b1;
                        end
                    end

                    B_GREEN: begin
                        if (timer == 4'd9) begin
                            state <= B_YELLOW;
                            timer <= 4'd0;
                        end
                        else begin
                            timer <= timer + 1'b1;
                        end
                    end

                    B_YELLOW: begin
                        if (timer == 4'd2) begin
                            state <= ALL_RED_2;
                            timer <= 4'd0;
                        end
                        else begin
                            timer <= timer + 1'b1;
                        end
                    end

                    ALL_RED_2: begin
                        if (timer == 4'd1) begin
                            state <= A_GREEN;
                            timer <= 4'd0;
                        end
                        else begin
                            timer <= timer + 1'b1;
                        end
                    end

                 A_EMERGENCY: begin
    if (emergency_a) begin
        state <= A_EMERGENCY;
        timer <= 4'd0;
    end
    else begin
        state <= ALL_RED_1;
        timer <= 4'd0;
    end
end

B_EMERGENCY: begin
    if (emergency_b) begin
        state <= B_EMERGENCY;
        timer <= 4'd0;
    end
    else begin
        state <= ALL_RED_2;
        timer <= 4'd0;
    end
end

                    default: begin
                        state <= A_GREEN;
                        timer <= 4'd0;
                    end

                endcase
            end
        end
    end

    // Output logic
    always @(*) begin

        // Default: all signals OFF
        a_red    = 1'b0;
        a_yellow = 1'b0;
        a_green  = 1'b0;

        b_red    = 1'b0;
        b_yellow = 1'b0;
        b_green  = 1'b0;

        case (state)

            A_GREEN: begin
                a_green = 1'b1;
                b_red   = 1'b1;
            end

            A_YELLOW: begin
                a_yellow = 1'b1;
                b_red    = 1'b1;
            end

            ALL_RED_1,
            ALL_RED_2: begin
                a_red = 1'b1;
                b_red = 1'b1;
            end

            B_GREEN: begin
                a_red   = 1'b1;
                b_green = 1'b1;
            end

            B_YELLOW: begin
                a_red    = 1'b1;
                b_yellow = 1'b1;
            end

            A_EMERGENCY: begin
                a_green = 1'b1;
                b_red   = 1'b1;
            end

            B_EMERGENCY: begin
                a_red   = 1'b1;
                b_green = 1'b1;
            end

            default: begin
                a_red = 1'b1;
                b_red = 1'b1;
            end

        endcase
    end

endmodule