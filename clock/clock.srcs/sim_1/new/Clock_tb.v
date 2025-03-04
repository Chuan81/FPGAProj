`timescale 1ns / 1ns

module Clock_tb(

    );

reg CLR;
reg CLK;
reg PAUSE;

wire [3:0]MSH;
wire [3:0]MSL;
wire [3:0]SH;
wire [3:0]SL;
wire [3:0]MH;
wire [3:0]ML;

initial begin
    PAUSE<=1'b0;
    CLK<=1'd1;
    CLR<=1'd0;
    #20 CLR<=1'd1;
end

always #10 CLK<=~CLK;

always #1234567 PAUSE <=($random)%2;

Clock Clock_init(
    .CLR(CLR),
    .CLK(CLK),
    .PAUSE(PAUSE),

    .MSH(MSH),
    .MSL(MSL),

    .SH(SH),
    .SL(SL),

    .MH(MH),
    .ML(ML)
    );

endmodule
