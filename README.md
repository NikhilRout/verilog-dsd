# verilog-dsd
Verilog code for basic combinational and sequential circuits (with testbenches)

## About
Starting out with Verilog during my digital systems design class, despite searching the web for hours, I couldn't find a comprehensive Verilog guide with multiple examples in one resource. So I decided to create this reference repository consolidating all my Verilog code as I progressed in class and my own study. It includes the dataflow, structural, and behavioral modeling of Verilog code for a broad spectrum of fundamental combinational and sequential circuits, complete with corresponding testbenches

## Projects
1. Basic Gates
2. Half Adder
3. Full Adder
4. Half Subtractor
5. Full Subtractor
6. 4-bit Ripple Carry Adder
7. Decoders
8. Encoders
9. Parity Generator
10. Parity Checker
11. Multiplexers
12. Demultiplexers

## Random Notes

### Modeling style to use when you've got:
• Boolean Expression &rarr; Dataflow\
• Logic Diagram &rarr; Structural\
• Truth Table &rarr; Behavioral

### EDAPlayground Settings
[EDAPlayground](http://www.edaplayground.com) is a web application that includes a free online IDE and a community project hub I used to quickly test code and look for other's implementations of the same circuits\
• Compiler: Icarus Verilog 0.9.7  
• To open EPWave after run: include the lines ```$dumpfile("dump.vcd"); $dumpvars;``` at the start of the testbenches' inital block
### Errors/Updates/Contact
