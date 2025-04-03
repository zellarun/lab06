module twos_compliment(
    input [7:0] A,
    output [7:0] Y
);

//Stores The Intermediary Sum (A+B)
wire [7:0] APlusB;

//The Carry Used For A+B. Will Need To Scale
//Up In Higher Order Addition
wire [7:0] carry;
wire [7:0] second_carry;

//First Addition
full_adder first_bit(
    .A(~A[0]),
    .B(1'b1),
    .Y(APlusB[0]),
    .Cin(1'b0),
    .Cout(carry[0])
);

full_adder second_bit(
    .A(~A[1]),
    .B(1'b0),
    .Y(APlusB[1]),
    .Cin(carry[0]),
    .Cout(carry[1])
);

full_adder third_bit(
    .A(~A[2]),
    .B(1'b0),
    .Y(APlusB[2]),
    .Cin(carry[1]),
    .Cout(carry[2])
);

full_adder fourth_bit(
    .A(~A[3]),
    .B(1'b0),
    .Y(APlusB[3]),
    .Cin(carry[2]),
    .Cout(carry[3])
);

full_adder fifth_bit(
    .A(~A[4]),
    .B(1'b0),
    .Y(APlusB[4]),
    .Cin(carry[3]),
    .Cout(carry[4])
);

full_adder sixth_bit(
    .A(~A[5]),
    .B(1'b0),
    .Y(APlusB[5]),
    .Cin(carry[4]),
    .Cout(carry[5])
);

full_adder seventh_bit(
    .A(~A[6]),
    .B(1'b0),
    .Y(APlusB[6]),
    .Cin(carry[5]),
    .Cout(carry[6])
);

full_adder eighth_bit(
    .A(~A[7]),
    .B(1'b0),
    .Y(APlusB[7]),
    .Cin(carry[6])
);

//Second Addition Of Bits
full_adder first_outerbit(
    .A(APlusB[0]),
    .B(1'b0),
    .Y(Y[0]),
    .Cin(carry[3]),
    .Cout(second_carry[0])
);

full_adder second_outerbit(
    .A(APlusB[1]),
    .B(1'b0),
    .Y(Y[1]),
    .Cin(second_carry[0]),
    .Cout(second_carry[1])
);

full_adder third_outerbit(
    .A(APlusB[2]),
    .B(1'b0),
    .Y(Y[2]),
    .Cin(second_carry[1]),
    .Cout(second_carry[2])
);

full_adder fourth_outerbit(
    .A(APlusB[3]),
    .B(1'b0),
    .Y(Y[3]),
    .Cin(second_carry[2]),
    .Cout(second_carry[3])
);

full_adder fifth_outerbit(
    .A(APlusB[4]),
    .B(1'b0),
    .Y(Y[4]),
    .Cin(carry[3]),
    .Cout(second_carry[4])
);

full_adder sixth_outerbit(
    .A(APlusB[5]),
    .B(1'b0),
    .Y(Y[5]),
    .Cin(second_carry[4]),
    .Cout(second_carry[5])
);

full_adder seventh_outerbit(
    .A(APlusB[6]),
    .B(1'b0),
    .Y(Y[6]),
    .Cin(second_carry[5]),
    .Cout(second_carry[6])
);

full_adder eighth_outerbit(
    .A(APlusB[7]),
    .B(1'b0),
    .Y(Y[7]),
    .Cin(second_carry[6])
);

endmodule