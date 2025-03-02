module led_flash (
    Clk,
    Reset_n,
    led
);
    input Clk;
    input Reset_n;
    output reg led;

    reg[24:0] cnt;

    always @(posedge Clk or negedge Reset_n) begin
        if(!Reset_n)begin
            cnt <= 0;
            led<=0;
        end
        else if(cnt==25000000-1)begin
            led <= !led;
            cnt <= 0;
        end
        else 
            cnt <= cnt + 1'd1;
    end
endmodule