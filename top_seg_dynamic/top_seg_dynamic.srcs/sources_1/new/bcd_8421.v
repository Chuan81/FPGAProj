`timescale  1ns/1ns
module bcd_8421(
    input wire sys_clk,
    input wire sys_rst_n,
    input wire[19:0] data,
    
    output reg[3:0] unit,
    output reg[3:0] ten,
    output reg[3:0] hun,
    output reg[3:0] tho,
    output reg[3:0] t_tho,
    output reg[3:0] h_hun
    );

reg[4:0] cnt_shift;
reg[43:0] data_shift;
reg shift_flag;

always@(posedge sys_clk or negedge sys_rst_n)
begin
    if(!sys_rst_n)
        cnt_shift<=5'd0;
    else if(cnt_shift==5'd21&&shift_flag==1'b1)
        cnt_shift<=5'd0;
    else if(shift_flag==1'b1)
        cnt_shift<=cnt_shift+1;
    else
        cnt_shift<=cnt_shift; 
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        data_shift<=44'b0;
    else if(cnt_shift==5'd0)
        data_shift<={24'd0,data};
    else if(cnt_shift<=20&&shift_flag==1'b0)begin
        data_shift[23:20]<=(data_shift[23:20]>4)?(data_shift[23:20]+2'd3):(data_shift[23:20]);
        data_shift[27:24]<=(data_shift[27:24]>4)?(data_shift[27:24]+2'd3):(data_shift[27:24]);
        data_shift[31:28]<=(data_shift[31:28]>4)?(data_shift[31:28]+2'd3):(data_shift[31:28]);
        data_shift[35:32]<=(data_shift[35:32]>4)?(data_shift[35:32]+2'd3):(data_shift[35:32]);
        data_shift[39:36]<=(data_shift[39:36]>4)?(data_shift[39:36]+2'd3):(data_shift[39:36]);
        data_shift[43:40]<=(data_shift[43:40]>4)?(data_shift[43:40]+2'd3):(data_shift[43:40]);
    end
    else if(cnt_shift<=20&&shift_flag==1'b1)
        data_shift<=data_shift<<1;
    else
        data_shift<=data_shift;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        shift_flag<=1'b0;
    else
        shift_flag<=~shift_flag;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)begin
        unit<=4'd0;
        ten<=4'd0;
        hun<=4'd0;
        tho<=4'd0;
        t_tho<=4'd0;
        h_hun<=4'd0;
    end
    else if(cnt_shift == 5'd21)
    begin
        unit<=data_shift[23:20];
        ten<=data_shift[27:24];
        hun<=data_shift[31:28];
        tho<=data_shift[35:32];
        t_tho<=data_shift[39:36];
        h_hun<=data_shift[43:40];
    end
end
endmodule
