`timescale 1ns/1ps

module tb_smart_energy_meter;

    reg clk;
    reg reset;
    reg load_enable;

    wire [15:0] energy_units;
    wire [15:0] power_watts;
    wire overload;

    // Instantiate the Smart Energy Meter
    smart_energy_meter uut (
        .clk(clk),
        .reset(reset),
        .load_enable(load_enable),
        .energy_units(energy_units),
        .power_watts(power_watts),
        .overload(overload)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Create VCD waveform
        $dumpfile("smart_energy_meter.vcd");
        $dumpvars(0, tb_smart_energy_meter);

        $display("================================================");
        $display("          SMART ENERGY METER");
        $display("================================================");
        $display("Time\tLoad\tPower(W)\tEnergy Units\tOverload");
        $display("------------------------------------------------");

        // Initial values
        clk = 1'b0;
        reset = 1'b1;
        load_enable = 1'b0;

        #10;

        // Release reset
        reset = 1'b0;

        // Test 1
        load_enable = 1'b1;
        #10;

        $display("%0t\tON\t%d\t\t%d\t\tOFF",
                 $time, power_watts, energy_units);

        // Test 2
        #10;

        $display("%0t\tON\t%d\t\t%d\t\tOFF",
                 $time, power_watts, energy_units);

        // Test 3
        #10;

        $display("%0t\tON\t%d\t\t%d\t\tOFF",
                 $time, power_watts, energy_units);

        // Turn load OFF
        load_enable = 1'b0;
        #10;

        $display("%0t\tOFF\t%d\t\t%d\t\tOFF",
                 $time, power_watts, energy_units);

        // Turn load ON again
        load_enable = 1'b1;
        #10;

        $display("%0t\tON\t%d\t\t%d\t\tOFF",
                 $time, power_watts, energy_units);

        $display("------------------------------------------------");
        $display("Simulation Completed Successfully");
        $display("================================================");

        #10;
        $finish;

    end

endmodule