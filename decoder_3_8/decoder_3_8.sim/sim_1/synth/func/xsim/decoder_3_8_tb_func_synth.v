// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Feb 25 20:46:49 2025
// Host        : DESKTOP-MCR5VBE running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/J202-FPGA/Desktop/FPGAProj/decoder_3_8/decoder_3_8.sim/sim_1/synth/func/xsim/decoder_3_8_tb_func_synth.v
// Design      : decoder_3_8
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module decoder_3_8
   (a,
    b,
    c,
    out);
  input a;
  input b;
  input c;
  output [7:0]out;

  wire a;
  wire a_IBUF;
  wire b;
  wire b_IBUF;
  wire c;
  wire c_IBUF;
  wire [7:0]out;
  wire [7:0]out_OBUF;

  IBUF a_IBUF_inst
       (.I(a),
        .O(a_IBUF));
  IBUF b_IBUF_inst
       (.I(b),
        .O(b_IBUF));
  IBUF c_IBUF_inst
       (.I(c),
        .O(c_IBUF));
  OBUF \out_OBUF[0]_inst 
       (.I(out_OBUF[0]),
        .O(out[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \out_OBUF[0]_inst_i_1 
       (.I0(a_IBUF),
        .I1(c_IBUF),
        .I2(b_IBUF),
        .O(out_OBUF[0]));
  OBUF \out_OBUF[1]_inst 
       (.I(out_OBUF[1]),
        .O(out[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \out_OBUF[1]_inst_i_1 
       (.I0(a_IBUF),
        .I1(c_IBUF),
        .I2(b_IBUF),
        .O(out_OBUF[1]));
  OBUF \out_OBUF[2]_inst 
       (.I(out_OBUF[2]),
        .O(out[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \out_OBUF[2]_inst_i_1 
       (.I0(c_IBUF),
        .I1(b_IBUF),
        .I2(a_IBUF),
        .O(out_OBUF[2]));
  OBUF \out_OBUF[3]_inst 
       (.I(out_OBUF[3]),
        .O(out[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \out_OBUF[3]_inst_i_1 
       (.I0(b_IBUF),
        .I1(c_IBUF),
        .I2(a_IBUF),
        .O(out_OBUF[3]));
  OBUF \out_OBUF[4]_inst 
       (.I(out_OBUF[4]),
        .O(out[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \out_OBUF[4]_inst_i_1 
       (.I0(c_IBUF),
        .I1(a_IBUF),
        .I2(b_IBUF),
        .O(out_OBUF[4]));
  OBUF \out_OBUF[5]_inst 
       (.I(out_OBUF[5]),
        .O(out[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \out_OBUF[5]_inst_i_1 
       (.I0(a_IBUF),
        .I1(c_IBUF),
        .I2(b_IBUF),
        .O(out_OBUF[5]));
  OBUF \out_OBUF[6]_inst 
       (.I(out_OBUF[6]),
        .O(out[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \out_OBUF[6]_inst_i_1 
       (.I0(b_IBUF),
        .I1(a_IBUF),
        .I2(c_IBUF),
        .O(out_OBUF[6]));
  OBUF \out_OBUF[7]_inst 
       (.I(out_OBUF[7]),
        .O(out[7]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \out_OBUF[7]_inst_i_1 
       (.I0(b_IBUF),
        .I1(a_IBUF),
        .I2(c_IBUF),
        .O(out_OBUF[7]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
