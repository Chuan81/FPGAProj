`timescale 1ns / 1ns

module divider_5_tb(

    );

    reg sys_clk;
    reg sys_rst_n;
    // wire clk_out;
    wire clk_flag;

    initial
    begin
        sys_clk<=1'd1;
        sys_rst_n<=1'd0;
    end

    always #10 sys_clk <= ~sys_clk;
    always #10000 sys_rst_n <= ~sys_rst_n;

    divider_5 divider_5_0(
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),

    // .clk_out(clk_out)
    .clk_flag(clk_flag)
    );
endmodule
