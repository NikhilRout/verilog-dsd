module reversible_full_adder (
    input a, b, cin,
    output sum, cout,
    output [3:0] out_vec
);
    wire garb0, garb1;
    wire ngQ, ngR;
    wire tgP, tgQ;
    newgate NG(.A(a), .B(b), .C(1'b0), .P(garb0), .Q(ngQ), .R(ngR));
    toffoli TG(.A(ngR), .B(cin), .C(ngQ), .P(tgP), .Q(tgQ), .R(cout));
    feynman FG(.A(tgP), .B(tgQ), .P(garb1), .Q(sum));
    assign out_vec = {garb0, garb1, sum, cout};
endmodule

module feynman (
    input A, B,
    output P, Q
);
    assign P = A;
    xor sxorf(Q, A, B);    
endmodule

module toffoli (
    input A, B, C,
    output P, Q, R
);
    wire AandB;
    assign P = A;
    assign Q = B;
    and sandt(AandB, A, B);
    xor sxort(R, AandB, C);
endmodule

module newgate (
    input A, B, C,
    output P, Q, R
);
    wire AandBn, invA, invB, invC, invAandinvC;
    assign P = A;
    //generating Q
    and sandn(AandBn, A, B);
    xor sxorn(Q, AandBn, C);
    //generating R
    not snotA(invA, A);
    not snotB(invB, B);
    not snotC(invC, C);
    and sandi(invAandinvC, invA, invC);
    xor sxori(R, invAandinvC, invB);
endmodule
