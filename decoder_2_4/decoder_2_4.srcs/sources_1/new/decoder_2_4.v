
module decoder_2_4(
    a,
    b,
    out
    );
    input a;
    input b;
    output [3:0] out;
    reg [3:0] out;

    always@(*) begin
        case ({a,b})//{}位拼接
            3'b00: out = 4'b0001;
            3'b01: out = 4'b0010;  
            3'b10: out = 4'b0100; 
            3'b11: out = 4'b1000; 
        endcase
    end


endmodule
