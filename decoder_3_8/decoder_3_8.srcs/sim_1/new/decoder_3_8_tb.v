`timescale 1ns/1ns

module decoder_3_8_tb;

    reg a;
    reg b;
    reg c;
    wire [7:0]out;

    decoder_3_8 decoder_3_8(
        .a(a),
        .b(b),
        .c(c),
        .out(out)
    );

    initial begin
        a=0;b=0;c=0;
        #200;
        a=0;b=0;c=1;
        #200;
        a=0;b=1;c=0;
        #200;
        a=0;b=1;c=1;
        #200;
        a=1;b=0;c=0;
        #200;
        a=1;b=0;c=1;
        #200;
        a=1;b=1;c=0;
        #200;
        a=1;b=1;c=1;
        #200;
        $stop;
    end

endmodule