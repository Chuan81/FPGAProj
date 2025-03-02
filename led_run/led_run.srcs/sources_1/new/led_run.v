module led_run(
    Clk,
    Reset_n,
    Led
    );
    input Clk;
    input Reset_n;
    output reg[7:0]Led;

    reg[24:0]cnt;

    parameter MCNT = 25'd25000000-1;

    always@(posedge Clk or negedge Reset_n)
    if(!Reset_n)
        cnt<=0;
    else if(cnt == MCNT)
    //else if(cnt == 25000000-1)
        cnt <=0;
    else
        cnt <= cnt +1'b1;

    always@(posedge Clk or negedge Reset_n)
    if(!Reset_n)
        Led <= 8'b0000_0001;
    //else if(cnt == 25000000-1)begin
    else if(cnt == MCNT)begin
        if(Led==8'b1000_0000)
            Led <= 8'b0000_0001;
        else
            Led <= Led << 1;
    end
    else
        Led <= Led;

endmodule
