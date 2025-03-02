module mux2 (
    a,
    b,
    sel,
    out
);
input a;
input b;
input sel;
output out;
//二选一多路器
assign out = sel?a:b;

endmodule