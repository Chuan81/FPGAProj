`timescale 1ns / 1ns

module flip_flop_tb(

    );

reg sys_rst_n,sys_clk,key_in;
wire led_out;

initial
    begin
        sys_clk = 1'b1;
        sys_rst_n <= 1'b0;
        key_in <= 1'b0;
        #20
        sys_rst_n <= 1'b1;
        #210
        sys_rst_n <= 1'b0;
        #40
        sys_rst_n <= 1'b1;
    end

always #10 sys_clk = ~sys_clk;

always #20 key_in <= ($random) % 2;

flip_flop flip_flop0(
    .sys_rst_n(sys_rst_n),
    .sys_clk(sys_clk),
    .led_out(led_out),
    .key_in(key_in)
);

endmodule
