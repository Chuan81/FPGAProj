module breath_led #(
    parameter MAXCNT_1us = 6'd49,
    parameter MAXCNT_1ms = 10'd999,
    parameter MAXCNT_1s = 10'd999
    )
    (
    input wire sys_clk,
    input wire sys_rst_n,

    output reg led_out
    );

    reg [9:0]cnt_1s;
    reg [9:0]cnt_1ms;
    reg [5:0]cnt_1us;
    reg cnt_en;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            cnt_1us<= 6'd0;
        else if(cnt_1us==MAXCNT_1us)
            cnt_1us <= 6'd0;
        else
            cnt_1us <= cnt_1us+6'b1;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            cnt_1ms<=10'd0;
        else if((cnt_1ms==MAXCNT_1ms)&&(cnt_1us==MAXCNT_1us))
            cnt_1ms <= 10'd0;
        else if(cnt_1us==MAXCNT_1us)
            cnt_1ms <= cnt_1ms+10'd1;
        else
            cnt_1ms <= cnt_1ms;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            cnt_1s<=10'd0;
        else if((cnt_1s==MAXCNT_1s)&&(cnt_1ms==MAXCNT_1ms)&&(cnt_1us==MAXCNT_1us))
            cnt_1s <= 10'd0;
        else if((cnt_1ms==MAXCNT_1ms)&&(cnt_1us==MAXCNT_1us))
            cnt_1s <= cnt_1s+10'd1;
        else
            cnt_1s <= cnt_1s;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            cnt_en<=1'b1;
        else if((cnt_1s==MAXCNT_1s)&&(cnt_1ms==MAXCNT_1ms)&&(cnt_1us==MAXCNT_1us))
            cnt_en <= ~cnt_en;
        else
            cnt_en <= cnt_en;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            led_out<=1'b0;
        else if(cnt_1ms<=cnt_1s)
            led_out<=cnt_en;
        else
            led_out<=(~cnt_en);
    end

endmodule
