module top(
    input [7:0]sw,
    output [5:0]led
);

    light light_isnt (
        .downstairs(sw[0]),
        .upstairs(sw[1]),
        .stair_light(led[0])
    
    );

    
    adder adder_inst (
        .A(sw[2]),
        .B(sw[3]),
        .Y(led[1]),
        .Carry(led[2])
    );
    
    wire carryLSB;
     
    full_adder full_adder_inst (
        .A(sw[4]), // LSB A
        .B(sw[6]), // LSB B
        .Cin(0),
        .Y(led[3]), // LSB of two bit sum
        .Cout(carryLSB)
    );
    
    full_adder full_adder_inst2 (
        .A(sw[5]), // MSB A
        .B(sw[7]), // MSB B
        .Cin(carryLSB), // Carry in from the other problem
        .Y(led[4]), // MSB of two bit sum
        .Cout(led[5]) // Cout is third digit
        
    );
    
endmodule

