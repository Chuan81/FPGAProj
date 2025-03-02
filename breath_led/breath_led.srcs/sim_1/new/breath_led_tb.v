`timescale 1ns / 1ns

module breath_led_tb(

    );

    reg sys_clk;
    reg sys_rst_n;

    wire led_out;

    initial begin
        sys_clk=1'd1;
        sys_rst_n=1'd0;
        #10 sys_rst_n=1'd1;
    end

    always #10 sys_clk=~sys_clk;

    breath_led #(
    .MAXCNT_1us(6'd4),
    .MAXCNT_1ms(10'd9),
    .MAXCNT_1s(10'd9)
    )
    breath_led0
    (
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),

    .led_out(led_out)
    );
endmodule
