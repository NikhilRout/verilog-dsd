# verilog-dsd
Verilog code for fundamental combinational and sequential circuits (with testbenches)

## About
Starting out with Verilog during my first digital systems design class, I couldn't find a comprehensive Verilog guide with multiple examples all in one resource. So I decided to create this reference repository consolidating all my Verilog code as I progressed in class and my own study. It includes the dataflow, structural, and behavioral modeling of Verilog code for a broad range of fundamental combinational and sequential circuits, complete with corresponding testbenches

## Projects (Combinational)
### Adders and Subtractors
1. Half Adder
2. Full Adder
3. Half Subtractor
4. Full Subtractor
5. 4-bit Ripple Carry Adder, n-Bit
6. Combined Parallel Adder/Subtractor
7. Carry Look-Ahead Adder
### Decoders/Encoders
1. Decoder 2:4
2. Decoder 3:8
3. Encoder 4:2
4. Encoder Octal:Binary
6. Priority Encoder (4:2)
### Multiplexers/Demultiplexers
1. Multiplexers
2. Demultiplexers
### Parity Gen/Check
1. Parity Generator
2. Parity Checker
### Multipliers
1. Array Multiplier
2. Booth Multiplier
### Misc
1. Basic Gates
2. Magnitude Comparator

## Projects (Sequential)
### Latches
1. SR Latch
2. D Latch
### Flip-Flops
1. SR Flip-FLop
2. D Flip-Flop
3. JK Flip-Flop
4. T Flip-Flop
### Registers
1. SISO
2. SIPO
3. PISO
4. PIPO
### Counters
1. Asynchronous Counter
2. Synchronous Counter
3. Ring Counter
4. Johnson Counter

## Random Notes
### Choosing modeling style
• Boolean Expression &rarr; Dataflow\
• Logic Diagram &rarr; Structural\
• Truth Table &rarr; Behavioral
### EDAPlayground Settings
[EDAPlayground](http://www.edaplayground.com) is an application that includes an online IDE to simulate Verilog programs and a community project hub
• Compiler: Icarus Verilog 0.9.7  
• To open EPWave after run, include the lines ```$dumpfile("dump.vcd"); $dumpvars;``` at the start of the testbenches' inital block
### Errors/Updates/Contact
