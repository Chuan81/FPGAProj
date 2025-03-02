`timescale 1ns / 1ns

module counter_tb(

    );

    reg sys_clk,sys_rst_n;

    wire led_out;

    initial
        begin
            sys_clk = 1'b1;
            sys_rst_n <= 1'b0;
            #2000000
            sys_rst_n <= 1'b1;
            #12100000
            sys_rst_n <= 1'b0;
            #4000000
            sys_rst_n <= 1'b1;
        end

    
    always #10 sys_clk = ~sys_clk;

    counter
    #(
        .CNT_MAX(249999)
    )
    counter0
    (
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    
    .led_out(led_out)
    );


endmodule
