module smart_energy_meter (
    input        clk,
    input        reset,
    input        load_enable,

    output reg [15:0] energy_units,
    output reg [15:0] power_watts,
    output reg        overload
);

    // Energy meter simulation
    // Each enabled clock cycle represents one
    // measurement interval.

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            energy_units <= 16'd0;
            power_watts  <= 16'd0;
            overload     <= 1'b0;
        end

        else if (load_enable) begin

            // Simulated power consumption
            power_watts <= 16'd100;

            // Accumulate energy units
            energy_units <= energy_units + 16'd1;

            // Overload detection
            if (power_watts > 16'd500)
                overload <= 1'b1;
            else
                overload <= 1'b0;

        end

        else begin
            power_watts <= 16'd0;
            overload    <= 1'b0;
        end

    end

endmodule