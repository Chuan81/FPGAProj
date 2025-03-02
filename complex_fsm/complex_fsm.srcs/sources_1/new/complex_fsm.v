module complex_fsm(
    input wire sys_clk,
    input wire sys_rst_n,
    input wire pi_money_half,
    input wire pi_money_one,

    output reg po_cola,
    output reg po_money
    );

    parameter IDLE =5'b00001,HALF=5'b00010,ONE=5'b00100,ONE_HALF=5'b01000,TWO=5'b10000;

    wire[1:0]pi_money;
    reg [4:0]state;

    assign pi_money = {pi_money_one,pi_money_half};

    always@(posedge sys_clk or negedge sys_rst_n)
    begin
        if(!sys_rst_n)
            state<=IDLE;
        else
            case (state)
                IDLE:   if(pi_money_half)
                            state<=HALF;
                        else if(pi_money)
                            state<=ONE;
                        else
                            state<=IDLE;
                HALF:   if(pi_money_half)
                            state<=ONE;
                        else if(pi_money)
                            state<=ONE_HALF;
                        else
                            state<=HALF;
                ONE:   if(pi_money_half)
                            state<=ONE_HALF;
                        else if(pi_money)
                            state<=TWO;
                        else
                            state<=ONE;
                ONE_HALF:   if(pi_money_half)
                            state<=TWO;
                        else if(pi_money)
                            state<=IDLE;
                        else
                            state<=ONE_HALF;
                TWO:   if(pi_money_half)
                            state<=IDLE;
                        else if(pi_money)
                            state<=IDLE;
                        else
                            state<=TWO;
                default:state<=IDLE; 
            endcase
    end

    always@(posedge sys_clk or negedge sys_rst_n)
    begin
        if(!sys_rst_n)
            po_cola<=0;
        else if(state == ONE_HALF&&pi_money==2'b10)
            po_cola<=1;
        else if(state == TWO&pi_money==2'b01)
            po_cola<=1;
        else if(state == TWO&&pi_money==2'b10)
            po_cola<=1;
        else
            po_cola<=0;
    end

    always@(posedge sys_clk or negedge sys_rst_n)
    begin
        if(!sys_rst_n)
            po_money<=0;
        else if(state == TWO&&pi_money==2'b10)
            po_money<=1;
        else
            po_money<=0;
    end

endmodule
