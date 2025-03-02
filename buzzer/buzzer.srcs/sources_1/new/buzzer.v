module buzzer#(
    parameter CNTMAX_500ms = 25'd24_999_999,
              DO = 18'd190839,
              RE = 18'd170067,
              MI = 18'd151514,
              FA = 18'd143265,
              SO = 18'd127550,
              LA = 18'd113635,
              XI = 18'd101213
    )
    (
    input wire sys_clk,
    input wire sys_rst_n,

    output reg beep
    );

    reg [24:0] cnt;
    reg [2:0] cnt_500ms;
    reg [17:0] freq_cnt;
    reg [17:0] freq_data;
    wire [16:0] duty_data;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            cnt<=25'd0;
        else if(cnt==CNTMAX_500ms)
            cnt<=25'd0;
        else
            cnt<=cnt+1'b1;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            cnt_500ms<=3'd0;
        else if(cnt_500ms==3'd6&&cnt==CNTMAX_500ms)
            cnt_500ms<=3'd0;
        else if(cnt==CNTMAX_500ms)
            cnt_500ms<=cnt_500ms+1'b1;
        else
            cnt_500ms<=cnt_500ms;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            freq_cnt<=18'd0;
        else if(freq_cnt==freq_data||cnt==CNTMAX_500ms)
            freq_cnt<=18'd0;
        else
            freq_cnt<=freq_cnt+18'd1;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            freq_data <= DO;
        else case (cnt_500ms)
            3'd0:freq_data<=DO; 
            3'd1:freq_data<=RE;
            3'd2:freq_data<=MI;
            3'd3:freq_data<=FA;
            3'd4:freq_data<=SO;
            3'd5:freq_data<=LA;
            3'd6:freq_data<=XI;
            default: freq_data<=DO;
        endcase
    end

    assign duty_data = freq_data >> 1;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            beep <= 1'b0;
        else if(duty_data <= freq_cnt)
            beep <= 1'b1;
        else
            beep <= 1'b0;
    end

endmodule
