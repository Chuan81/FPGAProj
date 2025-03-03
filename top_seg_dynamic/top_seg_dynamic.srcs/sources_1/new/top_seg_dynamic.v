`timescale  1ns/1ns
module  top_seg_dynamic
(
    input   wire            sys_clk     ,
    input   wire            sys_rst_n   ,

    output  wire    [5:0]   sel         ,
    output  wire    [7:0]   seg          
);

wire    [19:0]  data    ;
wire    [5:0]   point   ;
wire            seg_en  ;
wire            sign    ;

data_gen    data_gen_inst
(
    .sys_clk     (sys_clk  ),
    .sys_rst_n   (sys_rst_n),
    
    .data        (data     ),
    .point       (point    ),
    .seg_en      (seg_en   ),
    .sign        (sign     ) 
);

seg_dynamic seg_dynamic_inst
(
    .sys_clk     (sys_clk  ),
    .sys_rst_n   (sys_rst_n),
    .data        (data     ),
    .point       (point    ),
    .seg_en      (seg_en   ),
    .sign        (sign     ),

    .sel         (sel      ),
    .seg         (seg      ) 

);

endmodule
