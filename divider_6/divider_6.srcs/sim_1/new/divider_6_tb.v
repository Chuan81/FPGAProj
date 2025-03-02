`timescale 1ns / 1ns

module divider_6_tb(

    );

    reg sys_clk;
    reg sys_rst_n;
    wire clk_flag;

    initial
    begin
        sys_clk<=1'd1;
        sys_rst_n<=1'd0;
    end

    always #10 sys_clk <= ~sys_clk;
    always #10000 sys_rst_n <= ~sys_rst_n;

    divider_6 #(.MAX_CNT(6-1)) divider_6_0(
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),

    .clk_flag(clk_flag)
    );
endmodule
