module key_filter #(parameter MAXCNT=20'd999_999) (
    input wire sys_clk,
    input wire sys_rst_n,
    input wire key_in,

    output reg key_flag
    );

    reg[19:0] cnt_20ms;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            cnt_20ms <= 20'd0;
        else if(key_in)
            cnt_20ms <= 20'd0;
        else if(cnt_20ms==MAXCNT)
            cnt_20ms <= cnt_20ms;
        else
            cnt_20ms <= cnt_20ms+20'd1;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            key_flag <= 0;
        else if(cnt_20ms==MAXCNT-1)
            key_flag <= 1;
        else
            key_flag <= 0;
    end
endmodule
