`timescale 1ns / 1ns

module water_led_tb(

    );

    reg sys_clk;
    reg sys_rst_n;

    wire [3:0] led_out;

    initial begin
        sys_clk <= 1'b1;
        sys_rst_n <= 0;
        #40
        sys_rst_n <= 1;
    end

    always #10 sys_clk=~sys_clk;

    water_led#(.MAXT(28'd24_99))water_led0(
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    
    .led_out(led_out)
    );
endmodule
