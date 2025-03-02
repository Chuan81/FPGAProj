`timescale 1ns / 1ns
module complex_fsm_tb(

    );

    reg sys_clk,sys_rst_n,pi_money_half,pi_money_one;
    reg random_data;

    wire po_cola,po_money;

    initial begin
        sys_clk<=1;
        sys_rst_n<=0;
        #20 sys_rst_n<=1;
    end

    always#10 sys_clk=~sys_clk;

    always@(posedge sys_clk or negedge sys_rst_n)
    begin
        if(!sys_rst_n)
            random_data=0;
        else
            random_data=($random)%2;
    end

    always@(posedge sys_clk or negedge sys_rst_n)
    begin
        if(!sys_rst_n)
            pi_money_one=0;
        else
            pi_money_one=random_data;
    end

    always@(posedge sys_clk or negedge sys_rst_n)
    begin
        if(!sys_rst_n)
            pi_money_half=0;
        else
            pi_money_half=~random_data;
    end

    complex_fsm complex_fsm0(
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    .pi_money_half(pi_money_half),
    .pi_money_one(pi_money_one),

    .po_cola(po_cola),
    .po_money(po_money)
    );

endmodule
