module switch_not (
    output out,
    input in
);
    supply1 vdd;
    supply0 gnd;

    pmos (out, vdd, in);
    nmos (out, gnd, in);
endmodule

module switch_nand (
    output out,
    input in1, in2
);
    supply1 vdd;
    supply0 gnd;

    pmos (out, vdd, in1);
    pmos (out, vdd, in2);

    wire n1;
    nmos (out, n1,  in1);
    nmos (n1,  gnd, in2);
endmodule

module switch_nor (
    output out,
    input in1, in2
);
    supply1 vdd;
    supply0 gnd;

    wire p1;
    pmos (p1, vdd, in1);
    pmos (out, p1, in2);

    nmos (out, gnd, in1);
    nmos (out, gnd, in2);
endmodule

module switch_and (
    output out,
    input in1, in2
);
    supply1 vdd;
    supply0 gnd; 
    wire nand_out;

    //NAND stage
    pmos (nand_out, vdd, in1);
    pmos (nand_out, vdd, in2);
    wire n1;
    nmos (nand_out, n1,  in1);
    nmos (n1,  gnd, in2);
    
    // Inverter stage
    pmos (out, vdd, nand_out);
    nmos (out, gnd, nand_out);
endmodule


module switch_or (
    output out,
    input in1, in2
);
    supply1 vdd;
    supply0 gnd;
    wire nor_out;
    
    // NOR stage
    wire p1;
    pmos (p1, vdd, in1);
    pmos (nor_out, p1, in2);
    nmos (nor_out, gnd, in1);
    nmos (nor_out, gnd, in2);
    
    // Inverter stage
    pmos (out, vdd, nor_out);
    nmos (out, gnd, nor_out);
endmodule

module switch_xor (
    output out,
    input in1, in2
);
    supply1 vdd;
    supply0 gnd;
    
    // Inverted inputs
    wire inv1, inv2;
    pmos (inv1, vdd, in1);
    nmos (inv1, gnd, in1);
    pmos (inv2, vdd, in2);
    nmos (inv2, gnd, in2);
    
    // Pull-up network
    wire p1, p2;
    pmos (p1, vdd, in1);
    pmos (out, p1, inv2);
    pmos (p2, vdd, inv1);
    pmos (out, p2, in2);
    // Pull-down network
    wire n1, n2;
    nmos (out, n1, in1);
    nmos (n1, gnd, in2);
    nmos (out, n2, inv1);
    nmos (n2, gnd, inv2);
endmodule

module switch_xnor (
    output out,
    input in1, in2
);
    supply1 vdd;
    supply0 gnd;
    wire xor_out;

    //XOR Stage
    // Inverted inputs
    wire inv1, inv2;
    pmos (inv1, vdd, in1);
    nmos (inv1, gnd, in1);
    pmos (inv2, vdd, in2);
    nmos (inv2, gnd, in2);
    // Pull-up network
    wire p1, p2;
    pmos (p1, vdd, in1);
    pmos (xor_out, p1, inv2);
    pmos (p2, vdd, inv1);
    pmos (xor_out, p2, in2);
    // Pull-down network
    wire n1, n2;
    nmos (xor_out, n1, in1);
    nmos (n1, gnd, in2);
    nmos (xor_out, n2, inv1);
    nmos (n2, gnd, inv2);

    //Inverter Stage
    pmos (out, vdd, xor_out);
    nmos (out, gnd, xor_out);
endmodule
