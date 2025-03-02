`timescale 1ns/1ns

module decoder_2_4_tb;

    reg a;
    reg b;
    wire [3:0]out;

    decoder_2_4 decoder_2_4(
        .a(a),
        .b(b),
        .out(out)
    );

    initial begin
        a=0;b=0;
        #200;
        a=0;b=1;
        #200;
        a=1;b=0;
        #200;
        a=1;b=1;
        #200;
        $stop;
    end

endmodule