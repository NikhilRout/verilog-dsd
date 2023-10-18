# verilog-dsd
Verilog code for basic combinational and sequential circuits (with testbenches)

## About
Starting out with Verilog during my digital systems design class, despite searching the web for hours, I couldn't find a comprehensive Verilog guide with multiple examples in one resource. So I decided to create this reference repository consolidating all my Verilog code as I progressed in class and my own study. It includes the dataflow, structural, and behavioral modeling of Verilog code for a broad spectrum of fundamental combinational and sequential circuits, complete with corresponding testbenches

## Projects (Combinational)
1. Basic Gates
2. Half Adder
3. Full Adder
4. Half Subtractor
5. Full Subtractor
6. 4-bit Ripple Carry Adder
7. Parallel Adder/Subtractor
8. Decoders
9. Encoders
10. Parity Generator
11. Parity Checker
12. Multiplexers
13. Demultiplexers
14. Array Multiplier
15. Booth Multiplier
16. Magnitude Comparator

## Projects (Sequential)
### Latches
1. SR Latch
2. D Latch
### Flip-Flops
4. SR Flip-FLop
5. D Flip-Flop
6. JK Flip-Flop
7. T Flip-Flop
### Registers
1. SISO
2. SIPO
3. PISO
4. PIPO

## Random Notes

### Choosing modeling style
• Boolean Expression &rarr; Dataflow\
• Logic Diagram &rarr; Structural\
• Truth Table &rarr; Behavioral

### EDAPlayground Settings
[EDAPlayground](http://www.edaplayground.com) is an application that includes a free online IDE and a community project hub I used to quickly test code and look for other's implementations of the same circuits\
• Compiler: Icarus Verilog 0.9.7  
• To open EPWave after run, include the lines ```verilog $dumpfile("dump.vcd"); $dumpvars;``` at the start of the testbenches' inital block

### Errors/Updates/Contact
