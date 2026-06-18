module home_fsm(
    input logic clk,
    input logic rst,

    input logic motion_sensor,
    input logic temp_high,

    output logic [2:0] state
);

typedef enum logic [2:0] {
    IDLE       = 3'd0,
    OCCUPIED   = 3'd1,
    CLIMATE    = 3'd2,
    ENERGYSAVE = 3'd3
} state_t;

state_t current_state,next_state;

always_ff @(posedge clk or posedge rst)
begin
    if(rst)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

always_comb
begin

    next_state = current_state;

    case(current_state)

    IDLE:
        if(motion_sensor)
            next_state = OCCUPIED;

    OCCUPIED:
        if(temp_high)
            next_state = CLIMATE;
        else if(!motion_sensor)
            next_state = ENERGYSAVE;

    CLIMATE:
        if(!temp_high)
            next_state = OCCUPIED;

    ENERGYSAVE:
        if(motion_sensor)
            next_state = OCCUPIED;

    endcase
end

assign state = current_state;

endmodule