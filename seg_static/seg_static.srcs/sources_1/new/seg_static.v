module seg_static
#(
    parameter CNTMAX_500ms = 25'd24_999_999
)
(
    input wire sys_clk,
    input wire sys_rst_n,

    output reg [7:0] seg,
    output reg [0:5] sel
);
    reg [7:0]seg_init[0:15];
    initial begin
        seg_init[0]    =8'hc0;//0
        seg_init[1]    =8'hf9;//1
        seg_init[2]    =8'ha4;//2
        seg_init[3]    =8'hb0;//3
        seg_init[4]    =8'h99;//4
        seg_init[5]    =8'h92;//5
        seg_init[6]    =8'h82;//6
        seg_init[7]    =8'hf8;//7
        seg_init[8]    =8'h80;//8
        seg_init[9]    =8'h90;//9
        seg_init[10]    =8'h88;//A
        seg_init[11]    =8'h83;//B
        seg_init[12]    =8'hc6;//C
        seg_init[13]    =8'ha1;//D
        seg_init[14]    =8'h86;//E
        seg_init[15]    =8'h8e;//F
    end
    reg[24:0] cnt;
    reg[4:0] flag;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            cnt<=0;
        else if(cnt==CNTMAX_500ms)
            cnt<=0;
        else
            cnt<=cnt+1'b1;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            flag<=0;
        else if(flag==4'd15&&cnt==CNTMAX_500ms-1)
            flag<=0;
        else if(cnt==CNTMAX_500ms-1)
            flag<=flag+1'b1;
        else
            flag<=flag;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            sel<=6'b1;
        else
            sel<={sel[1:5],sel[0]};
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            seg<=seg_init[0];
        else if(cnt==CNTMAX_500ms)
            seg<=seg_init[flag];
        else
            seg<=seg;
    end

endmodule
