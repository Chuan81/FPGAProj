
module divider_6 #(parameter MAX_CNT = 5)(
    input sys_clk,
    input sys_rst_n,

    //output reg clk_out
    output reg clk_flag
    );

    reg [2:0] cnt = 3'd0;

// always@(posedge sys_clk or negedge sys_rst_n)
// begin
//     if(!sys_rst_n)
//         cnt<=3'd0;
//     else if(cnt==MAX_CNT)
//         cnt<=3'd0;
//     else
//         cnt <= cnt+1'd1;
// end

// always @(posedge sys_clk or negedge sys_rst_n) begin
//     if(!sys_rst_n)
//         clk_out<=0;
//     else if(cnt==MAX_CNT)
//         clk_out<= ~clk_out;
//     else
//         clk_out<= clk_out;
// end

always@(posedge sys_clk or negedge sys_rst_n)
begin
    if(!sys_rst_n)
        cnt<=3'd0;
    else if(cnt==MAX_CNT)
        cnt<=3'd0;
    else
        cnt <= cnt+3'd1;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        clk_flag<=0;
    else if(cnt==MAX_CNT-1)
        clk_flag <= 3'b1;
    else
        clk_flag <=3'b0;
end



endmodule
