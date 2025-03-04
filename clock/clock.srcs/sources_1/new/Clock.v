module Clock(
    input wire CLR,
    input wire CLK,
    input wire PAUSE,

    output wire [3:0] MSH,
    output wire [3:0] MSL,
    
    output wire [3:0] SH,
    output wire [3:0] SL,
    
    output wire [3:0] MH,
    output wire [3:0] ML
    );

wire cn1,cn2;

// reg [3:0] MSH;
// reg [3:0] MSL;
// reg [3:0] SH;
// reg [3:0] SL;
// reg [3:0] MH;
// reg [3:0] ML;

clockcounter
#(.Hmax(4'd9),
.Lmax(4'd9),
.cntmax(19'd499_999)
)
clockus
(
    .CLR(CLR),
    .CLK(CLK),
    .PAUSE(PAUSE),

    .xH(MSH),
    .xL(MSL),
    .cn(cn1)
    );

clockcounter
#(.Hmax(4'd5),
.Lmax(4'd9),
.cntmax(19'd99)
)
clocks
(
    .CLR(CLR),
    .CLK(cn1),
    .PAUSE(PAUSE),

    .xH(SH),
    .xL(SL),
    .cn(cn2)
    );

clockcounter
#(.Hmax(4'd5),
.Lmax(4'd9),
.cntmax(19'd59)
)
clockm
(
    .CLR(CLR),
    .CLK(cn2),
    .PAUSE(PAUSE),

    .xH(MH),
    .xL(ML),
    .cn()
    );

endmodule
