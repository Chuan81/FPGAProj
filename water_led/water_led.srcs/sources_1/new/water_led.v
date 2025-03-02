module water_led#(parameter MAXT = 28'd24_999_999)(
    input sys_clk,
    input sys_rst_n,
    
    output reg [3:0]led_out
    );

    reg[27:0] t_cnt;
    reg[1:0] l_move;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            t_cnt<=28'd0;
        else if(t_cnt==MAXT)
            t_cnt<=28'd0;
        else
            t_cnt<=t_cnt+1'd1;
    end

    always  @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            l_move<=0;
        else if(t_cnt==MAXT-1)
            l_move<=l_move+1;
        else
            l_move<=l_move;
    end

    always  @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            led_out<=0;
        else
            led_out<=(4'd1<<<l_move);
    end

endmodule
