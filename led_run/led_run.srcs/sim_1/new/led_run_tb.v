`timescale 1ns / 1ns

module led_run_tb;
    reg Clk;
    reg Reset_n;
    wire [7:0]Led;

    led_run led_run(
        .Clk(Clk),
        .Reset_n(Reset_n),
        .Led(Led)
    );

    defparam led_run.MCNT = 2500-1;

    initial Clk=1;
    always #1 Clk = ~Clk;

    initial begin
        Reset_n = 0;
        #201;
        Reset_n = 1;
        #40000000;
        $stop;
    end
endmodule
