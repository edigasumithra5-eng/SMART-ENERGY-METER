# Smart Energy Meter Using Verilog

## 📌 Project Description

The Smart Energy Meter is a digital energy-monitoring system designed using Verilog HDL.

The system monitors a simulated electrical load and keeps track of energy consumption.

It provides:

- Power consumption measurement
- Energy-unit accumulation
- Load monitoring
- Overload detection
- Simulation waveform generation

The project can be edited and simulated using Visual Studio Code with Icarus Verilog.

---

## 🎯 Objectives

1. Design a basic smart energy meter using Verilog.
2. Measure simulated power consumption.
3. Accumulate energy consumption.
4. Detect overload conditions.
5. Verify the design using a testbench.
6. Generate simulation waveforms.

---

## 🔧 Tools Required

- Visual Studio Code
- Icarus Verilog
- GTKWave
- Git
- GitHub

Icarus Verilog supports compiling Verilog HDL, and its simulation flow uses the design together with a testbench. 

---

## 📥 Inputs

### clk

System clock signal.

### reset

Resets the energy meter.

### load_enable

Controls whether the electrical load is active.

```text
0 = Load OFF
1 = Load ON