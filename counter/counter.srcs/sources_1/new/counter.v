
module counter
    #(
        parameter CNT_MAX = 25'd24_999_999
    )
    (
    input wire sys_clk,
    input wire sys_rst_n,
    
    output reg led_out
    );

    reg[24:0]cnt;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            cnt <=25'd0;
        else if(cnt==CNT_MAX)
            begin
                cnt<=25'd0;
            end
        else
            cnt<= cnt+25'd1;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            led_out<=1'b0;
        else if(cnt==CNT_MAX)
            begin
                led_out <= ~led_out; 
            end
        else
            led_out <= led_out;
    end

endmodule
