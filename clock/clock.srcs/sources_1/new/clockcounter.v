module clockcounter
#(parameter Hmax=4'd9,Lmax=4'd9,cntmax=19'd499_999)
(
    input wire CLR,
    input wire CLK,
    input wire PAUSE,

    output reg [3:0] xH,
    output reg [3:0] xL,
    output reg cn
    );

reg [18:0] cnt;

always @(posedge CLK or negedge CLR) begin
    if(!CLR)
        cnt<=19'b0;
    else if(PAUSE)
        cnt<=cnt;
    else if(cnt==cntmax)
        cnt<=19'd0;
    else cnt<=cnt+1'd1;
end

always @(posedge CLK or negedge CLR) begin
    if(!CLR)
        cn<=1'b0;
    else if(PAUSE)
        cn<=cn;
    else if(cnt==cntmax)
        cn<=1'b1;
    else
        cn<=1'b0;
end

always @(posedge CLK or negedge CLR) begin
    if(!CLR)
        xH<=4'b0;
    else if(PAUSE)
        xH<=xH;
    else if(xH==Hmax&&xL==Lmax&&cnt==cntmax)
        xH<=4'b0;
    else if(xL==Lmax&&cnt==cntmax)
        xH<=xH+4'b1;
    else
        xH<=xH;
end

always @(posedge CLK or negedge CLR) begin
    if(!CLR)
        xL<=4'b0;
    else if(PAUSE)
        xL<=xL;
    else if(xL==Lmax&&cnt==cntmax)
        xL<=4'b0;
    else if(cnt==cntmax)
        xL<=xL+4'b1;
    else
        xL<=xL;
end

endmodule
