module switch_gates_tb;
    reg a, b;
    wire not_out, nand_out, nor_out, and_out, or_out, xor_out, xnor_out;
    
    switch_not not0(not_out, a);
    switch_nand nand0(nand_out, a, b);
    switch_nor nor0(nor_out, a, b);
    switch_and and0(and_out, a, b);
    switch_or or0(or_out, a, b);
    switch_xor xor0(xor_out, a, b);
    switch_xnor xnor0(xnor_out, a, b);
    
    initial begin
        $monitor("Time=%0t a=%b b=%b not=%b nand=%b nor=%b and=%b or=%b xor=%b xnor-%b",
            $time, a, b, not_out, nand_out, nor_out, and_out, or_out, xor_out, xnor_out);
        a = 0; b = 0;
        #100  a = 0; b = 1;
        #100  a = 1; b = 0;
        #100  a = 1; b = 1;
        #100
        $stop;
    end
endmodule
