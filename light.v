module light(
    input upstairs , downstairs , // Upstairs is U, downstairs is D
    output stair_light
);

    assign stair_light = upstairs  ^ downstairs;

endmodule