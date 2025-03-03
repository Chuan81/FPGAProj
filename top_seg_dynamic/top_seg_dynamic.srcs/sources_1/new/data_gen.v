`timescale  1ns/1ns
module data_gen
#(
    parameter CNTMAX = 23'd4_999_999,DATAMAX = 20'd999999
)
(
    input wire sys_clk,
    input wire sys_rst_n,

    output reg [19:0] data,
    output wire [5:0] point,
    output wire sign,
    output reg seg_en
    );

reg [22:0] cnt_100ms;
reg cnt_flag;

assign point=6'd0;
assign sign=1'd0;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt_100ms   <=  23'd0;
    else    if(cnt_100ms == CNTMAX)
        cnt_100ms   <=  23'd0;
    else
        cnt_100ms   <=  cnt_100ms + 1'b1;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt_flag    <=  1'b0;
    else    if(cnt_100ms == CNTMAX - 1'b1)
        cnt_flag    <=  1'b1;
    else
        cnt_flag    <=  1'b0;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        data <=20'd0;
    else if(data==DATAMAX&&cnt_flag==1'd1)
        data <=20'd0;
    else if(cnt_flag==1'd1)
        data<=data+1'd1;
    else
        data <= data;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        seg_en <=1'd0;
    else
        seg_en <= 1'd1;
end

endmodule
