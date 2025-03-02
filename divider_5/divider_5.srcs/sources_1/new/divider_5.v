module divider_5(
    input wire sys_clk,
    input wire sys_rst_n,

    // output wire clk_out
    output reg clk_flag
    );

    reg [2:0] cnt = 3'd0;
    // reg clk1;
    // reg clk2;

    always@(posedge sys_clk or negedge sys_rst_n)
begin
    if(!sys_rst_n)
        cnt<=3'd0;
    else if(cnt==3'd4)
        cnt<=3'd0;
    else
        cnt <= cnt+3'd1;
end

    always@(posedge sys_clk or negedge sys_rst_n)
begin
    if(!sys_rst_n)
        clk_flag<=3'd0;
    else if(cnt==3'd3)
        clk_flag<= 1'd1;
    else
        clk_flag <= 1'd0;
end

// always @(posedge sys_clk or negedge sys_rst_n) begin
//     if(!sys_rst_n)
//         clk1<=0;
//     else if(cnt==3'd2)
//         clk1 <= 1'b1;
//     else if(cnt==3'd4)
//         clk1 <= 1'b0;
//     else 
//         clk1 <= clk1;
// end
// always @(negedge sys_clk or negedge sys_rst_n) begin
//     if(!sys_rst_n)
//         clk2<=0;
//     else if(cnt==3'd2)
//         clk2 <= 1'b1;
//     else if(cnt==3'd4)
//         clk2 <= 1'b0;
//     else 
//         clk2 <= clk2;
// end

// assign clk_out = (clk1|clk2);

endmodule
