module elevator (
    input clk,
    input rst,
    input [2:0] req_floor,   // Requested floor (0 to 7)

    output reg [2:0] curr_floor, // Current floor
    output reg up,
    output reg down,
    output reg door
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            curr_floor <= 3'd0;   // Start at floor 0
            up <= 0;
            down <= 0;
            door <= 0;
        end

        else begin

            // If already at requested floor
            if (curr_floor == req_floor) begin
                up <= 0;
                down <= 0;
                door <= 1;    // Open door
            end

            // Move Up
            else if (curr_floor < req_floor) begin
                curr_floor <= curr_floor + 1;
                up <= 1;
                down <= 0;
                door <= 0;
            end

            // Move Down
            else if (curr_floor > req_floor) begin
                curr_floor <= curr_floor - 1;
                up <= 0;
                down <= 1;
                door <= 0;
            end

        end
    end

endmodule
