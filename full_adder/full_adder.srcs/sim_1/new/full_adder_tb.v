`timescale 1ns / 1ns

module full_adder_tb(

    );

    reg in_1;
    reg in_2;
    reg cin ;

    wire sum;
    wire count;

    initial begin
        in_1<=1'b0;
        in_2<=1'b0;
        cin<=1'b0;
        
    end

    always #10 in_1<=($random)%2;
    always #10 in_2<=($random)%2;
    always #10 cin<=($random)%2;

    full_adder full_adder0(
    .cin(cin),
    .in_1(in_1),
    .in_2(in_2),
    .sum(sum),
    .count(count)
    );

endmodule
