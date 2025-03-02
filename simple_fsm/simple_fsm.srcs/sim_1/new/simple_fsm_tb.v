`timescale 1ns / 1ns

module simple_fsm_tb(

    );

    reg sys_clk,sys_rst_n,pi_money;

    wire po_cola;

    initial begin
        sys_clk<=1'b1;
        sys_rst_n<=1'b0;
        #20 sys_rst_n<=1'b1;
    end

    always#10 sys_clk=~sys_clk;

    always@(posedge sys_clk or negedge sys_rst_n)begin
        if(!sys_rst_n)
            pi_money<=1'b0;
        else
            pi_money<=($random)%2;
    end

    simple_fsm simple_fsm0(
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    .pi_money(pi_money),

    .po_cola(po_cola)
    );

endmodule
