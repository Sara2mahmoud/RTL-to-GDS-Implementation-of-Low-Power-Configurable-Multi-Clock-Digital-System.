/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Thu Aug 15 21:36:54 2024
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_0 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   sync_reg_0_;

  DFFRQX2M sync_reg_reg_1_ ( .D(sync_reg_0_), .CK(CLK), .RN(RST), .Q(SYNC_RST)
         );
  DFFRQX2M sync_reg_reg_0_ ( .D(1'b1), .CK(CLK), .RN(RST), .Q(sync_reg_0_) );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   sync_reg_0_;

  DFFRQX2M sync_reg_reg_1_ ( .D(sync_reg_0_), .CK(CLK), .RN(RST), .Q(SYNC_RST)
         );
  DFFRQX2M sync_reg_reg_0_ ( .D(1'b1), .CK(CLK), .RN(RST), .Q(sync_reg_0_) );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 ( CLK, RST, unsync_bus, bus_enable, 
        sync_bus, enable_pulse_d );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable;
  output enable_pulse_d;
  wire   enable_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [1:0] sync_reg;

  DFFRQX2M enable_flop_reg ( .D(sync_reg[1]), .CK(CLK), .RN(n11), .Q(
        enable_flop) );
  DFFRQX2M sync_reg_reg_1_ ( .D(sync_reg[0]), .CK(CLK), .RN(n11), .Q(
        sync_reg[1]) );
  DFFRQX2M sync_bus_reg_7_ ( .D(n9), .CK(CLK), .RN(n11), .Q(sync_bus[7]) );
  DFFRQX2M sync_bus_reg_6_ ( .D(n8), .CK(CLK), .RN(n11), .Q(sync_bus[6]) );
  DFFRQX2M sync_bus_reg_3_ ( .D(n5), .CK(CLK), .RN(n11), .Q(sync_bus[3]) );
  DFFRQX2M sync_bus_reg_2_ ( .D(n4), .CK(CLK), .RN(n11), .Q(sync_bus[2]) );
  DFFRQX2M sync_reg_reg_0_ ( .D(bus_enable), .CK(CLK), .RN(n11), .Q(
        sync_reg[0]) );
  DFFRQX2M sync_bus_reg_0_ ( .D(n2), .CK(CLK), .RN(n11), .Q(sync_bus[0]) );
  DFFRQX2M sync_bus_reg_4_ ( .D(n6), .CK(CLK), .RN(n11), .Q(sync_bus[4]) );
  DFFRQX2M sync_bus_reg_5_ ( .D(n7), .CK(CLK), .RN(n11), .Q(sync_bus[5]) );
  DFFRQX2M sync_bus_reg_1_ ( .D(n3), .CK(CLK), .RN(n11), .Q(sync_bus[1]) );
  DFFRQX2M enable_pulse_d_reg ( .D(n13), .CK(CLK), .RN(n11), .Q(enable_pulse_d) );
  INVX4M U3 ( .A(n1), .Y(n13) );
  BUFX4M U4 ( .A(n1), .Y(n10) );
  INVX6M U5 ( .A(n12), .Y(n11) );
  INVX2M U6 ( .A(RST), .Y(n12) );
  NAND2BX2M U7 ( .AN(enable_flop), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U8 ( .A0(unsync_bus[1]), .A1(n13), .B0(sync_bus[1]), .B1(n10), .Y(n3) );
  AO22X1M U9 ( .A0(unsync_bus[5]), .A1(n13), .B0(sync_bus[5]), .B1(n10), .Y(n7) );
  AO22X1M U10 ( .A0(unsync_bus[4]), .A1(n13), .B0(sync_bus[4]), .B1(n10), .Y(
        n6) );
  AO22X1M U11 ( .A0(unsync_bus[0]), .A1(n13), .B0(sync_bus[0]), .B1(n10), .Y(
        n2) );
  AO22X1M U12 ( .A0(unsync_bus[2]), .A1(n13), .B0(sync_bus[2]), .B1(n10), .Y(
        n4) );
  AO22X1M U13 ( .A0(unsync_bus[3]), .A1(n13), .B0(sync_bus[3]), .B1(n10), .Y(
        n5) );
  AO22X1M U14 ( .A0(unsync_bus[6]), .A1(n13), .B0(sync_bus[6]), .B1(n10), .Y(
        n8) );
  AO22X1M U15 ( .A0(unsync_bus[7]), .A1(n13), .B0(sync_bus[7]), .B1(n10), .Y(
        n9) );
endmodule


module RegFile_WIDTH8_DEPTH16_ADDR4 ( CLK, RST, WrEn, RdEn, Address, WrData, 
        RdData, RdData_VLD, REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn;
  output RdData_VLD;
  wire   n271, n272, n273, n274, n275, n276, regArr_15__7_, regArr_15__6_,
         regArr_15__5_, regArr_15__4_, regArr_15__3_, regArr_15__2_,
         regArr_15__1_, regArr_15__0_, regArr_14__7_, regArr_14__6_,
         regArr_14__5_, regArr_14__4_, regArr_14__3_, regArr_14__2_,
         regArr_14__1_, regArr_14__0_, regArr_13__7_, regArr_13__6_,
         regArr_13__5_, regArr_13__4_, regArr_13__3_, regArr_13__2_,
         regArr_13__1_, regArr_13__0_, regArr_12__7_, regArr_12__6_,
         regArr_12__5_, regArr_12__4_, regArr_12__3_, regArr_12__2_,
         regArr_12__1_, regArr_12__0_, regArr_11__7_, regArr_11__6_,
         regArr_11__5_, regArr_11__4_, regArr_11__3_, regArr_11__2_,
         regArr_11__1_, regArr_11__0_, regArr_10__7_, regArr_10__6_,
         regArr_10__5_, regArr_10__4_, regArr_10__3_, regArr_10__2_,
         regArr_10__1_, regArr_10__0_, regArr_9__7_, regArr_9__6_,
         regArr_9__5_, regArr_9__4_, regArr_9__3_, regArr_9__2_, regArr_9__1_,
         regArr_9__0_, regArr_8__7_, regArr_8__6_, regArr_8__5_, regArr_8__4_,
         regArr_8__3_, regArr_8__2_, regArr_8__1_, regArr_8__0_, regArr_7__7_,
         regArr_7__6_, regArr_7__5_, regArr_7__4_, regArr_7__3_, regArr_7__2_,
         regArr_7__1_, regArr_7__0_, regArr_6__7_, regArr_6__6_, regArr_6__5_,
         regArr_6__4_, regArr_6__3_, regArr_6__2_, regArr_6__1_, regArr_6__0_,
         regArr_5__7_, regArr_5__6_, regArr_5__5_, regArr_5__4_, regArr_5__3_,
         regArr_5__2_, regArr_5__1_, regArr_5__0_, regArr_4__7_, regArr_4__6_,
         regArr_4__5_, regArr_4__4_, regArr_4__3_, regArr_4__2_, regArr_4__1_,
         regArr_4__0_, N35, N36, N37, N38, N39, N40, N41, N42, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n1,
         n3, n8, n10, n11, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270;

  DFFRHQX8M regArr_reg_2__6_ ( .D(n71), .CK(CLK), .RN(n250), .Q(REG2[6]) );
  DFFRHQX8M regArr_reg_2__5_ ( .D(n70), .CK(CLK), .RN(n250), .Q(REG2[5]) );
  DFFRHQX8M regArr_reg_2__4_ ( .D(n69), .CK(CLK), .RN(n250), .Q(REG2[4]) );
  DFFRHQX8M regArr_reg_1__7_ ( .D(n64), .CK(CLK), .RN(n249), .Q(n271) );
  DFFRHQX8M regArr_reg_1__5_ ( .D(n62), .CK(CLK), .RN(n250), .Q(n272) );
  DFFRHQX8M regArr_reg_1__4_ ( .D(n61), .CK(CLK), .RN(n249), .Q(n273) );
  DFFRHQX8M regArr_reg_1__2_ ( .D(n59), .CK(CLK), .RN(n249), .Q(REG1[2]) );
  DFFRHQX8M regArr_reg_1__1_ ( .D(n58), .CK(CLK), .RN(n249), .Q(REG1[1]) );
  DFFRQX2M regArr_reg_13__7_ ( .D(n160), .CK(CLK), .RN(n257), .Q(regArr_13__7_) );
  DFFRQX2M regArr_reg_13__6_ ( .D(n159), .CK(CLK), .RN(n257), .Q(regArr_13__6_) );
  DFFRQX2M regArr_reg_13__5_ ( .D(n158), .CK(CLK), .RN(n257), .Q(regArr_13__5_) );
  DFFRQX2M regArr_reg_13__4_ ( .D(n157), .CK(CLK), .RN(n257), .Q(regArr_13__4_) );
  DFFRQX2M regArr_reg_13__3_ ( .D(n156), .CK(CLK), .RN(n257), .Q(regArr_13__3_) );
  DFFRQX2M regArr_reg_13__2_ ( .D(n155), .CK(CLK), .RN(n256), .Q(regArr_13__2_) );
  DFFRQX2M regArr_reg_13__1_ ( .D(n154), .CK(CLK), .RN(n256), .Q(regArr_13__1_) );
  DFFRQX2M regArr_reg_13__0_ ( .D(n153), .CK(CLK), .RN(n256), .Q(regArr_13__0_) );
  DFFRQX2M regArr_reg_9__7_ ( .D(n128), .CK(CLK), .RN(n254), .Q(regArr_9__7_)
         );
  DFFRQX2M regArr_reg_9__6_ ( .D(n127), .CK(CLK), .RN(n254), .Q(regArr_9__6_)
         );
  DFFRQX2M regArr_reg_9__5_ ( .D(n126), .CK(CLK), .RN(n254), .Q(regArr_9__5_)
         );
  DFFRQX2M regArr_reg_9__4_ ( .D(n125), .CK(CLK), .RN(n254), .Q(regArr_9__4_)
         );
  DFFRQX2M regArr_reg_9__3_ ( .D(n124), .CK(CLK), .RN(n254), .Q(regArr_9__3_)
         );
  DFFRQX2M regArr_reg_9__2_ ( .D(n123), .CK(CLK), .RN(n254), .Q(regArr_9__2_)
         );
  DFFRQX2M regArr_reg_9__1_ ( .D(n122), .CK(CLK), .RN(n254), .Q(regArr_9__1_)
         );
  DFFRQX2M regArr_reg_9__0_ ( .D(n121), .CK(CLK), .RN(n254), .Q(regArr_9__0_)
         );
  DFFRQX2M regArr_reg_5__7_ ( .D(n96), .CK(CLK), .RN(n252), .Q(regArr_5__7_)
         );
  DFFRQX2M regArr_reg_5__6_ ( .D(n95), .CK(CLK), .RN(n252), .Q(regArr_5__6_)
         );
  DFFRQX2M regArr_reg_5__5_ ( .D(n94), .CK(CLK), .RN(n252), .Q(regArr_5__5_)
         );
  DFFRQX2M regArr_reg_5__4_ ( .D(n93), .CK(CLK), .RN(n252), .Q(regArr_5__4_)
         );
  DFFRQX2M regArr_reg_5__3_ ( .D(n92), .CK(CLK), .RN(n252), .Q(regArr_5__3_)
         );
  DFFRQX2M regArr_reg_5__2_ ( .D(n91), .CK(CLK), .RN(n251), .Q(regArr_5__2_)
         );
  DFFRQX2M regArr_reg_5__1_ ( .D(n90), .CK(CLK), .RN(n251), .Q(regArr_5__1_)
         );
  DFFRQX2M regArr_reg_5__0_ ( .D(n89), .CK(CLK), .RN(n251), .Q(regArr_5__0_)
         );
  DFFRQX2M regArr_reg_15__7_ ( .D(n176), .CK(CLK), .RN(n250), .Q(regArr_15__7_) );
  DFFRQX2M regArr_reg_15__6_ ( .D(n175), .CK(CLK), .RN(n258), .Q(regArr_15__6_) );
  DFFRQX2M regArr_reg_15__5_ ( .D(n174), .CK(CLK), .RN(n258), .Q(regArr_15__5_) );
  DFFRQX2M regArr_reg_15__4_ ( .D(n173), .CK(CLK), .RN(n258), .Q(regArr_15__4_) );
  DFFRQX2M regArr_reg_15__3_ ( .D(n172), .CK(CLK), .RN(n258), .Q(regArr_15__3_) );
  DFFRQX2M regArr_reg_15__2_ ( .D(n171), .CK(CLK), .RN(n258), .Q(regArr_15__2_) );
  DFFRQX2M regArr_reg_15__1_ ( .D(n170), .CK(CLK), .RN(n258), .Q(regArr_15__1_) );
  DFFRQX2M regArr_reg_15__0_ ( .D(n169), .CK(CLK), .RN(n258), .Q(regArr_15__0_) );
  DFFRQX2M regArr_reg_11__7_ ( .D(n144), .CK(CLK), .RN(n256), .Q(regArr_11__7_) );
  DFFRQX2M regArr_reg_11__6_ ( .D(n143), .CK(CLK), .RN(n256), .Q(regArr_11__6_) );
  DFFRQX2M regArr_reg_11__5_ ( .D(n142), .CK(CLK), .RN(n255), .Q(regArr_11__5_) );
  DFFRQX2M regArr_reg_11__4_ ( .D(n141), .CK(CLK), .RN(n255), .Q(regArr_11__4_) );
  DFFRQX2M regArr_reg_11__3_ ( .D(n140), .CK(CLK), .RN(n255), .Q(regArr_11__3_) );
  DFFRQX2M regArr_reg_11__2_ ( .D(n139), .CK(CLK), .RN(n255), .Q(regArr_11__2_) );
  DFFRQX2M regArr_reg_11__1_ ( .D(n138), .CK(CLK), .RN(n255), .Q(regArr_11__1_) );
  DFFRQX2M regArr_reg_11__0_ ( .D(n137), .CK(CLK), .RN(n255), .Q(regArr_11__0_) );
  DFFRQX2M regArr_reg_7__7_ ( .D(n112), .CK(CLK), .RN(n253), .Q(regArr_7__7_)
         );
  DFFRQX2M regArr_reg_7__6_ ( .D(n111), .CK(CLK), .RN(n253), .Q(regArr_7__6_)
         );
  DFFRQX2M regArr_reg_7__5_ ( .D(n110), .CK(CLK), .RN(n253), .Q(regArr_7__5_)
         );
  DFFRQX2M regArr_reg_7__4_ ( .D(n109), .CK(CLK), .RN(n253), .Q(regArr_7__4_)
         );
  DFFRQX2M regArr_reg_7__3_ ( .D(n108), .CK(CLK), .RN(n253), .Q(regArr_7__3_)
         );
  DFFRQX2M regArr_reg_7__2_ ( .D(n107), .CK(CLK), .RN(n253), .Q(regArr_7__2_)
         );
  DFFRQX2M regArr_reg_7__1_ ( .D(n106), .CK(CLK), .RN(n253), .Q(regArr_7__1_)
         );
  DFFRQX2M regArr_reg_7__0_ ( .D(n105), .CK(CLK), .RN(n253), .Q(regArr_7__0_)
         );
  DFFRQX2M regArr_reg_14__7_ ( .D(n168), .CK(CLK), .RN(n257), .Q(regArr_14__7_) );
  DFFRQX2M regArr_reg_14__6_ ( .D(n167), .CK(CLK), .RN(n257), .Q(regArr_14__6_) );
  DFFRQX2M regArr_reg_14__5_ ( .D(n166), .CK(CLK), .RN(n257), .Q(regArr_14__5_) );
  DFFRQX2M regArr_reg_14__4_ ( .D(n165), .CK(CLK), .RN(n257), .Q(regArr_14__4_) );
  DFFRQX2M regArr_reg_14__3_ ( .D(n164), .CK(CLK), .RN(n257), .Q(regArr_14__3_) );
  DFFRQX2M regArr_reg_14__2_ ( .D(n163), .CK(CLK), .RN(n257), .Q(regArr_14__2_) );
  DFFRQX2M regArr_reg_14__1_ ( .D(n162), .CK(CLK), .RN(n257), .Q(regArr_14__1_) );
  DFFRQX2M regArr_reg_14__0_ ( .D(n161), .CK(CLK), .RN(n257), .Q(regArr_14__0_) );
  DFFRQX2M regArr_reg_10__7_ ( .D(n136), .CK(CLK), .RN(n255), .Q(regArr_10__7_) );
  DFFRQX2M regArr_reg_10__6_ ( .D(n135), .CK(CLK), .RN(n255), .Q(regArr_10__6_) );
  DFFRQX2M regArr_reg_10__5_ ( .D(n134), .CK(CLK), .RN(n255), .Q(regArr_10__5_) );
  DFFRQX2M regArr_reg_10__4_ ( .D(n133), .CK(CLK), .RN(n255), .Q(regArr_10__4_) );
  DFFRQX2M regArr_reg_10__3_ ( .D(n132), .CK(CLK), .RN(n255), .Q(regArr_10__3_) );
  DFFRQX2M regArr_reg_10__2_ ( .D(n131), .CK(CLK), .RN(n255), .Q(regArr_10__2_) );
  DFFRQX2M regArr_reg_10__1_ ( .D(n130), .CK(CLK), .RN(n255), .Q(regArr_10__1_) );
  DFFRQX2M regArr_reg_10__0_ ( .D(n129), .CK(CLK), .RN(n254), .Q(regArr_10__0_) );
  DFFRQX2M regArr_reg_6__7_ ( .D(n104), .CK(CLK), .RN(n252), .Q(regArr_6__7_)
         );
  DFFRQX2M regArr_reg_6__6_ ( .D(n103), .CK(CLK), .RN(n252), .Q(regArr_6__6_)
         );
  DFFRQX2M regArr_reg_6__5_ ( .D(n102), .CK(CLK), .RN(n252), .Q(regArr_6__5_)
         );
  DFFRQX2M regArr_reg_6__4_ ( .D(n101), .CK(CLK), .RN(n252), .Q(regArr_6__4_)
         );
  DFFRQX2M regArr_reg_6__3_ ( .D(n100), .CK(CLK), .RN(n252), .Q(regArr_6__3_)
         );
  DFFRQX2M regArr_reg_6__2_ ( .D(n99), .CK(CLK), .RN(n252), .Q(regArr_6__2_)
         );
  DFFRQX2M regArr_reg_6__1_ ( .D(n98), .CK(CLK), .RN(n252), .Q(regArr_6__1_)
         );
  DFFRQX2M regArr_reg_6__0_ ( .D(n97), .CK(CLK), .RN(n252), .Q(regArr_6__0_)
         );
  DFFRQX2M regArr_reg_12__7_ ( .D(n152), .CK(CLK), .RN(n256), .Q(regArr_12__7_) );
  DFFRQX2M regArr_reg_12__6_ ( .D(n151), .CK(CLK), .RN(n256), .Q(regArr_12__6_) );
  DFFRQX2M regArr_reg_12__5_ ( .D(n150), .CK(CLK), .RN(n256), .Q(regArr_12__5_) );
  DFFRQX2M regArr_reg_12__4_ ( .D(n149), .CK(CLK), .RN(n256), .Q(regArr_12__4_) );
  DFFRQX2M regArr_reg_12__3_ ( .D(n148), .CK(CLK), .RN(n256), .Q(regArr_12__3_) );
  DFFRQX2M regArr_reg_12__2_ ( .D(n147), .CK(CLK), .RN(n256), .Q(regArr_12__2_) );
  DFFRQX2M regArr_reg_12__1_ ( .D(n146), .CK(CLK), .RN(n256), .Q(regArr_12__1_) );
  DFFRQX2M regArr_reg_12__0_ ( .D(n145), .CK(CLK), .RN(n256), .Q(regArr_12__0_) );
  DFFRQX2M regArr_reg_8__7_ ( .D(n120), .CK(CLK), .RN(n254), .Q(regArr_8__7_)
         );
  DFFRQX2M regArr_reg_8__6_ ( .D(n119), .CK(CLK), .RN(n254), .Q(regArr_8__6_)
         );
  DFFRQX2M regArr_reg_8__5_ ( .D(n118), .CK(CLK), .RN(n254), .Q(regArr_8__5_)
         );
  DFFRQX2M regArr_reg_8__4_ ( .D(n117), .CK(CLK), .RN(n254), .Q(regArr_8__4_)
         );
  DFFRQX2M regArr_reg_8__3_ ( .D(n116), .CK(CLK), .RN(n253), .Q(regArr_8__3_)
         );
  DFFRQX2M regArr_reg_8__2_ ( .D(n115), .CK(CLK), .RN(n253), .Q(regArr_8__2_)
         );
  DFFRQX2M regArr_reg_8__1_ ( .D(n114), .CK(CLK), .RN(n253), .Q(regArr_8__1_)
         );
  DFFRQX2M regArr_reg_8__0_ ( .D(n113), .CK(CLK), .RN(n253), .Q(regArr_8__0_)
         );
  DFFRQX2M regArr_reg_4__7_ ( .D(n88), .CK(CLK), .RN(n251), .Q(regArr_4__7_)
         );
  DFFRQX2M regArr_reg_4__6_ ( .D(n87), .CK(CLK), .RN(n251), .Q(regArr_4__6_)
         );
  DFFRQX2M regArr_reg_4__5_ ( .D(n86), .CK(CLK), .RN(n251), .Q(regArr_4__5_)
         );
  DFFRQX2M regArr_reg_4__4_ ( .D(n85), .CK(CLK), .RN(n251), .Q(regArr_4__4_)
         );
  DFFRQX2M regArr_reg_4__3_ ( .D(n84), .CK(CLK), .RN(n251), .Q(regArr_4__3_)
         );
  DFFRQX2M regArr_reg_4__2_ ( .D(n83), .CK(CLK), .RN(n251), .Q(regArr_4__2_)
         );
  DFFRQX2M regArr_reg_4__1_ ( .D(n82), .CK(CLK), .RN(n251), .Q(regArr_4__1_)
         );
  DFFRQX2M regArr_reg_4__0_ ( .D(n81), .CK(CLK), .RN(n251), .Q(regArr_4__0_)
         );
  DFFRQX2M regArr_reg_2__1_ ( .D(n66), .CK(CLK), .RN(n250), .Q(REG2[1]) );
  DFFSQX4M regArr_reg_2__0_ ( .D(n65), .CK(CLK), .SN(n254), .Q(REG2[0]) );
  DFFRQX2M RdData_VLD_reg ( .D(n48), .CK(CLK), .RN(n259), .Q(RdData_VLD) );
  DFFSQX4M regArr_reg_3__5_ ( .D(n78), .CK(CLK), .SN(n253), .Q(REG3[5]) );
  DFFRQX2M RdData_reg_5_ ( .D(n45), .CK(CLK), .RN(n250), .Q(RdData[5]) );
  DFFRQX2M RdData_reg_1_ ( .D(n41), .CK(CLK), .RN(n251), .Q(RdData[1]) );
  DFFRQX2M RdData_reg_7_ ( .D(n47), .CK(CLK), .RN(n249), .Q(RdData[7]) );
  DFFRQX2M RdData_reg_3_ ( .D(n43), .CK(CLK), .RN(n252), .Q(RdData[3]) );
  DFFRQX2M RdData_reg_6_ ( .D(n46), .CK(CLK), .RN(n257), .Q(RdData[6]) );
  DFFRQX2M RdData_reg_2_ ( .D(n42), .CK(CLK), .RN(n256), .Q(RdData[2]) );
  DFFRQX2M RdData_reg_4_ ( .D(n44), .CK(CLK), .RN(n255), .Q(RdData[4]) );
  DFFRQX2M RdData_reg_0_ ( .D(n40), .CK(CLK), .RN(n253), .Q(RdData[0]) );
  DFFRQX2M regArr_reg_0__3_ ( .D(n52), .CK(CLK), .RN(n249), .Q(REG0[3]) );
  DFFRQX2M regArr_reg_0__2_ ( .D(n51), .CK(CLK), .RN(n249), .Q(REG0[2]) );
  DFFRQX2M regArr_reg_0__1_ ( .D(n50), .CK(CLK), .RN(n254), .Q(REG0[1]) );
  DFFRQX2M regArr_reg_0__0_ ( .D(n49), .CK(CLK), .RN(n253), .Q(REG0[0]) );
  DFFRQX2M regArr_reg_3__0_ ( .D(n73), .CK(CLK), .RN(n250), .Q(REG3[0]) );
  DFFRHQX8M regArr_reg_0__6_ ( .D(n55), .CK(CLK), .RN(n249), .Q(REG0[6]) );
  DFFRQX2M regArr_reg_0__4_ ( .D(n53), .CK(CLK), .RN(n249), .Q(REG0[4]) );
  DFFRQX2M regArr_reg_0__5_ ( .D(n54), .CK(CLK), .RN(n249), .Q(REG0[5]) );
  DFFRQX2M regArr_reg_2__3_ ( .D(n68), .CK(CLK), .RN(n250), .Q(n275) );
  DFFRQX2M regArr_reg_2__2_ ( .D(n67), .CK(CLK), .RN(n250), .Q(n276) );
  DFFSHQX8M regArr_reg_2__7_ ( .D(n72), .CK(CLK), .SN(RST), .Q(REG2[7]) );
  DFFRQX4M regArr_reg_3__2_ ( .D(n75), .CK(CLK), .RN(n250), .Q(REG3[2]) );
  DFFRQX4M regArr_reg_3__4_ ( .D(n77), .CK(CLK), .RN(n250), .Q(REG3[4]) );
  DFFRQX4M regArr_reg_3__3_ ( .D(n76), .CK(CLK), .RN(n250), .Q(REG3[3]) );
  DFFRQX4M regArr_reg_3__7_ ( .D(n80), .CK(CLK), .RN(n251), .Q(REG3[7]) );
  DFFRQX4M regArr_reg_3__6_ ( .D(n79), .CK(CLK), .RN(n251), .Q(REG3[6]) );
  DFFRHQX2M regArr_reg_1__0_ ( .D(n57), .CK(CLK), .RN(n249), .Q(n274) );
  DFFRQX4M regArr_reg_3__1_ ( .D(n74), .CK(CLK), .RN(n250), .Q(REG3[1]) );
  DFFRHQX8M regArr_reg_0__7_ ( .D(n56), .CK(CLK), .RN(n249), .Q(REG0[7]) );
  DFFRHQX8M regArr_reg_1__3_ ( .D(n60), .CK(CLK), .RN(n249), .Q(REG1[3]) );
  DFFRHQX8M regArr_reg_1__6_ ( .D(n63), .CK(CLK), .RN(n250), .Q(REG1[6]) );
  INVX12M U3 ( .A(n272), .Y(n1) );
  CLKINVX40M U4 ( .A(n1), .Y(REG1[5]) );
  INVX12M U5 ( .A(n273), .Y(n3) );
  CLKINVX40M U6 ( .A(n3), .Y(REG1[4]) );
  BUFX32M U7 ( .A(n271), .Y(REG1[7]) );
  CLKINVX16M U8 ( .A(n8), .Y(REG1[0]) );
  INVX4M U9 ( .A(n274), .Y(n8) );
  CLKBUFX2M U10 ( .A(n245), .Y(n209) );
  BUFX10M U11 ( .A(n276), .Y(REG2[2]) );
  BUFX10M U12 ( .A(n275), .Y(REG2[3]) );
  BUFX6M U13 ( .A(n261), .Y(n249) );
  MX4XLM U14 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(n210), 
        .S1(n207), .Y(n178) );
  MX4XLM U15 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n211), 
        .S1(n207), .Y(n182) );
  MX4XLM U16 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n211), 
        .S1(n208), .Y(n206) );
  MX4XLM U17 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n210), 
        .S1(n208), .Y(n194) );
  INVX2M U18 ( .A(Address[0]), .Y(n246) );
  INVX2M U19 ( .A(Address[1]), .Y(n248) );
  NOR2X4M U20 ( .A(n247), .B(Address[2]), .Y(n15) );
  NOR2BX2M U21 ( .AN(n13), .B(Address[3]), .Y(n27) );
  NOR2X4M U22 ( .A(n248), .B(Address[2]), .Y(n20) );
  NOR2BX4M U23 ( .AN(Address[2]), .B(n247), .Y(n23) );
  NOR2BX4M U24 ( .AN(Address[2]), .B(n248), .Y(n26) );
  INVX8M U25 ( .A(WrData[0]), .Y(n270) );
  INVX8M U26 ( .A(WrData[1]), .Y(n269) );
  INVX8M U27 ( .A(WrData[2]), .Y(n268) );
  INVX8M U28 ( .A(WrData[3]), .Y(n267) );
  INVX8M U29 ( .A(WrData[4]), .Y(n266) );
  INVX8M U30 ( .A(WrData[5]), .Y(n265) );
  INVX8M U31 ( .A(WrData[6]), .Y(n264) );
  INVX8M U32 ( .A(WrData[7]), .Y(n263) );
  CLKBUFX8M U33 ( .A(n209), .Y(n210) );
  CLKBUFX8M U34 ( .A(n247), .Y(n207) );
  CLKBUFX8M U35 ( .A(n209), .Y(n211) );
  CLKBUFX8M U36 ( .A(n247), .Y(n208) );
  CLKBUFX8M U37 ( .A(n261), .Y(n250) );
  CLKBUFX8M U38 ( .A(n260), .Y(n251) );
  CLKBUFX8M U39 ( .A(n258), .Y(n252) );
  CLKBUFX8M U40 ( .A(n260), .Y(n253) );
  CLKBUFX8M U41 ( .A(n260), .Y(n254) );
  CLKBUFX8M U42 ( .A(n260), .Y(n255) );
  CLKBUFX8M U43 ( .A(n259), .Y(n256) );
  CLKBUFX8M U44 ( .A(n259), .Y(n257) );
  BUFX4M U45 ( .A(n259), .Y(n258) );
  BUFX4M U46 ( .A(n29), .Y(n227) );
  BUFX4M U47 ( .A(n31), .Y(n225) );
  BUFX4M U48 ( .A(n33), .Y(n223) );
  BUFX4M U49 ( .A(n34), .Y(n221) );
  BUFX4M U50 ( .A(n35), .Y(n219) );
  BUFX4M U51 ( .A(n36), .Y(n217) );
  BUFX4M U52 ( .A(n37), .Y(n215) );
  BUFX4M U53 ( .A(n39), .Y(n213) );
  BUFX4M U54 ( .A(n29), .Y(n226) );
  BUFX4M U55 ( .A(n31), .Y(n224) );
  BUFX4M U56 ( .A(n33), .Y(n222) );
  BUFX4M U57 ( .A(n34), .Y(n220) );
  BUFX4M U58 ( .A(n35), .Y(n218) );
  BUFX4M U59 ( .A(n36), .Y(n216) );
  BUFX4M U60 ( .A(n37), .Y(n214) );
  BUFX4M U61 ( .A(n39), .Y(n212) );
  BUFX4M U62 ( .A(n17), .Y(n241) );
  BUFX4M U63 ( .A(n19), .Y(n239) );
  BUFX4M U64 ( .A(n21), .Y(n237) );
  BUFX4M U65 ( .A(n14), .Y(n243) );
  BUFX4M U66 ( .A(n22), .Y(n235) );
  BUFX4M U67 ( .A(n24), .Y(n233) );
  BUFX4M U68 ( .A(n25), .Y(n231) );
  BUFX4M U69 ( .A(n28), .Y(n229) );
  BUFX4M U70 ( .A(n17), .Y(n240) );
  BUFX4M U71 ( .A(n19), .Y(n238) );
  BUFX4M U72 ( .A(n21), .Y(n236) );
  BUFX4M U73 ( .A(n22), .Y(n234) );
  BUFX4M U74 ( .A(n24), .Y(n232) );
  BUFX4M U75 ( .A(n25), .Y(n230) );
  BUFX4M U76 ( .A(n28), .Y(n228) );
  BUFX4M U77 ( .A(n14), .Y(n242) );
  BUFX2M U78 ( .A(n261), .Y(n260) );
  BUFX2M U79 ( .A(n261), .Y(n259) );
  NOR2BX4M U80 ( .AN(n38), .B(n245), .Y(n30) );
  NOR2BX4M U81 ( .AN(n38), .B(n246), .Y(n32) );
  NAND2X2M U82 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U83 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U84 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U85 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U86 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U87 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U88 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U89 ( .A(n32), .B(n26), .Y(n39) );
  NOR2BX4M U90 ( .AN(n27), .B(n245), .Y(n16) );
  NOR2BX4M U91 ( .AN(n27), .B(n246), .Y(n18) );
  NAND2X2M U92 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U93 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U94 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U95 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U96 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U97 ( .A(n15), .B(n16), .Y(n14) );
  NAND2X2M U98 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U99 ( .A(n20), .B(n18), .Y(n21) );
  INVX2M U100 ( .A(n246), .Y(n245) );
  INVX2M U101 ( .A(n248), .Y(n247) );
  INVX4M U102 ( .A(n244), .Y(n262) );
  BUFX2M U103 ( .A(RST), .Y(n261) );
  OAI2BB2X1M U104 ( .B0(n270), .B1(n227), .A0N(regArr_8__0_), .A1N(n227), .Y(
        n113) );
  OAI2BB2X1M U105 ( .B0(n269), .B1(n226), .A0N(regArr_8__1_), .A1N(n227), .Y(
        n114) );
  OAI2BB2X1M U106 ( .B0(n268), .B1(n226), .A0N(regArr_8__2_), .A1N(n227), .Y(
        n115) );
  OAI2BB2X1M U107 ( .B0(n267), .B1(n226), .A0N(regArr_8__3_), .A1N(n227), .Y(
        n116) );
  OAI2BB2X1M U108 ( .B0(n266), .B1(n226), .A0N(regArr_8__4_), .A1N(n227), .Y(
        n117) );
  OAI2BB2X1M U109 ( .B0(n264), .B1(n226), .A0N(regArr_8__6_), .A1N(n227), .Y(
        n119) );
  OAI2BB2X1M U110 ( .B0(n263), .B1(n226), .A0N(regArr_8__7_), .A1N(n227), .Y(
        n120) );
  OAI2BB2X1M U111 ( .B0(n270), .B1(n225), .A0N(regArr_9__0_), .A1N(n225), .Y(
        n121) );
  OAI2BB2X1M U112 ( .B0(n269), .B1(n224), .A0N(regArr_9__1_), .A1N(n225), .Y(
        n122) );
  OAI2BB2X1M U113 ( .B0(n268), .B1(n224), .A0N(regArr_9__2_), .A1N(n225), .Y(
        n123) );
  OAI2BB2X1M U114 ( .B0(n267), .B1(n224), .A0N(regArr_9__3_), .A1N(n225), .Y(
        n124) );
  OAI2BB2X1M U115 ( .B0(n266), .B1(n224), .A0N(regArr_9__4_), .A1N(n225), .Y(
        n125) );
  OAI2BB2X1M U116 ( .B0(n264), .B1(n224), .A0N(regArr_9__6_), .A1N(n225), .Y(
        n127) );
  OAI2BB2X1M U117 ( .B0(n263), .B1(n224), .A0N(regArr_9__7_), .A1N(n225), .Y(
        n128) );
  OAI2BB2X1M U118 ( .B0(n270), .B1(n223), .A0N(regArr_10__0_), .A1N(n223), .Y(
        n129) );
  OAI2BB2X1M U119 ( .B0(n269), .B1(n222), .A0N(regArr_10__1_), .A1N(n223), .Y(
        n130) );
  OAI2BB2X1M U120 ( .B0(n268), .B1(n222), .A0N(regArr_10__2_), .A1N(n223), .Y(
        n131) );
  OAI2BB2X1M U121 ( .B0(n267), .B1(n222), .A0N(regArr_10__3_), .A1N(n223), .Y(
        n132) );
  OAI2BB2X1M U122 ( .B0(n266), .B1(n222), .A0N(regArr_10__4_), .A1N(n223), .Y(
        n133) );
  OAI2BB2X1M U123 ( .B0(n264), .B1(n222), .A0N(regArr_10__6_), .A1N(n223), .Y(
        n135) );
  OAI2BB2X1M U124 ( .B0(n263), .B1(n222), .A0N(regArr_10__7_), .A1N(n223), .Y(
        n136) );
  OAI2BB2X1M U125 ( .B0(n270), .B1(n221), .A0N(regArr_11__0_), .A1N(n221), .Y(
        n137) );
  OAI2BB2X1M U126 ( .B0(n269), .B1(n220), .A0N(regArr_11__1_), .A1N(n221), .Y(
        n138) );
  OAI2BB2X1M U127 ( .B0(n268), .B1(n220), .A0N(regArr_11__2_), .A1N(n221), .Y(
        n139) );
  OAI2BB2X1M U128 ( .B0(n267), .B1(n220), .A0N(regArr_11__3_), .A1N(n221), .Y(
        n140) );
  OAI2BB2X1M U129 ( .B0(n266), .B1(n220), .A0N(regArr_11__4_), .A1N(n221), .Y(
        n141) );
  OAI2BB2X1M U130 ( .B0(n264), .B1(n220), .A0N(regArr_11__6_), .A1N(n221), .Y(
        n143) );
  OAI2BB2X1M U131 ( .B0(n263), .B1(n220), .A0N(regArr_11__7_), .A1N(n221), .Y(
        n144) );
  OAI2BB2X1M U132 ( .B0(n270), .B1(n219), .A0N(regArr_12__0_), .A1N(n219), .Y(
        n145) );
  OAI2BB2X1M U133 ( .B0(n269), .B1(n218), .A0N(regArr_12__1_), .A1N(n219), .Y(
        n146) );
  OAI2BB2X1M U134 ( .B0(n268), .B1(n218), .A0N(regArr_12__2_), .A1N(n219), .Y(
        n147) );
  OAI2BB2X1M U135 ( .B0(n267), .B1(n218), .A0N(regArr_12__3_), .A1N(n219), .Y(
        n148) );
  OAI2BB2X1M U136 ( .B0(n266), .B1(n218), .A0N(regArr_12__4_), .A1N(n219), .Y(
        n149) );
  OAI2BB2X1M U137 ( .B0(n264), .B1(n218), .A0N(regArr_12__6_), .A1N(n219), .Y(
        n151) );
  OAI2BB2X1M U138 ( .B0(n263), .B1(n218), .A0N(regArr_12__7_), .A1N(n219), .Y(
        n152) );
  OAI2BB2X1M U139 ( .B0(n270), .B1(n217), .A0N(regArr_13__0_), .A1N(n217), .Y(
        n153) );
  OAI2BB2X1M U140 ( .B0(n269), .B1(n216), .A0N(regArr_13__1_), .A1N(n217), .Y(
        n154) );
  OAI2BB2X1M U141 ( .B0(n268), .B1(n216), .A0N(regArr_13__2_), .A1N(n217), .Y(
        n155) );
  OAI2BB2X1M U142 ( .B0(n267), .B1(n216), .A0N(regArr_13__3_), .A1N(n217), .Y(
        n156) );
  OAI2BB2X1M U143 ( .B0(n266), .B1(n216), .A0N(regArr_13__4_), .A1N(n217), .Y(
        n157) );
  OAI2BB2X1M U144 ( .B0(n264), .B1(n216), .A0N(regArr_13__6_), .A1N(n217), .Y(
        n159) );
  OAI2BB2X1M U145 ( .B0(n263), .B1(n216), .A0N(regArr_13__7_), .A1N(n217), .Y(
        n160) );
  OAI2BB2X1M U146 ( .B0(n270), .B1(n215), .A0N(regArr_14__0_), .A1N(n215), .Y(
        n161) );
  OAI2BB2X1M U147 ( .B0(n269), .B1(n214), .A0N(regArr_14__1_), .A1N(n215), .Y(
        n162) );
  OAI2BB2X1M U148 ( .B0(n268), .B1(n214), .A0N(regArr_14__2_), .A1N(n215), .Y(
        n163) );
  OAI2BB2X1M U149 ( .B0(n267), .B1(n214), .A0N(regArr_14__3_), .A1N(n215), .Y(
        n164) );
  OAI2BB2X1M U150 ( .B0(n266), .B1(n214), .A0N(regArr_14__4_), .A1N(n215), .Y(
        n165) );
  OAI2BB2X1M U151 ( .B0(n264), .B1(n214), .A0N(regArr_14__6_), .A1N(n215), .Y(
        n167) );
  OAI2BB2X1M U152 ( .B0(n263), .B1(n214), .A0N(regArr_14__7_), .A1N(n215), .Y(
        n168) );
  OAI2BB2X1M U153 ( .B0(n270), .B1(n213), .A0N(regArr_15__0_), .A1N(n213), .Y(
        n169) );
  OAI2BB2X1M U154 ( .B0(n269), .B1(n212), .A0N(regArr_15__1_), .A1N(n213), .Y(
        n170) );
  OAI2BB2X1M U155 ( .B0(n268), .B1(n212), .A0N(regArr_15__2_), .A1N(n213), .Y(
        n171) );
  OAI2BB2X1M U156 ( .B0(n267), .B1(n212), .A0N(regArr_15__3_), .A1N(n213), .Y(
        n172) );
  OAI2BB2X1M U157 ( .B0(n266), .B1(n212), .A0N(regArr_15__4_), .A1N(n213), .Y(
        n173) );
  OAI2BB2X1M U158 ( .B0(n264), .B1(n212), .A0N(regArr_15__6_), .A1N(n213), .Y(
        n175) );
  OAI2BB2X1M U159 ( .B0(n263), .B1(n212), .A0N(regArr_15__7_), .A1N(n213), .Y(
        n176) );
  OAI2BB2X1M U160 ( .B0(n265), .B1(n226), .A0N(regArr_8__5_), .A1N(n227), .Y(
        n118) );
  OAI2BB2X1M U161 ( .B0(n265), .B1(n224), .A0N(regArr_9__5_), .A1N(n225), .Y(
        n126) );
  OAI2BB2X1M U162 ( .B0(n265), .B1(n222), .A0N(regArr_10__5_), .A1N(n223), .Y(
        n134) );
  OAI2BB2X1M U163 ( .B0(n265), .B1(n220), .A0N(regArr_11__5_), .A1N(n221), .Y(
        n142) );
  OAI2BB2X1M U164 ( .B0(n265), .B1(n218), .A0N(regArr_12__5_), .A1N(n219), .Y(
        n150) );
  OAI2BB2X1M U165 ( .B0(n265), .B1(n216), .A0N(regArr_13__5_), .A1N(n217), .Y(
        n158) );
  OAI2BB2X1M U166 ( .B0(n265), .B1(n214), .A0N(regArr_14__5_), .A1N(n215), .Y(
        n166) );
  OAI2BB2X1M U167 ( .B0(n265), .B1(n212), .A0N(regArr_15__5_), .A1N(n213), .Y(
        n174) );
  AND2X2M U168 ( .A(Address[3]), .B(n13), .Y(n38) );
  NOR2BX4M U169 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  OAI2BB2X1M U170 ( .B0(n243), .B1(n270), .A0N(REG0[0]), .A1N(n243), .Y(n49)
         );
  OAI2BB2X1M U171 ( .B0(n242), .B1(n269), .A0N(REG0[1]), .A1N(n243), .Y(n50)
         );
  OAI2BB2X1M U172 ( .B0(n242), .B1(n268), .A0N(REG0[2]), .A1N(n243), .Y(n51)
         );
  OAI2BB2X1M U173 ( .B0(n242), .B1(n267), .A0N(REG0[3]), .A1N(n243), .Y(n52)
         );
  OAI2BB2X1M U174 ( .B0(n242), .B1(n266), .A0N(REG0[4]), .A1N(n243), .Y(n53)
         );
  OAI2BB2X1M U175 ( .B0(n242), .B1(n264), .A0N(REG0[6]), .A1N(n243), .Y(n55)
         );
  OAI2BB2X1M U176 ( .B0(n242), .B1(n263), .A0N(REG0[7]), .A1N(n243), .Y(n56)
         );
  OAI2BB2X1M U177 ( .B0(n242), .B1(n265), .A0N(REG0[5]), .A1N(n243), .Y(n54)
         );
  OAI2BB2X1M U178 ( .B0(n270), .B1(n241), .A0N(REG1[0]), .A1N(n241), .Y(n57)
         );
  OAI2BB2X1M U179 ( .B0(n269), .B1(n240), .A0N(REG1[1]), .A1N(n241), .Y(n58)
         );
  OAI2BB2X1M U180 ( .B0(n268), .B1(n240), .A0N(REG1[2]), .A1N(n241), .Y(n59)
         );
  OAI2BB2X1M U181 ( .B0(n267), .B1(n240), .A0N(REG1[3]), .A1N(n241), .Y(n60)
         );
  OAI2BB2X1M U182 ( .B0(n266), .B1(n240), .A0N(REG1[4]), .A1N(n241), .Y(n61)
         );
  OAI2BB2X1M U183 ( .B0(n264), .B1(n240), .A0N(REG1[6]), .A1N(n241), .Y(n63)
         );
  OAI2BB2X1M U184 ( .B0(n263), .B1(n240), .A0N(REG1[7]), .A1N(n241), .Y(n64)
         );
  OAI2BB2X1M U185 ( .B0(n269), .B1(n238), .A0N(REG2[1]), .A1N(n239), .Y(n66)
         );
  OAI2BB2X1M U186 ( .B0(n268), .B1(n238), .A0N(REG2[2]), .A1N(n239), .Y(n67)
         );
  OAI2BB2X1M U187 ( .B0(n267), .B1(n238), .A0N(REG2[3]), .A1N(n239), .Y(n68)
         );
  OAI2BB2X1M U188 ( .B0(n266), .B1(n238), .A0N(REG2[4]), .A1N(n239), .Y(n69)
         );
  OAI2BB2X1M U189 ( .B0(n264), .B1(n238), .A0N(REG2[6]), .A1N(n239), .Y(n71)
         );
  OAI2BB2X1M U190 ( .B0(n270), .B1(n237), .A0N(REG3[0]), .A1N(n237), .Y(n73)
         );
  OAI2BB2X1M U191 ( .B0(n269), .B1(n236), .A0N(REG3[1]), .A1N(n237), .Y(n74)
         );
  OAI2BB2X1M U192 ( .B0(n268), .B1(n236), .A0N(REG3[2]), .A1N(n237), .Y(n75)
         );
  OAI2BB2X1M U193 ( .B0(n267), .B1(n236), .A0N(REG3[3]), .A1N(n237), .Y(n76)
         );
  OAI2BB2X1M U194 ( .B0(n266), .B1(n236), .A0N(REG3[4]), .A1N(n237), .Y(n77)
         );
  OAI2BB2X1M U195 ( .B0(n264), .B1(n236), .A0N(REG3[6]), .A1N(n237), .Y(n79)
         );
  OAI2BB2X1M U196 ( .B0(n263), .B1(n236), .A0N(REG3[7]), .A1N(n237), .Y(n80)
         );
  OAI2BB2X1M U197 ( .B0(n270), .B1(n235), .A0N(regArr_4__0_), .A1N(n235), .Y(
        n81) );
  OAI2BB2X1M U198 ( .B0(n269), .B1(n234), .A0N(regArr_4__1_), .A1N(n235), .Y(
        n82) );
  OAI2BB2X1M U199 ( .B0(n268), .B1(n234), .A0N(regArr_4__2_), .A1N(n235), .Y(
        n83) );
  OAI2BB2X1M U200 ( .B0(n267), .B1(n234), .A0N(regArr_4__3_), .A1N(n235), .Y(
        n84) );
  OAI2BB2X1M U201 ( .B0(n266), .B1(n234), .A0N(regArr_4__4_), .A1N(n235), .Y(
        n85) );
  OAI2BB2X1M U202 ( .B0(n264), .B1(n234), .A0N(regArr_4__6_), .A1N(n235), .Y(
        n87) );
  OAI2BB2X1M U203 ( .B0(n263), .B1(n234), .A0N(regArr_4__7_), .A1N(n235), .Y(
        n88) );
  OAI2BB2X1M U204 ( .B0(n270), .B1(n233), .A0N(regArr_5__0_), .A1N(n233), .Y(
        n89) );
  OAI2BB2X1M U205 ( .B0(n269), .B1(n232), .A0N(regArr_5__1_), .A1N(n233), .Y(
        n90) );
  OAI2BB2X1M U206 ( .B0(n268), .B1(n232), .A0N(regArr_5__2_), .A1N(n233), .Y(
        n91) );
  OAI2BB2X1M U207 ( .B0(n267), .B1(n232), .A0N(regArr_5__3_), .A1N(n233), .Y(
        n92) );
  OAI2BB2X1M U208 ( .B0(n266), .B1(n232), .A0N(regArr_5__4_), .A1N(n233), .Y(
        n93) );
  OAI2BB2X1M U209 ( .B0(n264), .B1(n232), .A0N(regArr_5__6_), .A1N(n233), .Y(
        n95) );
  OAI2BB2X1M U210 ( .B0(n263), .B1(n232), .A0N(regArr_5__7_), .A1N(n233), .Y(
        n96) );
  OAI2BB2X1M U211 ( .B0(n270), .B1(n231), .A0N(regArr_6__0_), .A1N(n231), .Y(
        n97) );
  OAI2BB2X1M U212 ( .B0(n269), .B1(n230), .A0N(regArr_6__1_), .A1N(n231), .Y(
        n98) );
  OAI2BB2X1M U213 ( .B0(n268), .B1(n230), .A0N(regArr_6__2_), .A1N(n231), .Y(
        n99) );
  OAI2BB2X1M U214 ( .B0(n267), .B1(n230), .A0N(regArr_6__3_), .A1N(n231), .Y(
        n100) );
  OAI2BB2X1M U215 ( .B0(n266), .B1(n230), .A0N(regArr_6__4_), .A1N(n231), .Y(
        n101) );
  OAI2BB2X1M U216 ( .B0(n264), .B1(n230), .A0N(regArr_6__6_), .A1N(n231), .Y(
        n103) );
  OAI2BB2X1M U217 ( .B0(n263), .B1(n230), .A0N(regArr_6__7_), .A1N(n231), .Y(
        n104) );
  OAI2BB2X1M U218 ( .B0(n270), .B1(n229), .A0N(regArr_7__0_), .A1N(n229), .Y(
        n105) );
  OAI2BB2X1M U219 ( .B0(n269), .B1(n228), .A0N(regArr_7__1_), .A1N(n229), .Y(
        n106) );
  OAI2BB2X1M U220 ( .B0(n268), .B1(n228), .A0N(regArr_7__2_), .A1N(n229), .Y(
        n107) );
  OAI2BB2X1M U221 ( .B0(n267), .B1(n228), .A0N(regArr_7__3_), .A1N(n229), .Y(
        n108) );
  OAI2BB2X1M U222 ( .B0(n266), .B1(n228), .A0N(regArr_7__4_), .A1N(n229), .Y(
        n109) );
  OAI2BB2X1M U223 ( .B0(n264), .B1(n228), .A0N(regArr_7__6_), .A1N(n229), .Y(
        n111) );
  OAI2BB2X1M U224 ( .B0(n263), .B1(n228), .A0N(regArr_7__7_), .A1N(n229), .Y(
        n112) );
  OAI2BB2X1M U225 ( .B0(n265), .B1(n240), .A0N(REG1[5]), .A1N(n241), .Y(n62)
         );
  OAI2BB2X1M U226 ( .B0(n265), .B1(n238), .A0N(REG2[5]), .A1N(n239), .Y(n70)
         );
  OAI2BB2X1M U227 ( .B0(n265), .B1(n234), .A0N(regArr_4__5_), .A1N(n235), .Y(
        n86) );
  OAI2BB2X1M U228 ( .B0(n265), .B1(n232), .A0N(regArr_5__5_), .A1N(n233), .Y(
        n94) );
  OAI2BB2X1M U229 ( .B0(n265), .B1(n230), .A0N(regArr_6__5_), .A1N(n231), .Y(
        n102) );
  OAI2BB2X1M U230 ( .B0(n265), .B1(n228), .A0N(regArr_7__5_), .A1N(n229), .Y(
        n110) );
  OAI2BB2X1M U231 ( .B0(n270), .B1(n239), .A0N(REG2[0]), .A1N(n239), .Y(n65)
         );
  OAI2BB2X1M U232 ( .B0(n263), .B1(n238), .A0N(REG2[7]), .A1N(n239), .Y(n72)
         );
  OAI2BB2X1M U233 ( .B0(n265), .B1(n236), .A0N(REG3[5]), .A1N(n237), .Y(n78)
         );
  MX4X1M U234 ( .A(regArr_4__2_), .B(regArr_5__2_), .C(regArr_6__2_), .D(
        regArr_7__2_), .S0(n210), .S1(n207), .Y(n185) );
  MX4X1M U235 ( .A(regArr_4__3_), .B(regArr_5__3_), .C(regArr_6__3_), .D(
        regArr_7__3_), .S0(n210), .S1(n207), .Y(n189) );
  MX4X1M U236 ( .A(regArr_4__4_), .B(regArr_5__4_), .C(regArr_6__4_), .D(
        regArr_7__4_), .S0(n210), .S1(n207), .Y(n193) );
  MX4X1M U237 ( .A(regArr_4__5_), .B(regArr_5__5_), .C(regArr_6__5_), .D(
        regArr_7__5_), .S0(n211), .S1(n208), .Y(n197) );
  MX4X1M U238 ( .A(regArr_4__6_), .B(regArr_5__6_), .C(regArr_6__6_), .D(
        regArr_7__6_), .S0(n211), .S1(n208), .Y(n201) );
  MX4X1M U239 ( .A(regArr_4__7_), .B(regArr_5__7_), .C(regArr_6__7_), .D(
        regArr_7__7_), .S0(n211), .S1(n208), .Y(n205) );
  MX4X1M U240 ( .A(regArr_12__2_), .B(regArr_13__2_), .C(regArr_14__2_), .D(
        regArr_15__2_), .S0(n210), .S1(n207), .Y(n183) );
  MX4X1M U241 ( .A(regArr_12__3_), .B(regArr_13__3_), .C(regArr_14__3_), .D(
        regArr_15__3_), .S0(n210), .S1(n207), .Y(n187) );
  MX4X1M U242 ( .A(regArr_12__4_), .B(regArr_13__4_), .C(regArr_14__4_), .D(
        regArr_15__4_), .S0(n210), .S1(n207), .Y(n191) );
  MX4X1M U243 ( .A(regArr_12__5_), .B(regArr_13__5_), .C(regArr_14__5_), .D(
        regArr_15__5_), .S0(n211), .S1(n208), .Y(n195) );
  MX4X1M U244 ( .A(regArr_12__6_), .B(regArr_13__6_), .C(regArr_14__6_), .D(
        regArr_15__6_), .S0(n211), .S1(n208), .Y(n199) );
  MX4X1M U245 ( .A(regArr_12__7_), .B(regArr_13__7_), .C(regArr_14__7_), .D(
        regArr_15__7_), .S0(n211), .S1(n208), .Y(n203) );
  MX4X1M U246 ( .A(regArr_4__0_), .B(regArr_5__0_), .C(regArr_6__0_), .D(
        regArr_7__0_), .S0(Address[0]), .S1(Address[1]), .Y(n177) );
  MX4X1M U247 ( .A(regArr_4__1_), .B(regArr_5__1_), .C(regArr_6__1_), .D(
        regArr_7__1_), .S0(Address[0]), .S1(n207), .Y(n181) );
  MX4X1M U248 ( .A(regArr_12__0_), .B(regArr_13__0_), .C(regArr_14__0_), .D(
        regArr_15__0_), .S0(n209), .S1(n208), .Y(n10) );
  MX4X1M U249 ( .A(regArr_12__1_), .B(regArr_13__1_), .C(regArr_14__1_), .D(
        regArr_15__1_), .S0(n245), .S1(n207), .Y(n179) );
  AO22X1M U250 ( .A0(N42), .A1(n262), .B0(RdData[0]), .B1(n244), .Y(n40) );
  MX4X1M U251 ( .A(n178), .B(n11), .C(n177), .D(n10), .S0(Address[3]), .S1(
        Address[2]), .Y(N42) );
  MX4X1M U252 ( .A(regArr_8__0_), .B(regArr_9__0_), .C(regArr_10__0_), .D(
        regArr_11__0_), .S0(Address[0]), .S1(n208), .Y(n11) );
  AO22X1M U253 ( .A0(N41), .A1(n262), .B0(RdData[1]), .B1(n244), .Y(n41) );
  MX4X1M U254 ( .A(n182), .B(n180), .C(n181), .D(n179), .S0(Address[3]), .S1(
        Address[2]), .Y(N41) );
  MX4X1M U255 ( .A(regArr_8__1_), .B(regArr_9__1_), .C(regArr_10__1_), .D(
        regArr_11__1_), .S0(n209), .S1(Address[1]), .Y(n180) );
  AO22X1M U256 ( .A0(N40), .A1(n262), .B0(RdData[2]), .B1(n244), .Y(n42) );
  MX4X1M U257 ( .A(n186), .B(n184), .C(n185), .D(n183), .S0(Address[3]), .S1(
        Address[2]), .Y(N40) );
  MX4XLM U258 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n210), 
        .S1(n207), .Y(n186) );
  MX4X1M U259 ( .A(regArr_8__2_), .B(regArr_9__2_), .C(regArr_10__2_), .D(
        regArr_11__2_), .S0(n210), .S1(n207), .Y(n184) );
  AO22X1M U260 ( .A0(N39), .A1(n262), .B0(RdData[3]), .B1(n244), .Y(n43) );
  MX4X1M U261 ( .A(n190), .B(n188), .C(n189), .D(n187), .S0(Address[3]), .S1(
        Address[2]), .Y(N39) );
  MX4XLM U262 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n210), 
        .S1(n207), .Y(n190) );
  MX4X1M U263 ( .A(regArr_8__3_), .B(regArr_9__3_), .C(regArr_10__3_), .D(
        regArr_11__3_), .S0(n210), .S1(n207), .Y(n188) );
  AO22X1M U264 ( .A0(N38), .A1(n262), .B0(RdData[4]), .B1(n244), .Y(n44) );
  MX4X1M U265 ( .A(n194), .B(n192), .C(n193), .D(n191), .S0(Address[3]), .S1(
        Address[2]), .Y(N38) );
  MX4X1M U266 ( .A(regArr_8__4_), .B(regArr_9__4_), .C(regArr_10__4_), .D(
        regArr_11__4_), .S0(n210), .S1(n207), .Y(n192) );
  AO22X1M U267 ( .A0(N37), .A1(n262), .B0(RdData[5]), .B1(n244), .Y(n45) );
  MX4X1M U268 ( .A(n198), .B(n196), .C(n197), .D(n195), .S0(Address[3]), .S1(
        Address[2]), .Y(N37) );
  MX4XLM U269 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n211), 
        .S1(n208), .Y(n198) );
  MX4X1M U270 ( .A(regArr_8__5_), .B(regArr_9__5_), .C(regArr_10__5_), .D(
        regArr_11__5_), .S0(n211), .S1(n208), .Y(n196) );
  AO22X1M U271 ( .A0(N36), .A1(n262), .B0(RdData[6]), .B1(n244), .Y(n46) );
  MX4XLM U272 ( .A(n202), .B(n200), .C(n201), .D(n199), .S0(Address[3]), .S1(
        Address[2]), .Y(N36) );
  MX4XLM U273 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n211), 
        .S1(n208), .Y(n202) );
  MX4X1M U274 ( .A(regArr_8__6_), .B(regArr_9__6_), .C(regArr_10__6_), .D(
        regArr_11__6_), .S0(n211), .S1(n208), .Y(n200) );
  AO22X1M U275 ( .A0(N35), .A1(n262), .B0(RdData[7]), .B1(n244), .Y(n47) );
  MX4XLM U276 ( .A(n206), .B(n204), .C(n205), .D(n203), .S0(Address[3]), .S1(
        Address[2]), .Y(N35) );
  MX4X1M U277 ( .A(regArr_8__7_), .B(regArr_9__7_), .C(regArr_10__7_), .D(
        regArr_11__7_), .S0(n211), .S1(n208), .Y(n204) );
  CLKBUFX6M U278 ( .A(n12), .Y(n244) );
  NAND2BX2M U279 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  OAI2BB1X2M U280 ( .A0N(RdData_VLD), .A1N(n13), .B0(n244), .Y(n48) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   n14, u_div_SumTmp_1__0_, u_div_SumTmp_1__1_, u_div_SumTmp_1__2_,
         u_div_SumTmp_1__3_, u_div_SumTmp_1__4_, u_div_SumTmp_1__5_,
         u_div_SumTmp_1__6_, u_div_SumTmp_2__0_, u_div_SumTmp_2__1_,
         u_div_SumTmp_2__2_, u_div_SumTmp_2__3_, u_div_SumTmp_2__4_,
         u_div_SumTmp_2__5_, u_div_SumTmp_3__0_, u_div_SumTmp_3__1_,
         u_div_SumTmp_3__2_, u_div_SumTmp_3__3_, u_div_SumTmp_3__4_,
         u_div_SumTmp_4__0_, u_div_SumTmp_4__1_, u_div_SumTmp_4__2_,
         u_div_SumTmp_4__3_, u_div_SumTmp_5__0_, u_div_SumTmp_5__1_,
         u_div_SumTmp_5__2_, u_div_SumTmp_6__0_, u_div_SumTmp_6__1_,
         u_div_SumTmp_7__0_, u_div_CryTmp_0__1_, u_div_CryTmp_0__2_,
         u_div_CryTmp_0__3_, u_div_CryTmp_0__4_, u_div_CryTmp_0__5_,
         u_div_CryTmp_0__6_, u_div_CryTmp_0__7_, u_div_CryTmp_1__1_,
         u_div_CryTmp_1__2_, u_div_CryTmp_1__3_, u_div_CryTmp_1__4_,
         u_div_CryTmp_1__5_, u_div_CryTmp_1__6_, u_div_CryTmp_1__7_,
         u_div_CryTmp_2__1_, u_div_CryTmp_2__2_, u_div_CryTmp_2__3_,
         u_div_CryTmp_2__4_, u_div_CryTmp_2__5_, u_div_CryTmp_2__6_,
         u_div_CryTmp_3__1_, u_div_CryTmp_3__2_, u_div_CryTmp_3__3_,
         u_div_CryTmp_3__4_, u_div_CryTmp_3__5_, u_div_CryTmp_4__1_,
         u_div_CryTmp_4__2_, u_div_CryTmp_4__3_, u_div_CryTmp_4__4_,
         u_div_CryTmp_5__1_, u_div_CryTmp_5__2_, u_div_CryTmp_5__3_,
         u_div_CryTmp_6__1_, u_div_CryTmp_6__2_, u_div_CryTmp_7__1_,
         u_div_PartRem_1__1_, u_div_PartRem_1__2_, u_div_PartRem_1__3_,
         u_div_PartRem_1__4_, u_div_PartRem_1__5_, u_div_PartRem_1__6_,
         u_div_PartRem_1__7_, u_div_PartRem_2__1_, u_div_PartRem_2__2_,
         u_div_PartRem_2__3_, u_div_PartRem_2__4_, u_div_PartRem_2__5_,
         u_div_PartRem_2__6_, u_div_PartRem_3__1_, u_div_PartRem_3__2_,
         u_div_PartRem_3__3_, u_div_PartRem_3__4_, u_div_PartRem_3__5_,
         u_div_PartRem_4__1_, u_div_PartRem_4__2_, u_div_PartRem_4__3_,
         u_div_PartRem_4__4_, u_div_PartRem_5__1_, u_div_PartRem_5__2_,
         u_div_PartRem_5__3_, u_div_PartRem_6__1_, u_div_PartRem_6__2_,
         u_div_PartRem_7__1_, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13;

  ADDFHX4M u_div_u_fa_PartRem_0_0_6 ( .A(u_div_PartRem_1__6_), .B(n4), .CI(
        u_div_CryTmp_0__6_), .CO(u_div_CryTmp_0__7_) );
  ADDFHX8M u_div_u_fa_PartRem_0_1_5 ( .A(u_div_PartRem_2__5_), .B(n5), .CI(
        u_div_CryTmp_1__5_), .CO(u_div_CryTmp_1__6_), .S(u_div_SumTmp_1__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_0_5 ( .A(u_div_PartRem_1__5_), .B(n5), .CI(
        u_div_CryTmp_0__5_), .CO(u_div_CryTmp_0__6_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_2 ( .A(u_div_PartRem_1__2_), .B(n8), .CI(
        u_div_CryTmp_0__2_), .CO(u_div_CryTmp_0__3_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_1 ( .A(u_div_PartRem_1__1_), .B(n9), .CI(
        u_div_CryTmp_0__1_), .CO(u_div_CryTmp_0__2_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_3 ( .A(u_div_PartRem_1__3_), .B(n7), .CI(
        u_div_CryTmp_0__3_), .CO(u_div_CryTmp_0__4_) );
  ADDFX2M u_div_u_fa_PartRem_0_5_2 ( .A(u_div_PartRem_6__2_), .B(n8), .CI(
        u_div_CryTmp_5__2_), .CO(u_div_CryTmp_5__3_), .S(u_div_SumTmp_5__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_3 ( .A(u_div_PartRem_5__3_), .B(n7), .CI(
        u_div_CryTmp_4__3_), .CO(u_div_CryTmp_4__4_), .S(u_div_SumTmp_4__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_5 ( .A(u_div_PartRem_3__5_), .B(n5), .CI(
        u_div_CryTmp_2__5_), .CO(u_div_CryTmp_2__6_), .S(u_div_SumTmp_2__5_)
         );
  ADDFHX2M u_div_u_fa_PartRem_0_1_6 ( .A(u_div_PartRem_2__6_), .B(n4), .CI(
        u_div_CryTmp_1__6_), .CO(u_div_CryTmp_1__7_), .S(u_div_SumTmp_1__6_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_3 ( .A(u_div_PartRem_4__3_), .B(n7), .CI(
        u_div_CryTmp_3__3_), .CO(u_div_CryTmp_3__4_), .S(u_div_SumTmp_3__3_)
         );
  ADDFHX2M u_div_u_fa_PartRem_0_1_3 ( .A(u_div_PartRem_2__3_), .B(n7), .CI(
        u_div_CryTmp_1__3_), .CO(u_div_CryTmp_1__4_), .S(u_div_SumTmp_1__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_2 ( .A(u_div_PartRem_4__2_), .B(n8), .CI(
        u_div_CryTmp_3__2_), .CO(u_div_CryTmp_3__3_), .S(u_div_SumTmp_3__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_3 ( .A(u_div_PartRem_3__3_), .B(n7), .CI(
        u_div_CryTmp_2__3_), .CO(u_div_CryTmp_2__4_), .S(u_div_SumTmp_2__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_2 ( .A(u_div_PartRem_2__2_), .B(n8), .CI(
        u_div_CryTmp_1__2_), .CO(u_div_CryTmp_1__3_), .S(u_div_SumTmp_1__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_2 ( .A(u_div_PartRem_3__2_), .B(n8), .CI(
        u_div_CryTmp_2__2_), .CO(u_div_CryTmp_2__3_), .S(u_div_SumTmp_2__2_)
         );
  ADDFHX8M u_div_u_fa_PartRem_0_1_1 ( .A(u_div_PartRem_2__1_), .B(n9), .CI(
        u_div_CryTmp_1__1_), .CO(u_div_CryTmp_1__2_), .S(u_div_SumTmp_1__1_)
         );
  ADDFHX8M u_div_u_fa_PartRem_0_2_1 ( .A(u_div_PartRem_3__1_), .B(n9), .CI(
        u_div_CryTmp_2__1_), .CO(u_div_CryTmp_2__2_), .S(u_div_SumTmp_2__1_)
         );
  ADDFHX8M u_div_u_fa_PartRem_0_0_7 ( .A(u_div_PartRem_1__7_), .B(n3), .CI(
        u_div_CryTmp_0__7_), .CO(quotient[0]) );
  ADDFHX4M u_div_u_fa_PartRem_0_2_4 ( .A(u_div_PartRem_3__4_), .B(n6), .CI(
        u_div_CryTmp_2__4_), .CO(u_div_CryTmp_2__5_), .S(u_div_SumTmp_2__4_)
         );
  ADDFHX4M u_div_u_fa_PartRem_0_3_4 ( .A(u_div_PartRem_4__4_), .B(n6), .CI(
        u_div_CryTmp_3__4_), .CO(u_div_CryTmp_3__5_), .S(u_div_SumTmp_3__4_)
         );
  ADDFHX8M u_div_u_fa_PartRem_0_0_4 ( .A(u_div_PartRem_1__4_), .B(n6), .CI(
        u_div_CryTmp_0__4_), .CO(u_div_CryTmp_0__5_) );
  ADDFHX8M u_div_u_fa_PartRem_0_1_4 ( .A(u_div_PartRem_2__4_), .B(n6), .CI(
        u_div_CryTmp_1__4_), .CO(u_div_CryTmp_1__5_), .S(u_div_SumTmp_1__4_)
         );
  ADDFHX4M u_div_u_fa_PartRem_0_3_1 ( .A(u_div_PartRem_4__1_), .B(n9), .CI(
        u_div_CryTmp_3__1_), .CO(u_div_CryTmp_3__2_), .S(u_div_SumTmp_3__1_)
         );
  ADDFHX8M u_div_u_fa_PartRem_0_4_1 ( .A(u_div_PartRem_5__1_), .B(n9), .CI(
        u_div_CryTmp_4__1_), .CO(u_div_CryTmp_4__2_), .S(u_div_SumTmp_4__1_)
         );
  ADDFHX8M u_div_u_fa_PartRem_0_5_1 ( .A(u_div_PartRem_6__1_), .B(n9), .CI(
        u_div_CryTmp_5__1_), .CO(u_div_CryTmp_5__2_), .S(u_div_SumTmp_5__1_)
         );
  ADDFHX4M u_div_u_fa_PartRem_0_6_1 ( .A(u_div_PartRem_7__1_), .B(n9), .CI(
        u_div_CryTmp_6__1_), .CO(u_div_CryTmp_6__2_), .S(u_div_SumTmp_6__1_)
         );
  ADDFX4M u_div_u_fa_PartRem_0_4_2 ( .A(u_div_PartRem_5__2_), .B(n8), .CI(
        u_div_CryTmp_4__2_), .CO(u_div_CryTmp_4__3_), .S(u_div_SumTmp_4__2_)
         );
  MX2X1M U1 ( .A(u_div_PartRem_5__2_), .B(u_div_SumTmp_4__2_), .S0(quotient[4]), .Y(u_div_PartRem_4__3_) );
  CLKMX2X12M U2 ( .A(u_div_PartRem_6__1_), .B(u_div_SumTmp_5__1_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__2_) );
  MX2X1M U3 ( .A(u_div_PartRem_5__1_), .B(u_div_SumTmp_4__1_), .S0(quotient[4]), .Y(u_div_PartRem_4__2_) );
  MX2X12M U4 ( .A(a[5]), .B(u_div_SumTmp_5__0_), .S0(quotient[5]), .Y(
        u_div_PartRem_5__1_) );
  MX2X12M U5 ( .A(a[6]), .B(u_div_SumTmp_6__0_), .S0(quotient[6]), .Y(
        u_div_PartRem_6__1_) );
  MX2X6M U6 ( .A(a[7]), .B(u_div_SumTmp_7__0_), .S0(quotient[7]), .Y(
        u_div_PartRem_7__1_) );
  XNOR2X2M U7 ( .A(n10), .B(a[7]), .Y(u_div_SumTmp_7__0_) );
  AND3X12M U8 ( .A(u_div_CryTmp_7__1_), .B(n8), .C(n9), .Y(n2) );
  INVX10M U9 ( .A(b[1]), .Y(n9) );
  INVX20M U10 ( .A(b[4]), .Y(n6) );
  CLKMX2X12M U11 ( .A(u_div_PartRem_3__1_), .B(u_div_SumTmp_2__1_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__2_) );
  MX2X6M U12 ( .A(a[3]), .B(u_div_SumTmp_3__0_), .S0(quotient[3]), .Y(
        u_div_PartRem_3__1_) );
  MX2XLM U13 ( .A(u_div_PartRem_2__1_), .B(u_div_SumTmp_1__1_), .S0(n14), .Y(
        u_div_PartRem_1__2_) );
  MX2X12M U14 ( .A(a[2]), .B(u_div_SumTmp_2__0_), .S0(quotient[2]), .Y(
        u_div_PartRem_2__1_) );
  OR2X8M U15 ( .A(a[7]), .B(n10), .Y(u_div_CryTmp_7__1_) );
  OR2X8M U16 ( .A(a[6]), .B(n10), .Y(u_div_CryTmp_6__1_) );
  XNOR2X8M U17 ( .A(n10), .B(a[6]), .Y(u_div_SumTmp_6__0_) );
  OR2X8M U18 ( .A(a[5]), .B(n10), .Y(u_div_CryTmp_5__1_) );
  XNOR2X8M U19 ( .A(n10), .B(a[5]), .Y(u_div_SumTmp_5__0_) );
  INVX32M U20 ( .A(b[0]), .Y(n10) );
  AND2X12M U21 ( .A(n11), .B(n2), .Y(quotient[7]) );
  AND3X12M U22 ( .A(n11), .B(n8), .C(u_div_CryTmp_6__2_), .Y(quotient[6]) );
  AND2X12M U23 ( .A(u_div_CryTmp_5__3_), .B(n11), .Y(quotient[5]) );
  CLKAND2X6M U24 ( .A(n12), .B(n7), .Y(n11) );
  INVX32M U25 ( .A(b[3]), .Y(n7) );
  AND3X12M U26 ( .A(n13), .B(n5), .C(u_div_CryTmp_3__5_), .Y(quotient[3]) );
  AND2X12M U27 ( .A(u_div_CryTmp_2__6_), .B(n13), .Y(quotient[2]) );
  AND3X12M U28 ( .A(n13), .B(n6), .C(n5), .Y(n12) );
  NOR2X12M U29 ( .A(b[6]), .B(b[7]), .Y(n13) );
  MX2X2M U30 ( .A(a[1]), .B(u_div_SumTmp_1__0_), .S0(n14), .Y(
        u_div_PartRem_1__1_) );
  INVX6M U31 ( .A(b[2]), .Y(n8) );
  AND2X6M U32 ( .A(u_div_CryTmp_4__4_), .B(n12), .Y(quotient[4]) );
  CLKBUFX3M U33 ( .A(n14), .Y(quotient[1]) );
  INVX32M U34 ( .A(b[5]), .Y(n5) );
  XNOR2X1M U35 ( .A(n10), .B(a[2]), .Y(u_div_SumTmp_2__0_) );
  XNOR2X1M U36 ( .A(n10), .B(a[3]), .Y(u_div_SumTmp_3__0_) );
  XNOR2X1M U37 ( .A(n10), .B(a[4]), .Y(u_div_SumTmp_4__0_) );
  OR2X1M U38 ( .A(a[4]), .B(n10), .Y(u_div_CryTmp_4__1_) );
  OR2X1M U39 ( .A(a[3]), .B(n10), .Y(u_div_CryTmp_3__1_) );
  OR2X1M U40 ( .A(a[1]), .B(n10), .Y(u_div_CryTmp_1__1_) );
  OR2X1M U41 ( .A(a[2]), .B(n10), .Y(u_div_CryTmp_2__1_) );
  XNOR2X1M U42 ( .A(n10), .B(a[1]), .Y(u_div_SumTmp_1__0_) );
  INVX1M U43 ( .A(b[7]), .Y(n3) );
  NAND2BX2M U44 ( .AN(a[0]), .B(b[0]), .Y(u_div_CryTmp_0__1_) );
  INVX2M U45 ( .A(b[6]), .Y(n4) );
  AND2X12M U46 ( .A(u_div_CryTmp_1__7_), .B(n3), .Y(n14) );
  CLKMX2X2M U47 ( .A(u_div_PartRem_2__6_), .B(u_div_SumTmp_1__6_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__7_) );
  CLKMX2X2M U48 ( .A(u_div_PartRem_3__5_), .B(u_div_SumTmp_2__5_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__6_) );
  CLKMX2X2M U49 ( .A(u_div_PartRem_4__4_), .B(u_div_SumTmp_3__4_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__5_) );
  CLKMX2X2M U50 ( .A(u_div_PartRem_5__3_), .B(u_div_SumTmp_4__3_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__4_) );
  CLKMX2X2M U51 ( .A(u_div_PartRem_6__2_), .B(u_div_SumTmp_5__2_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__3_) );
  CLKMX2X2M U52 ( .A(u_div_PartRem_7__1_), .B(u_div_SumTmp_6__1_), .S0(
        quotient[6]), .Y(u_div_PartRem_6__2_) );
  CLKMX2X2M U53 ( .A(u_div_PartRem_2__5_), .B(u_div_SumTmp_1__5_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__6_) );
  CLKMX2X2M U54 ( .A(u_div_PartRem_3__4_), .B(u_div_SumTmp_2__4_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__5_) );
  CLKMX2X2M U55 ( .A(u_div_PartRem_4__3_), .B(u_div_SumTmp_3__3_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__4_) );
  CLKMX2X2M U56 ( .A(u_div_PartRem_2__4_), .B(u_div_SumTmp_1__4_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__5_) );
  CLKMX2X2M U57 ( .A(u_div_PartRem_3__3_), .B(u_div_SumTmp_2__3_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__4_) );
  CLKMX2X2M U58 ( .A(u_div_PartRem_4__2_), .B(u_div_SumTmp_3__2_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__3_) );
  CLKMX2X2M U59 ( .A(u_div_PartRem_2__3_), .B(u_div_SumTmp_1__3_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__4_) );
  CLKMX2X2M U60 ( .A(u_div_PartRem_3__2_), .B(u_div_SumTmp_2__2_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__3_) );
  CLKMX2X2M U61 ( .A(u_div_PartRem_4__1_), .B(u_div_SumTmp_3__1_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__2_) );
  CLKMX2X2M U62 ( .A(a[4]), .B(u_div_SumTmp_4__0_), .S0(quotient[4]), .Y(
        u_div_PartRem_4__1_) );
  CLKMX2X2M U63 ( .A(u_div_PartRem_2__2_), .B(u_div_SumTmp_1__2_), .S0(n14), 
        .Y(u_div_PartRem_1__3_) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:1] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVXLM U1 ( .A(B[1]), .Y(n7) );
  INVXLM U2 ( .A(B[4]), .Y(n4) );
  INVXLM U3 ( .A(B[5]), .Y(n3) );
  INVXLM U4 ( .A(B[2]), .Y(n6) );
  INVXLM U5 ( .A(B[3]), .Y(n5) );
  INVXLM U6 ( .A(B[7]), .Y(n1) );
  CLKINVX1M U7 ( .A(B[0]), .Y(n8) );
  INVX2M U8 ( .A(B[6]), .Y(n2) );
  XNOR2X2M U9 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  OR2X2M U10 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  CLKINVX1M U11 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [7:2] carry;

  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26;

  OAI21BX4M U2 ( .A0(n19), .A1(n20), .B0N(n21), .Y(n17) );
  AOI2BB1X2M U3 ( .A0N(n8), .A1N(n11), .B0(n10), .Y(n24) );
  NOR2X2M U4 ( .A(B[8]), .B(A[8]), .Y(n14) );
  NOR2X2M U5 ( .A(B[9]), .B(A[9]), .Y(n11) );
  NOR2X2M U6 ( .A(B[10]), .B(A[10]), .Y(n23) );
  NOR2X2M U7 ( .A(B[11]), .B(A[11]), .Y(n19) );
  NAND2X2M U8 ( .A(A[7]), .B(B[7]), .Y(n13) );
  INVX2M U9 ( .A(A[6]), .Y(n7) );
  CLKXOR2X2M U10 ( .A(B[13]), .B(n16), .Y(SUM[13]) );
  INVX2M U11 ( .A(n7), .Y(SUM[6]) );
  CLKXOR2X2M U12 ( .A(A[7]), .B(B[7]), .Y(SUM[7]) );
  BUFX2M U13 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U14 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U15 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U16 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U17 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U18 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U19 ( .A(n8), .B(n9), .Y(SUM[9]) );
  NOR2X1M U20 ( .A(n10), .B(n11), .Y(n9) );
  CLKXOR2X2M U21 ( .A(n12), .B(n13), .Y(SUM[8]) );
  NAND2BX1M U22 ( .AN(n14), .B(n15), .Y(n12) );
  OAI2BB1X1M U23 ( .A0N(n17), .A1N(A[12]), .B0(n18), .Y(n16) );
  OAI21X1M U24 ( .A0(A[12]), .A1(n17), .B0(B[12]), .Y(n18) );
  XOR3XLM U25 ( .A(B[12]), .B(A[12]), .C(n17), .Y(SUM[12]) );
  XNOR2X1M U26 ( .A(n20), .B(n22), .Y(SUM[11]) );
  NOR2X1M U27 ( .A(n21), .B(n19), .Y(n22) );
  AND2X1M U28 ( .A(B[11]), .B(A[11]), .Y(n21) );
  OA21X1M U29 ( .A0(n23), .A1(n24), .B0(n25), .Y(n20) );
  CLKXOR2X2M U30 ( .A(n26), .B(n24), .Y(SUM[10]) );
  AND2X1M U31 ( .A(B[9]), .B(A[9]), .Y(n10) );
  OA21X1M U32 ( .A0(n13), .A1(n14), .B0(n15), .Y(n8) );
  CLKNAND2X2M U33 ( .A(B[8]), .B(A[8]), .Y(n15) );
  NAND2BX1M U34 ( .AN(n23), .B(n25), .Y(n26) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n25) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   ab_7__7_, ab_7__6_, ab_7__5_, ab_7__4_, ab_7__3_, ab_7__2_, ab_7__1_,
         ab_7__0_, ab_6__7_, ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_, ab_6__2_,
         ab_6__1_, ab_6__0_, ab_5__7_, ab_5__6_, ab_5__5_, ab_5__4_, ab_5__3_,
         ab_5__2_, ab_5__1_, ab_5__0_, ab_4__7_, ab_4__6_, ab_4__5_, ab_4__4_,
         ab_4__3_, ab_4__2_, ab_4__1_, ab_4__0_, ab_3__7_, ab_3__6_, ab_3__5_,
         ab_3__4_, ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_, ab_2__7_, ab_2__6_,
         ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_, ab_2__0_, ab_1__7_,
         ab_1__6_, ab_1__5_, ab_1__4_, ab_1__3_, ab_1__2_, ab_1__1_, ab_1__0_,
         ab_0__7_, ab_0__6_, ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, ab_0__1_,
         CARRYB_7__6_, CARRYB_7__5_, CARRYB_7__4_, CARRYB_7__3_, CARRYB_7__2_,
         CARRYB_7__1_, CARRYB_7__0_, CARRYB_6__6_, CARRYB_6__5_, CARRYB_6__4_,
         CARRYB_6__3_, CARRYB_6__2_, CARRYB_6__1_, CARRYB_6__0_, CARRYB_5__6_,
         CARRYB_5__5_, CARRYB_5__4_, CARRYB_5__3_, CARRYB_5__2_, CARRYB_5__1_,
         CARRYB_5__0_, CARRYB_4__6_, CARRYB_4__5_, CARRYB_4__4_, CARRYB_4__3_,
         CARRYB_4__2_, CARRYB_4__1_, CARRYB_4__0_, CARRYB_3__6_, CARRYB_3__5_,
         CARRYB_3__4_, CARRYB_3__3_, CARRYB_3__2_, CARRYB_3__1_, CARRYB_3__0_,
         CARRYB_2__6_, CARRYB_2__5_, CARRYB_2__4_, CARRYB_2__3_, CARRYB_2__2_,
         CARRYB_2__1_, CARRYB_2__0_, SUMB_7__6_, SUMB_7__5_, SUMB_7__4_,
         SUMB_7__3_, SUMB_7__2_, SUMB_7__1_, SUMB_7__0_, SUMB_6__6_,
         SUMB_6__5_, SUMB_6__4_, SUMB_6__3_, SUMB_6__2_, SUMB_6__1_,
         SUMB_5__6_, SUMB_5__5_, SUMB_5__4_, SUMB_5__3_, SUMB_5__2_,
         SUMB_5__1_, SUMB_4__6_, SUMB_4__5_, SUMB_4__4_, SUMB_4__3_,
         SUMB_4__2_, SUMB_4__1_, SUMB_3__6_, SUMB_3__5_, SUMB_3__4_,
         SUMB_3__3_, SUMB_3__2_, SUMB_3__1_, SUMB_2__6_, SUMB_2__5_,
         SUMB_2__4_, SUMB_2__3_, SUMB_2__2_, SUMB_2__1_, SUMB_1__6_,
         SUMB_1__5_, SUMB_1__4_, SUMB_1__3_, SUMB_1__2_, SUMB_1__1_, A1_12_,
         A1_11_, A1_10_, A1_9_, A1_8_, A1_7_, A1_6_, A1_4_, A1_3_, A1_2_,
         A1_1_, A1_0_, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32;

  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 FS_1 ( .A({1'b0, A1_12_, A1_11_, 
        A1_10_, A1_9_, A1_8_, A1_7_, A1_6_, SUMB_7__0_, A1_4_, A1_3_, A1_2_, 
        A1_1_, A1_0_}), .B({n10, n16, n15, n14, n13, n11, n12, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(ab_7__6_), .B(CARRYB_6__6_), .CI(ab_6__7_), .CO(
        CARRYB_7__6_), .S(SUMB_7__6_) );
  ADDFX2M S3_6_6 ( .A(ab_6__6_), .B(CARRYB_5__6_), .CI(ab_5__7_), .CO(
        CARRYB_6__6_), .S(SUMB_6__6_) );
  ADDFX2M S4_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .CI(SUMB_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  ADDFX2M S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(A1_4_) );
  ADDFX2M S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_), .S(A1_3_) );
  ADDFX2M S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .CI(SUMB_3__1_), .CO(
        CARRYB_4__0_), .S(A1_2_) );
  ADDFX2M S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .CI(SUMB_2__1_), .CO(
        CARRYB_3__0_), .S(A1_1_) );
  ADDFX2M S1_2_0 ( .A(ab_2__0_), .B(n7), .CI(SUMB_1__1_), .CO(CARRYB_2__0_), 
        .S(A1_0_) );
  ADDFX2M S2_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(SUMB_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  ADDFX2M S3_5_6 ( .A(ab_5__6_), .B(CARRYB_4__6_), .CI(ab_4__7_), .CO(
        CARRYB_5__6_), .S(SUMB_5__6_) );
  ADDFX2M S4_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .CI(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(SUMB_7__0_) );
  ADDFX2M S4_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .CI(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  ADDFX2M S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  ADDFX2M S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  ADDFX2M S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .CI(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  ADDFX2M S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .CI(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  ADDFX2M S2_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(SUMB_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  ADDFX2M S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  ADDFX2M S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  ADDFX2M S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .CI(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  ADDFX2M S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  ADDFX2M S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  ADDFX2M S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  ADDFX2M S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .CI(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  ADDFX2M S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .CI(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  ADDFX2M S2_3_3 ( .A(ab_3__3_), .B(CARRYB_2__3_), .CI(SUMB_2__4_), .CO(
        CARRYB_3__3_), .S(SUMB_3__3_) );
  ADDFX2M S2_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .CI(SUMB_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  ADDFX2M S2_2_1 ( .A(ab_2__1_), .B(n6), .CI(SUMB_1__2_), .CO(CARRYB_2__1_), 
        .S(SUMB_2__1_) );
  ADDFX2M S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  ADDFX2M S2_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .CI(SUMB_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  ADDFX2M S2_4_4 ( .A(ab_4__4_), .B(CARRYB_3__4_), .CI(SUMB_3__5_), .CO(
        CARRYB_4__4_), .S(SUMB_4__4_) );
  ADDFX2M S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .CI(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  ADDFX2M S3_4_6 ( .A(ab_4__6_), .B(CARRYB_3__6_), .CI(ab_3__7_), .CO(
        CARRYB_4__6_), .S(SUMB_4__6_) );
  ADDFX2M S3_3_6 ( .A(ab_3__6_), .B(CARRYB_2__6_), .CI(ab_2__7_), .CO(
        CARRYB_3__6_), .S(SUMB_3__6_) );
  ADDFX2M S3_2_6 ( .A(ab_2__6_), .B(n8), .CI(ab_1__7_), .CO(CARRYB_2__6_), .S(
        SUMB_2__6_) );
  ADDFX2M S2_2_3 ( .A(ab_2__3_), .B(n5), .CI(SUMB_1__4_), .CO(CARRYB_2__3_), 
        .S(SUMB_2__3_) );
  ADDFX2M S2_2_4 ( .A(ab_2__4_), .B(n4), .CI(SUMB_1__5_), .CO(CARRYB_2__4_), 
        .S(SUMB_2__4_) );
  ADDFX2M S2_2_5 ( .A(ab_2__5_), .B(n9), .CI(SUMB_1__6_), .CO(CARRYB_2__5_), 
        .S(SUMB_2__5_) );
  ADDFX2M S4_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  ADDFX2M S4_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .CI(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  ADDFX2M S4_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  ADDFX2M S2_2_2 ( .A(ab_2__2_), .B(n3), .CI(SUMB_1__3_), .CO(CARRYB_2__2_), 
        .S(SUMB_2__2_) );
  AND2X2M U2 ( .A(ab_0__3_), .B(ab_1__2_), .Y(n3) );
  AND2X2M U3 ( .A(ab_0__5_), .B(ab_1__4_), .Y(n4) );
  AND2X2M U4 ( .A(ab_0__4_), .B(ab_1__3_), .Y(n5) );
  AND2X2M U5 ( .A(ab_0__2_), .B(ab_1__1_), .Y(n6) );
  AND2X2M U6 ( .A(ab_0__1_), .B(ab_1__0_), .Y(n7) );
  AND2X2M U7 ( .A(ab_0__7_), .B(ab_1__6_), .Y(n8) );
  AND2X2M U8 ( .A(ab_0__6_), .B(ab_1__5_), .Y(n9) );
  AND2X2M U9 ( .A(CARRYB_7__6_), .B(ab_7__7_), .Y(n10) );
  NOR2X2M U10 ( .A(n18), .B(n32), .Y(ab_0__6_) );
  NOR2X2M U11 ( .A(n18), .B(n31), .Y(ab_1__6_) );
  NOR2X2M U12 ( .A(n19), .B(n32), .Y(ab_0__5_) );
  NOR2X2M U13 ( .A(n20), .B(n32), .Y(ab_0__4_) );
  NOR2X2M U14 ( .A(n21), .B(n32), .Y(ab_0__3_) );
  NOR2X2M U15 ( .A(n20), .B(n31), .Y(ab_1__4_) );
  NOR2X2M U16 ( .A(n21), .B(n31), .Y(ab_1__3_) );
  NOR2X2M U17 ( .A(n22), .B(n31), .Y(ab_1__2_) );
  CLKXOR2X2M U18 ( .A(ab_1__5_), .B(ab_0__6_), .Y(SUMB_1__5_) );
  NOR2X2M U19 ( .A(n17), .B(n32), .Y(ab_0__7_) );
  NOR2X2M U20 ( .A(n22), .B(n32), .Y(ab_0__2_) );
  NOR2X2M U21 ( .A(n23), .B(n32), .Y(ab_0__1_) );
  NOR2X2M U22 ( .A(n19), .B(n31), .Y(ab_1__5_) );
  NOR2X2M U23 ( .A(n23), .B(n31), .Y(ab_1__1_) );
  NOR2X2M U24 ( .A(n24), .B(n31), .Y(ab_1__0_) );
  NOR2X2M U25 ( .A(n25), .B(n17), .Y(ab_7__7_) );
  CLKINVX4M U26 ( .A(A[5]), .Y(n27) );
  CLKINVX4M U27 ( .A(A[6]), .Y(n26) );
  CLKINVX4M U28 ( .A(A[7]), .Y(n25) );
  CLKINVX4M U29 ( .A(B[3]), .Y(n21) );
  CLKINVX4M U30 ( .A(B[4]), .Y(n20) );
  CLKINVX4M U31 ( .A(B[7]), .Y(n17) );
  CLKINVX4M U32 ( .A(B[2]), .Y(n22) );
  CLKINVX4M U33 ( .A(B[0]), .Y(n24) );
  CLKINVX4M U34 ( .A(B[1]), .Y(n23) );
  CLKINVX4M U35 ( .A(B[5]), .Y(n19) );
  CLKXOR2X2M U36 ( .A(CARRYB_7__2_), .B(SUMB_7__3_), .Y(A1_8_) );
  AND2X2M U37 ( .A(CARRYB_7__1_), .B(SUMB_7__2_), .Y(n11) );
  CLKXOR2X2M U38 ( .A(CARRYB_7__1_), .B(SUMB_7__2_), .Y(A1_7_) );
  CLKXOR2X2M U39 ( .A(CARRYB_7__3_), .B(SUMB_7__4_), .Y(A1_9_) );
  INVX4M U40 ( .A(A[1]), .Y(n31) );
  INVX4M U41 ( .A(A[2]), .Y(n30) );
  AND2X2M U42 ( .A(CARRYB_7__0_), .B(SUMB_7__1_), .Y(n12) );
  AND2X2M U43 ( .A(CARRYB_7__2_), .B(SUMB_7__3_), .Y(n13) );
  CLKXOR2X2M U44 ( .A(CARRYB_7__4_), .B(SUMB_7__5_), .Y(A1_10_) );
  INVX4M U45 ( .A(A[3]), .Y(n29) );
  INVX4M U46 ( .A(A[4]), .Y(n28) );
  AND2X2M U47 ( .A(CARRYB_7__3_), .B(SUMB_7__4_), .Y(n14) );
  CLKXOR2X2M U48 ( .A(CARRYB_7__5_), .B(SUMB_7__6_), .Y(A1_11_) );
  AND2X2M U49 ( .A(CARRYB_7__4_), .B(SUMB_7__5_), .Y(n15) );
  CLKXOR2X2M U50 ( .A(CARRYB_7__6_), .B(ab_7__7_), .Y(A1_12_) );
  CLKXOR2X2M U51 ( .A(CARRYB_7__0_), .B(SUMB_7__1_), .Y(A1_6_) );
  AND2X2M U52 ( .A(CARRYB_7__5_), .B(SUMB_7__6_), .Y(n16) );
  XOR2X1M U53 ( .A(ab_1__0_), .B(ab_0__1_), .Y(PRODUCT[1]) );
  XOR2X1M U54 ( .A(ab_1__3_), .B(ab_0__4_), .Y(SUMB_1__3_) );
  INVX4M U55 ( .A(B[6]), .Y(n18) );
  INVX4M U56 ( .A(A[0]), .Y(n32) );
  XOR2X1M U57 ( .A(ab_1__6_), .B(ab_0__7_), .Y(SUMB_1__6_) );
  XOR2X1M U58 ( .A(ab_1__4_), .B(ab_0__5_), .Y(SUMB_1__4_) );
  XOR2X1M U59 ( .A(ab_1__2_), .B(ab_0__3_), .Y(SUMB_1__2_) );
  XOR2X1M U60 ( .A(ab_1__1_), .B(ab_0__2_), .Y(SUMB_1__1_) );
  NOR2X1M U62 ( .A(n25), .B(n18), .Y(ab_7__6_) );
  NOR2X1M U63 ( .A(n25), .B(n19), .Y(ab_7__5_) );
  NOR2X1M U64 ( .A(n25), .B(n20), .Y(ab_7__4_) );
  NOR2X1M U65 ( .A(n25), .B(n21), .Y(ab_7__3_) );
  NOR2X1M U66 ( .A(n25), .B(n22), .Y(ab_7__2_) );
  NOR2X1M U67 ( .A(n25), .B(n23), .Y(ab_7__1_) );
  NOR2X1M U68 ( .A(n25), .B(n24), .Y(ab_7__0_) );
  NOR2X1M U69 ( .A(n17), .B(n26), .Y(ab_6__7_) );
  NOR2X1M U70 ( .A(n18), .B(n26), .Y(ab_6__6_) );
  NOR2X1M U71 ( .A(n19), .B(n26), .Y(ab_6__5_) );
  NOR2X1M U72 ( .A(n20), .B(n26), .Y(ab_6__4_) );
  NOR2X1M U73 ( .A(n21), .B(n26), .Y(ab_6__3_) );
  NOR2X1M U74 ( .A(n22), .B(n26), .Y(ab_6__2_) );
  NOR2X1M U75 ( .A(n23), .B(n26), .Y(ab_6__1_) );
  NOR2X1M U76 ( .A(n24), .B(n26), .Y(ab_6__0_) );
  NOR2X1M U77 ( .A(n17), .B(n27), .Y(ab_5__7_) );
  NOR2X1M U78 ( .A(n18), .B(n27), .Y(ab_5__6_) );
  NOR2X1M U79 ( .A(n19), .B(n27), .Y(ab_5__5_) );
  NOR2X1M U80 ( .A(n20), .B(n27), .Y(ab_5__4_) );
  NOR2X1M U81 ( .A(n21), .B(n27), .Y(ab_5__3_) );
  NOR2X1M U82 ( .A(n22), .B(n27), .Y(ab_5__2_) );
  NOR2X1M U83 ( .A(n23), .B(n27), .Y(ab_5__1_) );
  NOR2X1M U84 ( .A(n24), .B(n27), .Y(ab_5__0_) );
  NOR2X1M U85 ( .A(n17), .B(n28), .Y(ab_4__7_) );
  NOR2X1M U86 ( .A(n18), .B(n28), .Y(ab_4__6_) );
  NOR2X1M U87 ( .A(n19), .B(n28), .Y(ab_4__5_) );
  NOR2X1M U88 ( .A(n20), .B(n28), .Y(ab_4__4_) );
  NOR2X1M U89 ( .A(n21), .B(n28), .Y(ab_4__3_) );
  NOR2X1M U90 ( .A(n22), .B(n28), .Y(ab_4__2_) );
  NOR2X1M U91 ( .A(n23), .B(n28), .Y(ab_4__1_) );
  NOR2X1M U92 ( .A(n24), .B(n28), .Y(ab_4__0_) );
  NOR2X1M U93 ( .A(n17), .B(n29), .Y(ab_3__7_) );
  NOR2X1M U94 ( .A(n18), .B(n29), .Y(ab_3__6_) );
  NOR2X1M U95 ( .A(n19), .B(n29), .Y(ab_3__5_) );
  NOR2X1M U96 ( .A(n20), .B(n29), .Y(ab_3__4_) );
  NOR2X1M U97 ( .A(n21), .B(n29), .Y(ab_3__3_) );
  NOR2X1M U98 ( .A(n22), .B(n29), .Y(ab_3__2_) );
  NOR2X1M U99 ( .A(n23), .B(n29), .Y(ab_3__1_) );
  NOR2X1M U100 ( .A(n24), .B(n29), .Y(ab_3__0_) );
  NOR2X1M U101 ( .A(n17), .B(n30), .Y(ab_2__7_) );
  NOR2X1M U102 ( .A(n18), .B(n30), .Y(ab_2__6_) );
  NOR2X1M U103 ( .A(n19), .B(n30), .Y(ab_2__5_) );
  NOR2X1M U104 ( .A(n20), .B(n30), .Y(ab_2__4_) );
  NOR2X1M U105 ( .A(n21), .B(n30), .Y(ab_2__3_) );
  NOR2X1M U106 ( .A(n22), .B(n30), .Y(ab_2__2_) );
  NOR2X1M U107 ( .A(n23), .B(n30), .Y(ab_2__1_) );
  NOR2X1M U108 ( .A(n24), .B(n30), .Y(ab_2__0_) );
  NOR2X1M U109 ( .A(n17), .B(n31), .Y(ab_1__7_) );
  NOR2X1M U110 ( .A(n24), .B(n32), .Y(PRODUCT[0]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16 ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, 
        OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST;
  output OUT_VALID;
  wire   N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80,
         N81, N82, N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94,
         N95, N96, N97, N98, N99, N100, N101, N102, N103, N104, N105, N106,
         N107, N108, N157, N159, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n41, n42, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8;
  wire   [15:0] ALU_OUT_Comb;

  OAI2BB1X4M U77 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 div_52 ( .a({n29, n27, n24, n21, 
        n18, n15, n12, n10}), .b({B[7], n9, B[5:0]}), .quotient({N108, N107, 
        N106, N105, N104, N103, N102, N101}), .remainder({
        SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, 
        SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, 
        SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 sub_46 ( .A({1'b0, n6, n27, n24, n21, 
        n18, n15, n12, n10}), .B({1'b0, B[7], n9, B[5:0]}), .CI(1'b0), .DIFF({
        N84, N83, N82, N81, N80, N79, N78, N77, N76}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 add_43 ( .A({1'b0, n6, n27, n24, n21, 
        n18, n15, n12, n10}), .B({1'b0, B}), .CI(1'b0), .SUM({N75, N74, N73, 
        N72, N71, N70, N69, N68, N67}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 mult_49 ( .A({n30, n27, n24, n21, 
        n18, n15, n12, n10}), .B({B[7], n7, B[5:0]}), .TC(1'b0), .PRODUCT({
        N100, N99, N98, N97, N96, N95, N94, N93, N92, N91, N90, N89, N88, N87, 
        N86, N85}) );
  DFFRQX2M ALU_OUT_reg_15_ ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M ALU_OUT_reg_14_ ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M ALU_OUT_reg_13_ ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M ALU_OUT_reg_12_ ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M ALU_OUT_reg_11_ ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M ALU_OUT_reg_10_ ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M ALU_OUT_reg_9_ ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M ALU_OUT_reg_8_ ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX2M ALU_OUT_reg_7_ ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M ALU_OUT_reg_6_ ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M ALU_OUT_reg_5_ ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M ALU_OUT_reg_4_ ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M ALU_OUT_reg_3_ ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M ALU_OUT_reg_2_ ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M ALU_OUT_reg_1_ ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  DFFRQX1M ALU_OUT_reg_0_ ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  INVX12M U3 ( .A(n28), .Y(n29) );
  BUFX32M U4 ( .A(B[6]), .Y(n9) );
  AOI31X4M U7 ( .A0(n93), .A1(n95), .A2(n94), .B0(n155), .Y(ALU_OUT_Comb[0])
         );
  CLKINVX2M U8 ( .A(B[3]), .Y(n146) );
  INVX24M U9 ( .A(A[7]), .Y(n28) );
  NOR2X4M U10 ( .A(n154), .B(n8), .Y(n105) );
  AOI222X4M U11 ( .A0(N85), .A1(n42), .B0(n10), .B1(n109), .C0(N101), .C1(n5), 
        .Y(n94) );
  AOI2B1X1M U12 ( .A1N(n139), .A0(n138), .B0(n137), .Y(n140) );
  INVX2M U13 ( .A(n140), .Y(n148) );
  OR2X2M U14 ( .A(n107), .B(n150), .Y(n3) );
  NAND2X2M U15 ( .A(n99), .B(n105), .Y(n4) );
  INVX4M U16 ( .A(A[6]), .Y(n26) );
  INVX2M U17 ( .A(n28), .Y(n30) );
  OAI31X2M U18 ( .A0(n127), .A1(n118), .A2(n117), .B0(n128), .Y(n120) );
  AOI211X2M U19 ( .A0(n13), .A1(n143), .B0(n124), .C0(n116), .Y(n117) );
  NOR2X2M U20 ( .A(n141), .B(B[7]), .Y(n137) );
  AOI211X2M U21 ( .A0(n125), .A1(n164), .B0(n124), .C0(n123), .Y(n126) );
  NAND2BX2M U22 ( .AN(n118), .B(n129), .Y(n124) );
  OAI21X2M U23 ( .A0(n137), .A1(n122), .B0(n138), .Y(N159) );
  XNOR2X4M U24 ( .A(A[6]), .B(n7), .Y(n134) );
  BUFX4M U25 ( .A(n49), .Y(n5) );
  NOR3BX2M U26 ( .AN(n105), .B(n153), .C(ALU_FUN[2]), .Y(n49) );
  CLKINVX2M U27 ( .A(n28), .Y(n6) );
  BUFX2M U28 ( .A(B[6]), .Y(n7) );
  NOR2X2M U29 ( .A(n144), .B(n16), .Y(n118) );
  NOR2X2M U30 ( .A(n142), .B(n10), .Y(n115) );
  NOR2X2M U31 ( .A(n146), .B(n19), .Y(n127) );
  INVX2M U32 ( .A(A[5]), .Y(n23) );
  INVX2M U33 ( .A(A[4]), .Y(n20) );
  NAND3X4M U34 ( .A(n152), .B(n154), .C(n8), .Y(n36) );
  BUFX6M U35 ( .A(A[0]), .Y(n10) );
  OAI21X1M U36 ( .A0(B[0]), .A1(n102), .B0(n103), .Y(n96) );
  OAI21X1M U37 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  CLKINVX1M U38 ( .A(B[2]), .Y(n144) );
  CLKINVX1M U39 ( .A(B[0]), .Y(n142) );
  INVXLM U40 ( .A(B[2]), .Y(n159) );
  INVXLM U41 ( .A(B[4]), .Y(n158) );
  INVXLM U42 ( .A(B[5]), .Y(n157) );
  INVXLM U43 ( .A(B[7]), .Y(n156) );
  NOR2X2M U44 ( .A(n8), .B(ALU_FUN[0]), .Y(n100) );
  NOR2X4M U45 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  INVX2M U46 ( .A(n6), .Y(n141) );
  INVX2M U47 ( .A(n16), .Y(n163) );
  INVX2M U48 ( .A(n19), .Y(n162) );
  INVX2M U49 ( .A(n22), .Y(n161) );
  INVX2M U50 ( .A(n25), .Y(n160) );
  BUFX4M U51 ( .A(n46), .Y(n112) );
  BUFX4M U52 ( .A(n46), .Y(n113) );
  INVX4M U53 ( .A(n3), .Y(n111) );
  INVX4M U54 ( .A(n3), .Y(n110) );
  INVX4M U55 ( .A(n4), .Y(n108) );
  INVX4M U56 ( .A(n4), .Y(n109) );
  INVX4M U57 ( .A(n13), .Y(n164) );
  AOI22X1M U58 ( .A0(N76), .A1(n50), .B0(N67), .B1(n41), .Y(n93) );
  AOI211X2M U59 ( .A0(n111), .A1(n165), .B0(n96), .C0(n97), .Y(n95) );
  AOI31X2M U60 ( .A0(n81), .A1(n82), .A2(n83), .B0(n155), .Y(ALU_OUT_Comb[1])
         );
  AOI222X2M U61 ( .A0(N68), .A1(n41), .B0(N86), .B1(n42), .C0(N77), .C1(n50), 
        .Y(n81) );
  AOI211X2M U62 ( .A0(n16), .A1(n151), .B0(n84), .C0(n85), .Y(n83) );
  AOI222X2M U63 ( .A0(N102), .A1(n5), .B0(n110), .B1(n164), .C0(n13), .C1(n108), .Y(n82) );
  INVX4M U64 ( .A(n26), .Y(n27) );
  AOI31X2M U65 ( .A0(n75), .A1(n76), .A2(n77), .B0(n155), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U66 ( .A0(N78), .A1(n50), .B0(N69), .B1(n41), .Y(n75) );
  AOI221X2M U67 ( .A0(n19), .A1(n151), .B0(n111), .B1(n163), .C0(n78), .Y(n77)
         );
  AOI222X2M U68 ( .A0(N87), .A1(n42), .B0(n16), .B1(n108), .C0(N103), .C1(n5), 
        .Y(n76) );
  INVX4M U69 ( .A(n23), .Y(n24) );
  OAI2BB1X2M U70 ( .A0N(N100), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  INVX4M U71 ( .A(n20), .Y(n21) );
  AOI31X2M U72 ( .A0(n69), .A1(n70), .A2(n71), .B0(n155), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U73 ( .A0(N79), .A1(n50), .B0(N70), .B1(n41), .Y(n69) );
  AOI221X2M U74 ( .A0(n22), .A1(n151), .B0(n111), .B1(n162), .C0(n72), .Y(n71)
         );
  AOI222X2M U75 ( .A0(N88), .A1(n42), .B0(n19), .B1(n109), .C0(N104), .C1(n5), 
        .Y(n70) );
  OAI2BB1X2M U76 ( .A0N(N99), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  INVX4M U78 ( .A(n14), .Y(n15) );
  INVX4M U79 ( .A(n11), .Y(n12) );
  OAI2BB1X2M U80 ( .A0N(N98), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  INVX4M U81 ( .A(n17), .Y(n18) );
  AOI31X2M U82 ( .A0(n63), .A1(n64), .A2(n65), .B0(n155), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U83 ( .A0(N80), .A1(n50), .B0(N71), .B1(n41), .Y(n63) );
  AOI221X2M U84 ( .A0(n151), .A1(n25), .B0(n111), .B1(n161), .C0(n66), .Y(n65)
         );
  AOI222X2M U85 ( .A0(N89), .A1(n42), .B0(n22), .B1(n108), .C0(N105), .C1(n5), 
        .Y(n64) );
  OAI2BB1X2M U86 ( .A0N(N97), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  INVX2M U87 ( .A(n9), .Y(n147) );
  OAI2BB1X2M U88 ( .A0N(N96), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  AND4X1M U89 ( .A(N159), .B(n99), .C(n8), .D(n154), .Y(n90) );
  INVX4M U90 ( .A(n14), .Y(n16) );
  AOI31X2M U91 ( .A0(n57), .A1(n58), .A2(n59), .B0(n155), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U92 ( .A0(N81), .A1(n50), .B0(N72), .B1(n41), .Y(n57) );
  AOI221X2M U93 ( .A0(n151), .A1(A[6]), .B0(n111), .B1(n160), .C0(n60), .Y(n59) );
  AOI222X2M U94 ( .A0(N90), .A1(n42), .B0(n25), .B1(n109), .C0(N106), .C1(n5), 
        .Y(n58) );
  OAI2BB1X2M U95 ( .A0N(N95), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  INVX4M U96 ( .A(n11), .Y(n13) );
  AOI31X2M U97 ( .A0(n38), .A1(n39), .A2(n40), .B0(n155), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U98 ( .A0(N83), .A1(n50), .B0(N74), .B1(n41), .Y(n38) );
  AOI221X2M U99 ( .A0(n111), .A1(n28), .B0(n109), .B1(n6), .C0(n43), .Y(n40)
         );
  AOI22X1M U100 ( .A0(N108), .A1(n5), .B0(N92), .B1(n42), .Y(n39) );
  AOI21X2M U101 ( .A0(n33), .A1(n34), .B0(n155), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U102 ( .A0(N75), .A1(n41), .B0(n149), .Y(n33) );
  AOI2BB2X2M U103 ( .B0(N93), .B1(n42), .A0N(n28), .A1N(n36), .Y(n34) );
  OAI2BB1X2M U104 ( .A0N(N94), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  INVX4M U105 ( .A(n17), .Y(n19) );
  INVX4M U106 ( .A(n20), .Y(n22) );
  AOI31X2M U107 ( .A0(n51), .A1(n52), .A2(n53), .B0(n155), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U108 ( .A0(N82), .A1(n50), .B0(N73), .B1(n41), .Y(n51) );
  AOI221X2M U109 ( .A0(n151), .A1(n30), .B0(n111), .B1(n26), .C0(n54), .Y(n53)
         );
  AOI222X2M U110 ( .A0(N91), .A1(n42), .B0(n108), .B1(A[6]), .C0(N107), .C1(n5), .Y(n52) );
  INVX4M U111 ( .A(n23), .Y(n25) );
  INVX2M U112 ( .A(n92), .Y(n149) );
  AOI211X2M U113 ( .A0(N84), .A1(n50), .B0(n111), .C0(n114), .Y(n92) );
  OAI222X1M U114 ( .A0(n55), .A1(n147), .B0(n7), .B1(n56), .C0(n36), .C1(n160), 
        .Y(n54) );
  AOI221X2M U115 ( .A0(A[6]), .A1(n112), .B0(n114), .B1(n26), .C0(n110), .Y(
        n56) );
  AOI221X2M U116 ( .A0(n113), .A1(n26), .B0(A[6]), .B1(n48), .C0(n109), .Y(n55) );
  CLKAND2X6M U117 ( .A(n106), .B(n105), .Y(n50) );
  INVX2M U118 ( .A(n10), .Y(n165) );
  INVX2M U119 ( .A(n100), .Y(n150) );
  CLKBUFX6M U120 ( .A(n47), .Y(n114) );
  OAI2BB1X2M U121 ( .A0N(n152), .A1N(n105), .B0(n101), .Y(n47) );
  INVX2M U122 ( .A(n107), .Y(n152) );
  AND3X2M U123 ( .A(n106), .B(n154), .C(n8), .Y(n46) );
  NOR2BX8M U124 ( .AN(n42), .B(n155), .Y(n31) );
  INVX4M U125 ( .A(n91), .Y(n151) );
  CLKBUFX6M U126 ( .A(n37), .Y(n41) );
  NOR2BX2M U127 ( .AN(n106), .B(n150), .Y(n37) );
  INVX2M U128 ( .A(A[2]), .Y(n14) );
  INVX2M U129 ( .A(A[1]), .Y(n11) );
  INVX2M U130 ( .A(A[3]), .Y(n17) );
  INVXLM U131 ( .A(n115), .Y(n143) );
  AOI221X2M U132 ( .A0(n10), .A1(n112), .B0(n114), .B1(n165), .C0(n110), .Y(
        n102) );
  AOI31X2M U133 ( .A0(N157), .A1(n8), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U134 ( .A(n153), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  INVXLM U135 ( .A(n126), .Y(n145) );
  AOI221X2M U136 ( .A0(n13), .A1(n112), .B0(n114), .B1(n164), .C0(n110), .Y(
        n87) );
  AOI31X2M U137 ( .A0(n148), .A1(n8), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U138 ( .A(n154), .B(ALU_FUN[2]), .C(n153), .Y(n89) );
  NAND2X4M U139 ( .A(EN), .B(n149), .Y(n32) );
  INVX4M U140 ( .A(ALU_FUN[1]), .Y(n153) );
  INVX4M U141 ( .A(ALU_FUN[0]), .Y(n154) );
  CLKBUFX6M U142 ( .A(ALU_FUN[3]), .Y(n8) );
  OAI222X1M U143 ( .A0(n44), .A1(n156), .B0(B[7]), .B1(n45), .C0(n36), .C1(n26), .Y(n43) );
  AOI221X2M U144 ( .A0(n113), .A1(n30), .B0(n114), .B1(n141), .C0(n111), .Y(
        n45) );
  AOI221X2M U145 ( .A0(n113), .A1(n141), .B0(n30), .B1(n48), .C0(n108), .Y(n44) );
  OAI222X1M U146 ( .A0(n67), .A1(n158), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n162), .Y(n66) );
  AOI221X2M U147 ( .A0(n22), .A1(n112), .B0(n114), .B1(n161), .C0(n110), .Y(
        n68) );
  AOI221X2M U148 ( .A0(n113), .A1(n161), .B0(n22), .B1(n48), .C0(n109), .Y(n67) );
  OAI222X1M U149 ( .A0(n61), .A1(n157), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n161), .Y(n60) );
  AOI221X2M U150 ( .A0(n25), .A1(n112), .B0(n114), .B1(n160), .C0(n110), .Y(
        n62) );
  AOI221X2M U151 ( .A0(n113), .A1(n160), .B0(n25), .B1(n48), .C0(n108), .Y(n61) );
  OAI222X1M U152 ( .A0(n79), .A1(n159), .B0(B[2]), .B1(n80), .C0(n36), .C1(
        n164), .Y(n78) );
  AOI221X2M U153 ( .A0(n16), .A1(n112), .B0(n114), .B1(n163), .C0(n110), .Y(
        n80) );
  AOI221X2M U154 ( .A0(n113), .A1(n163), .B0(n16), .B1(n48), .C0(n109), .Y(n79) );
  OAI222X1M U155 ( .A0(n73), .A1(n146), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n163), .Y(n72) );
  AOI221X2M U156 ( .A0(n19), .A1(n112), .B0(n114), .B1(n162), .C0(n110), .Y(
        n74) );
  AOI221X2M U157 ( .A0(n113), .A1(n162), .B0(n19), .B1(n48), .C0(n108), .Y(n73) );
  OAI2B2X1M U158 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n165), .Y(n85) );
  AOI221X2M U159 ( .A0(n113), .A1(n164), .B0(n13), .B1(n48), .C0(n108), .Y(n86) );
  OAI2B2X1M U160 ( .A1N(B[0]), .A0(n98), .B0(n91), .B1(n164), .Y(n97) );
  AOI221X2M U161 ( .A0(n112), .A1(n165), .B0(n10), .B1(n48), .C0(n109), .Y(n98) );
  NAND3X2M U162 ( .A(n106), .B(ALU_FUN[0]), .C(n8), .Y(n101) );
  AND2X2M U163 ( .A(ALU_FUN[2]), .B(n153), .Y(n99) );
  NAND2X2M U164 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  NAND3X2M U165 ( .A(n8), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  CLKBUFX6M U166 ( .A(n35), .Y(n42) );
  NOR3X2M U167 ( .A(n150), .B(ALU_FUN[2]), .C(n153), .Y(n35) );
  INVX6M U168 ( .A(EN), .Y(n155) );
  NAND2BX1M U169 ( .AN(B[4]), .B(n22), .Y(n130) );
  NAND2BX1M U170 ( .AN(n22), .B(B[4]), .Y(n119) );
  CLKNAND2X2M U171 ( .A(n130), .B(n119), .Y(n132) );
  CLKNAND2X2M U172 ( .A(n16), .B(n144), .Y(n129) );
  AOI21X1M U173 ( .A0(n115), .A1(n164), .B0(B[1]), .Y(n116) );
  CLKNAND2X2M U174 ( .A(n19), .B(n146), .Y(n128) );
  NAND2BX1M U175 ( .AN(n25), .B(B[5]), .Y(n135) );
  OAI211X1M U176 ( .A0(n132), .A1(n120), .B0(n119), .C0(n135), .Y(n121) );
  NAND2BX1M U177 ( .AN(B[5]), .B(n25), .Y(n131) );
  AOI32X1M U178 ( .A0(n121), .A1(n131), .A2(n134), .B0(n7), .B1(n26), .Y(n122)
         );
  CLKNAND2X2M U179 ( .A(B[7]), .B(n141), .Y(n138) );
  CLKNAND2X2M U180 ( .A(n10), .B(n142), .Y(n125) );
  OA21X1M U181 ( .A0(n125), .A1(n164), .B0(B[1]), .Y(n123) );
  AOI31X1M U182 ( .A0(n145), .A1(n129), .A2(n128), .B0(n127), .Y(n133) );
  OAI2B11X1M U183 ( .A1N(n133), .A0(n132), .B0(n131), .C0(n130), .Y(n136) );
  AOI32X1M U184 ( .A0(n136), .A1(n135), .A2(n134), .B0(A[6]), .B1(n147), .Y(
        n139) );
  NOR2X1M U185 ( .A(N159), .B(n148), .Y(N157) );
endmodule


module FSM ( CLK, RST, RX_IN, PAR_EN, edge_cnt, bit_cnt, par_err, strt_glitch, 
        stp_err, PRESCALE, data_samp_en, enable, deser_en, par_chk_en, 
        stp_chk_en, strt_chk_en, data_valid );
  input [5:0] edge_cnt;
  input [3:0] bit_cnt;
  input [5:0] PRESCALE;
  input CLK, RST, RX_IN, PAR_EN, par_err, strt_glitch, stp_err;
  output data_samp_en, enable, deser_en, par_chk_en, stp_chk_en, strt_chk_en,
         data_valid;
  wire   n62, N80, N81, N82, N83, N84, n1, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  wire   [4:2] add_132_carry;

  DFFRQX2M current_state_reg_0_ ( .D(next_state[0]), .CK(CLK), .RN(n4), .Q(
        current_state[0]) );
  DFFRQX4M current_state_reg_1_ ( .D(next_state[1]), .CK(CLK), .RN(n4), .Q(
        current_state[1]) );
  DFFRQX2M current_state_reg_2_ ( .D(next_state[2]), .CK(CLK), .RN(n4), .Q(
        current_state[2]) );
  INVX2M U3 ( .A(PRESCALE[1]), .Y(n59) );
  AOI211X2M U4 ( .A0(n21), .A1(n25), .B0(current_state[1]), .C0(
        current_state[0]), .Y(n29) );
  INVXLM U5 ( .A(n62), .Y(n1) );
  INVX4M U6 ( .A(n1), .Y(enable) );
  OAI32X2M U7 ( .A0(n27), .A1(stp_err), .A2(n28), .B0(current_state[2]), .B1(
        n29), .Y(n62) );
  AOI222X2M U8 ( .A0(edge_cnt[2]), .A1(n41), .B0(n42), .B1(n43), .C0(
        edge_cnt[3]), .C1(n40), .Y(n37) );
  NOR2BX4M U9 ( .AN(bit_cnt[0]), .B(n18), .Y(n12) );
  OAI32X4M U10 ( .A0(n51), .A1(n52), .A2(n53), .B0(PRESCALE[5]), .B1(n36), .Y(
        n31) );
  NOR3X4M U11 ( .A(current_state[1]), .B(current_state[2]), .C(n22), .Y(
        strt_chk_en) );
  NOR3X6M U12 ( .A(PAR_EN), .B(bit_cnt[0]), .C(n18), .Y(n13) );
  OAI32X2M U13 ( .A0(n15), .A1(n16), .A2(n17), .B0(n6), .B1(n13), .Y(n14) );
  NOR3X4M U14 ( .A(bit_cnt[2]), .B(bit_cnt[3]), .C(bit_cnt[1]), .Y(n15) );
  NOR3X6M U15 ( .A(current_state[0]), .B(current_state[1]), .C(n26), .Y(
        stp_chk_en) );
  CLKINVX2M U16 ( .A(current_state[2]), .Y(n26) );
  AOI221X2M U17 ( .A0(PRESCALE[1]), .A1(n44), .B0(PRESCALE[4]), .B1(n39), .C0(
        n31), .Y(n50) );
  INVX2M U18 ( .A(current_state[0]), .Y(n22) );
  NAND2X1M U19 ( .A(strt_chk_en), .B(n25), .Y(n17) );
  NAND4X2M U20 ( .A(n47), .B(n48), .C(n49), .D(n50), .Y(n11) );
  AOI21BX2M U21 ( .A0(PRESCALE[0]), .A1(n45), .B0N(n61), .Y(n49) );
  NOR2X2M U22 ( .A(n45), .B(PRESCALE[0]), .Y(n58) );
  NAND2X1M U23 ( .A(PRESCALE[2]), .B(n46), .Y(n61) );
  NAND2X1M U24 ( .A(PRESCALE[3]), .B(n56), .Y(n47) );
  NOR3X2M U25 ( .A(current_state[1]), .B(strt_glitch), .C(current_state[2]), 
        .Y(n23) );
  INVX2M U26 ( .A(edge_cnt[0]), .Y(n45) );
  INVX2M U27 ( .A(edge_cnt[2]), .Y(n46) );
  INVX2M U28 ( .A(edge_cnt[5]), .Y(n36) );
  INVX2M U29 ( .A(edge_cnt[1]), .Y(n44) );
  INVX2M U30 ( .A(edge_cnt[4]), .Y(n39) );
  INVXLM U31 ( .A(n13), .Y(n5) );
  NAND2XLM U32 ( .A(N84), .B(n36), .Y(n34) );
  NAND2XLM U33 ( .A(N83), .B(n39), .Y(n32) );
  NAND3X2M U34 ( .A(n22), .B(n26), .C(current_state[1]), .Y(n6) );
  NAND3BX2M U35 ( .AN(bit_cnt[2]), .B(bit_cnt[1]), .C(bit_cnt[3]), .Y(n18) );
  NAND3X2M U36 ( .A(current_state[0]), .B(n26), .C(current_state[1]), .Y(n8)
         );
  BUFX2M U37 ( .A(RST), .Y(n4) );
  ADDHX2M U38 ( .A(PRESCALE[5]), .B(add_132_carry[4]), .CO(N84), .S(N83) );
  ADDHX2M U39 ( .A(PRESCALE[2]), .B(PRESCALE[1]), .CO(add_132_carry[2]), .S(
        N80) );
  ADDHX1M U40 ( .A(PRESCALE[4]), .B(add_132_carry[3]), .CO(add_132_carry[4]), 
        .S(N82) );
  ADDHX2M U41 ( .A(PRESCALE[3]), .B(add_132_carry[2]), .CO(add_132_carry[3]), 
        .S(N81) );
  CLKBUFX4M U42 ( .A(enable), .Y(data_samp_en) );
  OAI221X1M U43 ( .A0(n5), .A1(n6), .B0(n7), .B1(n8), .C0(n9), .Y(
        next_state[2]) );
  OAI21X1M U44 ( .A0(n10), .A1(n11), .B0(stp_chk_en), .Y(n9) );
  AOI21X1M U45 ( .A0(PAR_EN), .A1(n12), .B0(n13), .Y(n10) );
  AO21XLM U46 ( .A0(n7), .A1(par_chk_en), .B0(n14), .Y(next_state[1]) );
  CLKINVX1M U47 ( .A(n8), .Y(par_chk_en) );
  CLKINVX1M U48 ( .A(n12), .Y(n7) );
  OAI211X1M U49 ( .A0(n12), .A1(n8), .B0(n19), .C0(n20), .Y(next_state[0]) );
  AOI31X1M U50 ( .A0(n21), .A1(n22), .A2(n23), .B0(n24), .Y(n20) );
  NOR4BX1M U51 ( .AN(PAR_EN), .B(bit_cnt[0]), .C(n18), .D(n6), .Y(n24) );
  OAI21BX1M U52 ( .A0(n15), .A1(n16), .B0N(n17), .Y(n19) );
  OA21X1M U53 ( .A0(bit_cnt[2]), .A1(bit_cnt[1]), .B0(bit_cnt[3]), .Y(n16) );
  CLKINVX1M U54 ( .A(strt_glitch), .Y(n25) );
  CLKINVX1M U55 ( .A(RX_IN), .Y(n21) );
  NOR2BX1M U56 ( .AN(par_err), .B(n11), .Y(n28) );
  NOR4X1M U57 ( .A(strt_glitch), .B(n30), .C(n31), .D(n6), .Y(deser_en) );
  AOI32X1M U58 ( .A0(n32), .A1(n33), .A2(n34), .B0(edge_cnt[5]), .B1(n35), .Y(
        n30) );
  CLKINVX1M U59 ( .A(N84), .Y(n35) );
  OAI22X1M U60 ( .A0(n37), .A1(n38), .B0(N83), .B1(n39), .Y(n33) );
  NOR2X1M U61 ( .A(edge_cnt[3]), .B(n40), .Y(n38) );
  CLKINVX1M U62 ( .A(N82), .Y(n40) );
  OAI211X1M U63 ( .A0(N80), .A1(n44), .B0(n45), .C0(n59), .Y(n43) );
  AOI22X1M U64 ( .A0(N81), .A1(n46), .B0(N80), .B1(n44), .Y(n42) );
  CLKINVX1M U65 ( .A(N81), .Y(n41) );
  NOR4X1M U66 ( .A(stp_err), .B(par_err), .C(n11), .D(n27), .Y(data_valid) );
  CLKINVX1M U67 ( .A(stp_chk_en), .Y(n27) );
  AOI22X1M U68 ( .A0(edge_cnt[4]), .A1(n54), .B0(n47), .B1(n55), .Y(n53) );
  OAI221X1M U69 ( .A0(PRESCALE[2]), .A1(n46), .B0(PRESCALE[3]), .B1(n56), .C0(
        n57), .Y(n55) );
  OAI211X1M U70 ( .A0(n58), .A1(n59), .B0(n60), .C0(n61), .Y(n57) );
  AO21XLM U71 ( .A0(n59), .A1(n58), .B0(edge_cnt[1]), .Y(n60) );
  CLKINVX1M U72 ( .A(n48), .Y(n52) );
  NOR2X1M U73 ( .A(edge_cnt[4]), .B(n54), .Y(n51) );
  CLKINVX1M U74 ( .A(PRESCALE[4]), .Y(n54) );
  CLKNAND2X2M U75 ( .A(PRESCALE[5]), .B(n36), .Y(n48) );
  CLKINVX1M U76 ( .A(edge_cnt[3]), .Y(n56) );
endmodule


module data_sampling ( CLK, RST, PRESCALE, data_samp_en, RX_IN, edge_cnt, 
        sampled_bit );
  input [5:0] PRESCALE;
  input [5:0] edge_cnt;
  input CLK, RST, data_samp_en, RX_IN;
  output sampled_bit;
  wire   sample_ready, n3, n11, n12, n13, n14, n15, n16, n17, n18, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n1, n2, n4, n5, n6, n7, n8, n9, n10, n19, n36, n37, n38, n39;
  wire   [1:0] samples;

  DFFRX4M samples_reg_2_ ( .D(n35), .CK(CLK), .RN(n5), .QN(n3) );
  OAI31X4M U7 ( .A0(n16), .A1(n17), .A2(n18), .B0(data_samp_en), .Y(n14) );
  OAI31X4M U13 ( .A0(n9), .A1(edge_cnt[0]), .A2(n24), .B0(data_samp_en), .Y(
        n23) );
  NOR3BX4M U18 ( .AN(n28), .B(edge_cnt[1]), .C(edge_cnt[5]), .Y(n25) );
  DFFRQX1M samples_reg_0_ ( .D(n33), .CK(CLK), .RN(n5), .Q(samples[0]) );
  DFFRQX1M samples_reg_1_ ( .D(n34), .CK(CLK), .RN(n5), .Q(samples[1]) );
  DFFRQX4M sampled_bit_reg ( .D(n32), .CK(CLK), .RN(n5), .Q(sampled_bit) );
  DFFRQX1M sample_ready_reg ( .D(n7), .CK(CLK), .RN(n5), .Q(sample_ready) );
  AND2X2M U3 ( .A(n4), .B(n2), .Y(n1) );
  AND2X2M U4 ( .A(n31), .B(PRESCALE[5]), .Y(n2) );
  INVXLM U5 ( .A(PRESCALE[4]), .Y(n4) );
  NOR4X4M U6 ( .A(PRESCALE[1]), .B(PRESCALE[0]), .C(PRESCALE[3]), .D(
        PRESCALE[2]), .Y(n31) );
  NAND3X1M U8 ( .A(n31), .B(n39), .C(PRESCALE[4]), .Y(n21) );
  INVX2M U9 ( .A(edge_cnt[2]), .Y(n19) );
  INVX4M U10 ( .A(n6), .Y(n5) );
  INVX2M U11 ( .A(RST), .Y(n6) );
  INVX2M U12 ( .A(n24), .Y(n8) );
  NAND2X2M U14 ( .A(data_samp_en), .B(n12), .Y(n24) );
  INVX2M U15 ( .A(n27), .Y(n7) );
  OAI2BB2X1M U16 ( .B0(n19), .B1(n21), .A0N(n19), .A1N(n22), .Y(n20) );
  NOR2X2M U17 ( .A(n38), .B(n1), .Y(n22) );
  INVX2M U19 ( .A(n21), .Y(n38) );
  OAI2B2X1M U20 ( .A1N(n14), .A0(n15), .B0(n37), .B1(n14), .Y(n33) );
  OR2X2M U21 ( .A(edge_cnt[4]), .B(edge_cnt[5]), .Y(n18) );
  AOI32X1M U22 ( .A0(edge_cnt[2]), .A1(n1), .A2(edge_cnt[3]), .B0(n20), .B1(
        n10), .Y(n17) );
  NAND2X2M U23 ( .A(sample_ready), .B(data_samp_en), .Y(n12) );
  NAND3X2M U24 ( .A(edge_cnt[0]), .B(n8), .C(edge_cnt[1]), .Y(n16) );
  OAI2B2X1M U25 ( .A1N(n23), .A0(n15), .B0(n36), .B1(n23), .Y(n34) );
  INVX2M U26 ( .A(n25), .Y(n9) );
  NAND3X2M U27 ( .A(edge_cnt[0]), .B(n8), .C(n25), .Y(n27) );
  OAI2B2X1M U28 ( .A1N(n26), .A0(n15), .B0(n3), .B1(n26), .Y(n35) );
  NAND2X2M U29 ( .A(data_samp_en), .B(n27), .Y(n26) );
  NAND2X2M U30 ( .A(RX_IN), .B(n8), .Y(n15) );
  OAI2BB2X1M U31 ( .B0(n11), .B1(n12), .A0N(sampled_bit), .A1N(n12), .Y(n32)
         );
  AOI21X2M U32 ( .A0(samples[1]), .A1(samples[0]), .B0(n13), .Y(n11) );
  AOI21X2M U33 ( .A0(n36), .A1(n37), .B0(n3), .Y(n13) );
  OAI21X2M U34 ( .A0(edge_cnt[4]), .A1(n29), .B0(n30), .Y(n28) );
  NAND4X1M U35 ( .A(edge_cnt[4]), .B(n1), .C(n19), .D(n10), .Y(n30) );
  AOI33X2M U36 ( .A0(edge_cnt[3]), .A1(n19), .A2(n38), .B0(edge_cnt[2]), .B1(
        n10), .B2(n22), .Y(n29) );
  INVX2M U37 ( .A(edge_cnt[3]), .Y(n10) );
  INVX2M U38 ( .A(samples[1]), .Y(n36) );
  INVX2M U39 ( .A(samples[0]), .Y(n37) );
  INVX2M U40 ( .A(PRESCALE[5]), .Y(n39) );
endmodule


module edge_bit_count ( CLK, RST, PRESCALE, enable, PAR_EN, edge_cnt, bit_cnt
 );
  input [5:0] PRESCALE;
  output [5:0] edge_cnt;
  output [3:0] bit_cnt;
  input CLK, RST, enable, PAR_EN;
  wire   n52, n53, n54, n55, n56, n57, N6, N13, N15, N16, N17, N18, N20, N21,
         N22, N23, N24, N25, n5, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n1, n2, n3, n4, n6, n7, n8, n10, n12, n26, n28, n30,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51;
  wire   [5:2] add_19_aco_carry;

  DFFRX4M bit_cnt_reg_3_ ( .D(n24), .CK(CLK), .RN(n34), .Q(bit_cnt[3]), .QN(n5) );
  DFFRQX4M bit_cnt_reg_0_ ( .D(n23), .CK(CLK), .RN(n34), .Q(bit_cnt[0]) );
  DFFRQX4M bit_cnt_reg_2_ ( .D(n45), .CK(CLK), .RN(n34), .Q(bit_cnt[2]) );
  DFFRQX4M bit_cnt_reg_1_ ( .D(n22), .CK(CLK), .RN(n34), .Q(bit_cnt[1]) );
  DFFRQX1M edge_cnt_reg_0_ ( .D(N20), .CK(CLK), .RN(n34), .Q(n57) );
  DFFRQX1M edge_cnt_reg_1_ ( .D(N21), .CK(CLK), .RN(n34), .Q(n56) );
  DFFRQX1M edge_cnt_reg_3_ ( .D(N23), .CK(CLK), .RN(n34), .Q(n54) );
  DFFRQX1M edge_cnt_reg_4_ ( .D(N24), .CK(CLK), .RN(n34), .Q(n53) );
  DFFRQX1M edge_cnt_reg_2_ ( .D(N22), .CK(CLK), .RN(n34), .Q(n55) );
  DFFRQX1M edge_cnt_reg_5_ ( .D(N25), .CK(CLK), .RN(n34), .Q(n52) );
  INVX6M U3 ( .A(n10), .Y(edge_cnt[2]) );
  INVX6M U4 ( .A(n12), .Y(edge_cnt[4]) );
  AND2X2M U5 ( .A(edge_cnt[0]), .B(N13), .Y(n1) );
  AND2X2M U6 ( .A(edge_cnt[1]), .B(N13), .Y(n2) );
  AND2X2M U7 ( .A(edge_cnt[3]), .B(N13), .Y(n3) );
  AND2X2M U8 ( .A(edge_cnt[2]), .B(N13), .Y(n4) );
  AND2X2M U9 ( .A(edge_cnt[4]), .B(N13), .Y(n6) );
  AND2X2M U10 ( .A(N13), .B(edge_cnt[5]), .Y(n7) );
  INVXLM U11 ( .A(n52), .Y(n8) );
  INVX6M U12 ( .A(n8), .Y(edge_cnt[5]) );
  INVXLM U13 ( .A(n55), .Y(n10) );
  INVXLM U14 ( .A(n53), .Y(n12) );
  INVXLM U15 ( .A(n54), .Y(n26) );
  INVX6M U16 ( .A(n26), .Y(edge_cnt[3]) );
  INVXLM U17 ( .A(n56), .Y(n28) );
  INVX8M U18 ( .A(n28), .Y(edge_cnt[1]) );
  INVXLM U19 ( .A(n57), .Y(n30) );
  INVX8M U20 ( .A(n30), .Y(edge_cnt[0]) );
  NOR4X2M U21 ( .A(n44), .B(n43), .C(n42), .D(n41), .Y(N6) );
  NOR2BX2M U22 ( .AN(PRESCALE[0]), .B(edge_cnt[0]), .Y(n37) );
  NOR2BX2M U23 ( .AN(edge_cnt[0]), .B(PRESCALE[0]), .Y(n36) );
  CLKINVX2M U24 ( .A(n17), .Y(n47) );
  XOR2X1M U25 ( .A(PRESCALE[2]), .B(edge_cnt[2]), .Y(n42) );
  XOR2X1M U26 ( .A(PRESCALE[4]), .B(edge_cnt[4]), .Y(n43) );
  XOR2X1M U27 ( .A(PRESCALE[3]), .B(edge_cnt[3]), .Y(n41) );
  OAI211X2M U28 ( .A0(n20), .A1(n21), .B0(n48), .C0(enable), .Y(n17) );
  INVX6M U29 ( .A(n35), .Y(n34) );
  INVX2M U30 ( .A(RST), .Y(n35) );
  NOR3X6M U31 ( .A(n33), .B(n47), .C(n49), .Y(n14) );
  AOI21X2M U32 ( .A0(n49), .A1(enable), .B0(n47), .Y(n16) );
  CLKBUFX6M U33 ( .A(n46), .Y(n33) );
  INVXLM U34 ( .A(enable), .Y(n46) );
  NOR2X2M U35 ( .A(n1), .B(n33), .Y(N20) );
  NOR2BX2M U36 ( .AN(N15), .B(n33), .Y(N21) );
  NOR2BX2M U37 ( .AN(N16), .B(n33), .Y(N22) );
  NOR2BX2M U38 ( .AN(N17), .B(n33), .Y(N23) );
  NOR2BX2M U39 ( .AN(N18), .B(n33), .Y(N24) );
  CLKINVX3M U40 ( .A(N6), .Y(N13) );
  OAI32X2M U41 ( .A0(n33), .A1(bit_cnt[0]), .A2(n47), .B0(n49), .B1(n17), .Y(
        n23) );
  OR3X2M U42 ( .A(edge_cnt[5]), .B(edge_cnt[4]), .C(edge_cnt[3]), .Y(n20) );
  OR3X1M U43 ( .A(edge_cnt[2]), .B(edge_cnt[1]), .C(edge_cnt[0]), .Y(n21) );
  INVXLM U44 ( .A(N6), .Y(n48) );
  OAI21X2M U45 ( .A0(bit_cnt[1]), .A1(n33), .B0(n16), .Y(n15) );
  OAI2BB2X1M U46 ( .B0(n16), .B1(n50), .A0N(n50), .A1N(n14), .Y(n22) );
  INVX2M U47 ( .A(bit_cnt[1]), .Y(n50) );
  OAI21X2M U48 ( .A0(n18), .A1(n5), .B0(n19), .Y(n24) );
  AOI21X1M U49 ( .A0(enable), .A1(n51), .B0(n15), .Y(n18) );
  NAND4X2M U50 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .C(n14), .D(n5), .Y(n19) );
  INVX2M U51 ( .A(n13), .Y(n45) );
  AOI32X1M U52 ( .A0(bit_cnt[1]), .A1(n51), .A2(n14), .B0(n15), .B1(bit_cnt[2]), .Y(n13) );
  NOR2X2M U53 ( .A(n32), .B(n33), .Y(N25) );
  XNOR2X2M U54 ( .A(add_19_aco_carry[5]), .B(n7), .Y(n32) );
  ADDHX1M U55 ( .A(n2), .B(n1), .CO(add_19_aco_carry[2]), .S(N15) );
  ADDHX1M U56 ( .A(n4), .B(add_19_aco_carry[2]), .CO(add_19_aco_carry[3]), .S(
        N16) );
  ADDHX1M U57 ( .A(n3), .B(add_19_aco_carry[3]), .CO(add_19_aco_carry[4]), .S(
        N17) );
  ADDHX1M U58 ( .A(n6), .B(add_19_aco_carry[4]), .CO(add_19_aco_carry[5]), .S(
        N18) );
  INVX2M U59 ( .A(bit_cnt[0]), .Y(n49) );
  INVX2M U60 ( .A(bit_cnt[2]), .Y(n51) );
  OAI2B2X1M U61 ( .A1N(PRESCALE[1]), .A0(n36), .B0(edge_cnt[1]), .B1(n36), .Y(
        n40) );
  OAI2B2X1M U62 ( .A1N(edge_cnt[1]), .A0(n37), .B0(PRESCALE[1]), .B1(n37), .Y(
        n39) );
  XNOR2X1M U63 ( .A(PRESCALE[5]), .B(edge_cnt[5]), .Y(n38) );
  NAND3X1M U64 ( .A(n40), .B(n39), .C(n38), .Y(n44) );
endmodule


module deserializer ( CLK, RST, sampled_bit, deser_en, edge_cnt, PRESCALE, 
        P_data );
  input [5:0] edge_cnt;
  input [5:0] PRESCALE;
  output [7:0] P_data;
  input CLK, RST, sampled_bit, deser_en;
  wire   N1, n1, n10, n11, n12, n13, n14, n15, n16, n17, n2, n3, n4, n5, n6,
         n7, n8, n9, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29;

  DFFRQX2M shift_reg_reg_0_ ( .D(n10), .CK(CLK), .RN(n3), .Q(P_data[0]) );
  DFFRQX2M shift_reg_reg_5_ ( .D(n15), .CK(CLK), .RN(n3), .Q(P_data[5]) );
  DFFRQX2M shift_reg_reg_1_ ( .D(n11), .CK(CLK), .RN(n3), .Q(P_data[1]) );
  DFFRQX2M shift_reg_reg_4_ ( .D(n14), .CK(CLK), .RN(n3), .Q(P_data[4]) );
  DFFRQX2M shift_reg_reg_7_ ( .D(n17), .CK(CLK), .RN(n3), .Q(P_data[7]) );
  DFFRQX2M shift_reg_reg_3_ ( .D(n13), .CK(CLK), .RN(n3), .Q(P_data[3]) );
  DFFRQX2M shift_reg_reg_6_ ( .D(n16), .CK(CLK), .RN(n3), .Q(P_data[6]) );
  DFFRQX2M shift_reg_reg_2_ ( .D(n12), .CK(CLK), .RN(n3), .Q(P_data[2]) );
  NOR2BX2M U2 ( .AN(PRESCALE[0]), .B(edge_cnt[0]), .Y(n6) );
  NOR2BX2M U3 ( .AN(edge_cnt[0]), .B(PRESCALE[0]), .Y(n5) );
  XOR2X1M U4 ( .A(PRESCALE[2]), .B(edge_cnt[2]), .Y(n19) );
  XOR2X1M U5 ( .A(PRESCALE[4]), .B(edge_cnt[4]), .Y(n20) );
  XOR2X1M U6 ( .A(PRESCALE[3]), .B(edge_cnt[3]), .Y(n18) );
  INVX4M U7 ( .A(n4), .Y(n3) );
  INVX2M U8 ( .A(RST), .Y(n4) );
  INVX4M U9 ( .A(n2), .Y(n22) );
  OAI22X1M U10 ( .A0(n22), .A1(n29), .B0(n2), .B1(n28), .Y(n11) );
  OAI22X1M U11 ( .A0(n22), .A1(n28), .B0(n2), .B1(n27), .Y(n12) );
  OAI22X1M U12 ( .A0(n22), .A1(n27), .B0(n2), .B1(n26), .Y(n13) );
  OAI22X1M U13 ( .A0(n22), .A1(n26), .B0(n2), .B1(n25), .Y(n14) );
  OAI22X1M U14 ( .A0(n22), .A1(n25), .B0(n2), .B1(n24), .Y(n15) );
  OAI22X1M U15 ( .A0(n22), .A1(n24), .B0(n2), .B1(n23), .Y(n16) );
  OAI2BB2X1M U16 ( .B0(n22), .B1(n23), .A0N(sampled_bit), .A1N(n22), .Y(n17)
         );
  CLKBUFX6M U17 ( .A(n1), .Y(n2) );
  NAND2XLM U18 ( .A(deser_en), .B(N1), .Y(n1) );
  OAI2BB2X1M U19 ( .B0(n2), .B1(n29), .A0N(P_data[0]), .A1N(n2), .Y(n10) );
  INVX2M U20 ( .A(P_data[2]), .Y(n28) );
  INVX2M U21 ( .A(P_data[6]), .Y(n24) );
  INVX2M U22 ( .A(P_data[7]), .Y(n23) );
  INVX2M U23 ( .A(P_data[3]), .Y(n27) );
  INVX2M U24 ( .A(P_data[1]), .Y(n29) );
  INVX2M U25 ( .A(P_data[4]), .Y(n26) );
  INVX2M U26 ( .A(P_data[5]), .Y(n25) );
  OAI2B2X1M U27 ( .A1N(PRESCALE[1]), .A0(n5), .B0(edge_cnt[1]), .B1(n5), .Y(n9) );
  OAI2B2X1M U28 ( .A1N(edge_cnt[1]), .A0(n6), .B0(PRESCALE[1]), .B1(n6), .Y(n8) );
  XNOR2X1M U29 ( .A(PRESCALE[5]), .B(edge_cnt[5]), .Y(n7) );
  NAND3X1M U30 ( .A(n9), .B(n8), .C(n7), .Y(n21) );
  NOR4X1M U31 ( .A(n21), .B(n20), .C(n19), .D(n18), .Y(N1) );
endmodule


module Parity_check ( CLK, RST, PAR_TYP, sampled_bit, PRESCALE, edge_cnt, 
        par_chk_en, P_data, par_err );
  input [5:0] PRESCALE;
  input [5:0] edge_cnt;
  input [7:0] P_data;
  input CLK, RST, PAR_TYP, sampled_bit, par_chk_en;
  output par_err;
  wire   N7, n3, n4, n5, n6, n7, n8, n9, n10, n1, n2, n11, n12, n13, n14, n15,
         n16, n17;

  DFFRQX2M par_err_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(par_err) );
  NOR2BX2M U2 ( .AN(PRESCALE[0]), .B(edge_cnt[0]), .Y(n2) );
  NOR2BX2M U3 ( .AN(edge_cnt[0]), .B(PRESCALE[0]), .Y(n1) );
  XOR2X1M U4 ( .A(PRESCALE[2]), .B(edge_cnt[2]), .Y(n15) );
  XOR2X1M U5 ( .A(PRESCALE[4]), .B(edge_cnt[4]), .Y(n16) );
  XOR2X1M U6 ( .A(PRESCALE[3]), .B(edge_cnt[3]), .Y(n14) );
  OAI2BB2X1M U7 ( .B0(n3), .B1(n4), .A0N(par_err), .A1N(n4), .Y(n10) );
  XOR3XLM U8 ( .A(n5), .B(n6), .C(n7), .Y(n3) );
  CLKNAND2X2M U9 ( .A(par_chk_en), .B(N7), .Y(n4) );
  XNOR2X2M U10 ( .A(sampled_bit), .B(PAR_TYP), .Y(n7) );
  XOR3XLM U11 ( .A(P_data[5]), .B(P_data[4]), .C(n8), .Y(n6) );
  XNOR2X2M U12 ( .A(P_data[7]), .B(P_data[6]), .Y(n8) );
  XOR3XLM U13 ( .A(P_data[1]), .B(P_data[0]), .C(n9), .Y(n5) );
  XNOR2X2M U14 ( .A(P_data[3]), .B(P_data[2]), .Y(n9) );
  OAI2B2X1M U15 ( .A1N(PRESCALE[1]), .A0(n1), .B0(edge_cnt[1]), .B1(n1), .Y(
        n13) );
  OAI2B2X1M U16 ( .A1N(edge_cnt[1]), .A0(n2), .B0(PRESCALE[1]), .B1(n2), .Y(
        n12) );
  XNOR2X1M U17 ( .A(PRESCALE[5]), .B(edge_cnt[5]), .Y(n11) );
  NAND3X1M U18 ( .A(n13), .B(n12), .C(n11), .Y(n17) );
  NOR4X1M U19 ( .A(n17), .B(n16), .C(n15), .D(n14), .Y(N7) );
endmodule


module stop_check ( CLK, RST, sampled_bit, stp_chk_en, PRESCALE, edge_cnt, 
        stp_err );
  input [5:0] PRESCALE;
  input [5:0] edge_cnt;
  input CLK, RST, sampled_bit, stp_chk_en;
  output stp_err;
  wire   N1, N2, N3, N4, N5, N6, N7, N8, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16;

  DFFRQX2M stp_err_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(stp_err) );
  OR2X2M U3 ( .A(n4), .B(PRESCALE[2]), .Y(n5) );
  BUFX2M U4 ( .A(n7), .Y(n3) );
  OR2X2M U5 ( .A(n5), .B(PRESCALE[3]), .Y(n6) );
  OR2X2M U6 ( .A(PRESCALE[1]), .B(PRESCALE[0]), .Y(n4) );
  NOR2X2M U7 ( .A(n3), .B(PRESCALE[5]), .Y(N7) );
  NOR2BX2M U8 ( .AN(N1), .B(edge_cnt[0]), .Y(n8) );
  NOR2BX2M U9 ( .AN(edge_cnt[0]), .B(N1), .Y(n9) );
  OAI2BB1XLM U10 ( .A0N(n6), .A1N(PRESCALE[4]), .B0(n3), .Y(N5) );
  OAI2BB1XLM U11 ( .A0N(n5), .A1N(PRESCALE[3]), .B0(n6), .Y(N4) );
  OAI2BB1XLM U12 ( .A0N(n4), .A1N(PRESCALE[2]), .B0(n5), .Y(N3) );
  OAI2BB2X1M U13 ( .B0(sampled_bit), .B1(n1), .A0N(stp_err), .A1N(n1), .Y(n2)
         );
  NAND2X1M U14 ( .A(stp_chk_en), .B(N8), .Y(n1) );
  CLKINVX1M U15 ( .A(PRESCALE[0]), .Y(N1) );
  OAI2BB1X1M U16 ( .A0N(PRESCALE[0]), .A1N(PRESCALE[1]), .B0(n4), .Y(N2) );
  OR2X1M U17 ( .A(n6), .B(PRESCALE[4]), .Y(n7) );
  AO21XLM U18 ( .A0(n3), .A1(PRESCALE[5]), .B0(N7), .Y(N6) );
  OAI2B2X1M U19 ( .A1N(edge_cnt[1]), .A0(n8), .B0(N2), .B1(n8), .Y(n12) );
  XNOR2X1M U20 ( .A(N6), .B(edge_cnt[5]), .Y(n11) );
  OAI2B2X1M U21 ( .A1N(N2), .A0(n9), .B0(edge_cnt[1]), .B1(n9), .Y(n10) );
  NAND4BX1M U22 ( .AN(N7), .B(n12), .C(n11), .D(n10), .Y(n16) );
  CLKXOR2X2M U23 ( .A(N5), .B(edge_cnt[4]), .Y(n15) );
  CLKXOR2X2M U24 ( .A(N3), .B(edge_cnt[2]), .Y(n14) );
  CLKXOR2X2M U25 ( .A(N4), .B(edge_cnt[3]), .Y(n13) );
  NOR4X1M U26 ( .A(n16), .B(n15), .C(n14), .D(n13), .Y(N8) );
endmodule


module strt_check ( CLK, RST, sampled_bit, edge_cnt, PRESCALE, strt_chk_en, 
        strt_glitch );
  input [5:0] edge_cnt;
  input [5:0] PRESCALE;
  input CLK, RST, sampled_bit, strt_chk_en;
  output strt_glitch;
  wire   N1, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  DFFRQX2M strt_glitch_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(strt_glitch) );
  NOR2BX2M U2 ( .AN(PRESCALE[0]), .B(edge_cnt[0]), .Y(n4) );
  NOR2BX2M U3 ( .AN(edge_cnt[0]), .B(PRESCALE[0]), .Y(n3) );
  XOR2X1M U4 ( .A(PRESCALE[4]), .B(edge_cnt[4]), .Y(n10) );
  XOR2X1M U5 ( .A(PRESCALE[3]), .B(edge_cnt[3]), .Y(n8) );
  AO2B2X2M U6 ( .B0(strt_glitch), .B1(n1), .A0(sampled_bit), .A1N(n1), .Y(n2)
         );
  NAND2X1M U7 ( .A(strt_chk_en), .B(N1), .Y(n1) );
  OAI2B2X1M U8 ( .A1N(PRESCALE[1]), .A0(n3), .B0(edge_cnt[1]), .B1(n3), .Y(n7)
         );
  OAI2B2X1M U9 ( .A1N(edge_cnt[1]), .A0(n4), .B0(PRESCALE[1]), .B1(n4), .Y(n6)
         );
  XNOR2X1M U10 ( .A(PRESCALE[5]), .B(edge_cnt[5]), .Y(n5) );
  NAND3X1M U11 ( .A(n7), .B(n6), .C(n5), .Y(n11) );
  CLKXOR2X2M U12 ( .A(PRESCALE[2]), .B(edge_cnt[2]), .Y(n9) );
  NOR4X1M U13 ( .A(n11), .B(n10), .C(n9), .D(n8), .Y(N1) );
endmodule


module UART_TOP_RX ( RX_IN, PRESCALE, PAR_EN, PAR_TYP, CLK, RST, P_data, 
        data_valid, par_err, stp_err );
  input [5:0] PRESCALE;
  output [7:0] P_data;
  input RX_IN, PAR_EN, PAR_TYP, CLK, RST;
  output data_valid, par_err, stp_err;
  wire   strt_glitch, data_samp_en, enable, deser_en, par_chk_en, stp_chk_en,
         strt_chk_en, sampled_bit, n1, n2;
  wire   [5:0] edge_cnt;
  wire   [3:0] bit_cnt;

  FSM FSMO_U0 ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), .PAR_EN(PAR_EN), 
        .edge_cnt(edge_cnt), .bit_cnt(bit_cnt), .par_err(par_err), 
        .strt_glitch(strt_glitch), .stp_err(stp_err), .PRESCALE(PRESCALE), 
        .data_samp_en(data_samp_en), .enable(enable), .deser_en(deser_en), 
        .par_chk_en(par_chk_en), .stp_chk_en(stp_chk_en), .strt_chk_en(
        strt_chk_en), .data_valid(data_valid) );
  data_sampling data_sampling_U0 ( .CLK(CLK), .RST(n1), .PRESCALE(PRESCALE), 
        .data_samp_en(data_samp_en), .RX_IN(RX_IN), .edge_cnt(edge_cnt), 
        .sampled_bit(sampled_bit) );
  edge_bit_count edge_bit_count_U0 ( .CLK(CLK), .RST(n1), .PRESCALE(PRESCALE), 
        .enable(enable), .PAR_EN(PAR_EN), .edge_cnt(edge_cnt), .bit_cnt(
        bit_cnt) );
  deserializer deserializer_U0 ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), .deser_en(deser_en), .edge_cnt(edge_cnt), .PRESCALE(PRESCALE), .P_data(
        P_data) );
  Parity_check Parity_check_UO ( .CLK(CLK), .RST(n1), .PAR_TYP(PAR_TYP), 
        .sampled_bit(sampled_bit), .PRESCALE(PRESCALE), .edge_cnt(edge_cnt), 
        .par_chk_en(par_chk_en), .P_data(P_data), .par_err(par_err) );
  stop_check stop_check_U0 ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), 
        .stp_chk_en(stp_chk_en), .PRESCALE(PRESCALE), .edge_cnt(edge_cnt), 
        .stp_err(stp_err) );
  strt_check strt_check_U0 ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), 
        .edge_cnt(edge_cnt), .PRESCALE(PRESCALE), .strt_chk_en(strt_chk_en), 
        .strt_glitch(strt_glitch) );
  INVX4M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART_TX ( DATA_VALID, PAR_EN, ser_done, CLK, RST, ser_en, BUSY, mux_sel
 );
  output [1:0] mux_sel;
  input DATA_VALID, PAR_EN, ser_done, CLK, RST;
  output ser_en, BUSY;
  wire   n5, n6, n7, n8, n9, n1, n2, n3, n4;
  wire   [1:0] current_state;
  wire   [1:0] next_state;

  DFFRQX1M current_state_reg_1_ ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M current_state_reg_0_ ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  NAND2X2M U3 ( .A(n2), .B(n5), .Y(BUSY) );
  OAI21X2M U4 ( .A0(n8), .A1(n1), .B0(n9), .Y(n6) );
  NOR2X2M U5 ( .A(n3), .B(current_state[0]), .Y(n9) );
  INVX2M U6 ( .A(n6), .Y(mux_sel[1]) );
  INVX2M U7 ( .A(n9), .Y(n2) );
  NAND2X2M U8 ( .A(n5), .B(n6), .Y(next_state[1]) );
  INVX2M U9 ( .A(ser_done), .Y(n1) );
  INVX4M U10 ( .A(current_state[1]), .Y(n3) );
  AND2X2M U11 ( .A(PAR_EN), .B(ser_done), .Y(n8) );
  AOI2BB1X2M U12 ( .A0N(current_state[0]), .A1N(ser_done), .B0(n3), .Y(
        mux_sel[0]) );
  OAI221X1M U13 ( .A0(ser_done), .A1(n2), .B0(current_state[1]), .B1(n4), .C0(
        n5), .Y(ser_en) );
  INVX2M U14 ( .A(DATA_VALID), .Y(n4) );
  NAND2X2M U15 ( .A(current_state[0]), .B(n3), .Y(n5) );
  AOI211X2M U16 ( .A0(ser_done), .A1(n3), .B0(current_state[0]), .C0(n7), .Y(
        next_state[0]) );
  AOI21X2M U17 ( .A0(DATA_VALID), .A1(n3), .B0(n8), .Y(n7) );
endmodule


module serializer_IN_WIDTH8_DW01_inc_0 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;

  wire   [31:2] carry;

  ADDHX1M U1_1_30 ( .A(A[30]), .B(carry[30]), .CO(carry[31]), .S(SUM[30]) );
  ADDHX1M U1_1_29 ( .A(A[29]), .B(carry[29]), .CO(carry[30]), .S(SUM[29]) );
  ADDHX1M U1_1_28 ( .A(A[28]), .B(carry[28]), .CO(carry[29]), .S(SUM[28]) );
  ADDHX1M U1_1_27 ( .A(A[27]), .B(carry[27]), .CO(carry[28]), .S(SUM[27]) );
  ADDHX1M U1_1_26 ( .A(A[26]), .B(carry[26]), .CO(carry[27]), .S(SUM[26]) );
  ADDHX1M U1_1_25 ( .A(A[25]), .B(carry[25]), .CO(carry[26]), .S(SUM[25]) );
  ADDHX1M U1_1_24 ( .A(A[24]), .B(carry[24]), .CO(carry[25]), .S(SUM[24]) );
  ADDHX1M U1_1_23 ( .A(A[23]), .B(carry[23]), .CO(carry[24]), .S(SUM[23]) );
  ADDHX1M U1_1_22 ( .A(A[22]), .B(carry[22]), .CO(carry[23]), .S(SUM[22]) );
  ADDHX1M U1_1_21 ( .A(A[21]), .B(carry[21]), .CO(carry[22]), .S(SUM[21]) );
  ADDHX1M U1_1_20 ( .A(A[20]), .B(carry[20]), .CO(carry[21]), .S(SUM[20]) );
  ADDHX1M U1_1_19 ( .A(A[19]), .B(carry[19]), .CO(carry[20]), .S(SUM[19]) );
  ADDHX1M U1_1_18 ( .A(A[18]), .B(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  ADDHX1M U1_1_17 ( .A(A[17]), .B(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  ADDHX1M U1_1_16 ( .A(A[16]), .B(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  ADDHX1M U1_1_15 ( .A(A[15]), .B(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  ADDHX1M U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADDHX1M U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADDHX1M U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHX1M U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHX1M U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHX1M U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHX1M U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX1M U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  CLKXOR2X2M U1 ( .A(carry[31]), .B(A[31]), .Y(SUM[31]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module serializer_IN_WIDTH8 ( CLK, RST, P_DATA, DATA_VALID, ser_en, BUSY, 
        ser_done, ser_data );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, ser_en, BUSY;
  output ser_done, ser_data;
  wire   N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22,
         N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36,
         N37, N38, N39, N40, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n33, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112;
  wire   [31:0] Counter;
  wire   [7:1] LFSR;

  serializer_IN_WIDTH8_DW01_inc_0 add_37 ( .A(Counter), .SUM({N40, N39, N38, 
        N37, N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, 
        N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, 
        N9}) );
  EDFFHQX1M LFSR_reg_7_ ( .D(P_DATA[7]), .E(n60), .CK(CLK), .Q(LFSR[7]) );
  DFFQX2M LFSR_reg_6_ ( .D(n96), .CK(CLK), .Q(LFSR[6]) );
  DFFQX2M LFSR_reg_5_ ( .D(n97), .CK(CLK), .Q(LFSR[5]) );
  DFFQX2M LFSR_reg_4_ ( .D(n98), .CK(CLK), .Q(LFSR[4]) );
  DFFQX2M LFSR_reg_3_ ( .D(n99), .CK(CLK), .Q(LFSR[3]) );
  DFFQX2M LFSR_reg_2_ ( .D(n100), .CK(CLK), .Q(LFSR[2]) );
  DFFQX2M LFSR_reg_1_ ( .D(n101), .CK(CLK), .Q(LFSR[1]) );
  DFFQNX2M LFSR_reg_0_ ( .D(n95), .CK(CLK), .QN(n1) );
  DFFRQX2M Counter_reg_3_ ( .D(n88), .CK(CLK), .RN(n110), .Q(Counter[3]) );
  DFFRQX1M ser_data_reg ( .D(n94), .CK(CLK), .RN(n110), .Q(ser_data) );
  DFFRQX4M ser_done_reg ( .D(n91), .CK(CLK), .RN(n110), .Q(ser_done) );
  DFFRX1M Counter_reg_1_ ( .D(n90), .CK(CLK), .RN(n108), .Q(Counter[1]), .QN(
        n31) );
  DFFRX1M Counter_reg_5_ ( .D(n86), .CK(CLK), .RN(n108), .Q(Counter[5]), .QN(
        n28) );
  DFFRX1M Counter_reg_4_ ( .D(n87), .CK(CLK), .RN(n108), .Q(Counter[4]), .QN(
        n29) );
  DFFRX1M Counter_reg_2_ ( .D(n89), .CK(CLK), .RN(n108), .Q(Counter[2]), .QN(
        n30) );
  DFFRX1M Counter_reg_6_ ( .D(n85), .CK(CLK), .RN(n108), .Q(Counter[6]), .QN(
        n27) );
  DFFRX1M Counter_reg_12_ ( .D(n79), .CK(CLK), .RN(n109), .Q(Counter[12]), 
        .QN(n21) );
  DFFRX1M Counter_reg_0_ ( .D(n93), .CK(CLK), .RN(n108), .Q(Counter[0]), .QN(
        n32) );
  DFFRX1M Counter_reg_15_ ( .D(n76), .CK(CLK), .RN(n109), .Q(Counter[15]), 
        .QN(n18) );
  DFFRX1M Counter_reg_14_ ( .D(n77), .CK(CLK), .RN(n109), .Q(Counter[14]), 
        .QN(n19) );
  DFFRX1M Counter_reg_13_ ( .D(n78), .CK(CLK), .RN(n109), .Q(Counter[13]), 
        .QN(n20) );
  DFFRX1M Counter_reg_11_ ( .D(n80), .CK(CLK), .RN(n108), .Q(Counter[11]), 
        .QN(n22) );
  DFFRX1M Counter_reg_10_ ( .D(n81), .CK(CLK), .RN(n108), .Q(Counter[10]), 
        .QN(n23) );
  DFFRX1M Counter_reg_9_ ( .D(n82), .CK(CLK), .RN(n108), .Q(Counter[9]), .QN(
        n24) );
  DFFRX1M Counter_reg_8_ ( .D(n83), .CK(CLK), .RN(n108), .Q(Counter[8]), .QN(
        n25) );
  DFFRX1M Counter_reg_7_ ( .D(n84), .CK(CLK), .RN(n108), .Q(Counter[7]), .QN(
        n26) );
  DFFRX1M Counter_reg_16_ ( .D(n75), .CK(CLK), .RN(n109), .Q(Counter[16]), 
        .QN(n17) );
  DFFRX1M Counter_reg_17_ ( .D(n74), .CK(CLK), .RN(n109), .Q(Counter[17]), 
        .QN(n16) );
  DFFRX1M Counter_reg_18_ ( .D(n73), .CK(CLK), .RN(n109), .Q(Counter[18]), 
        .QN(n15) );
  DFFRX1M Counter_reg_19_ ( .D(n72), .CK(CLK), .RN(n109), .Q(Counter[19]), 
        .QN(n14) );
  DFFRX1M Counter_reg_20_ ( .D(n71), .CK(CLK), .RN(n109), .Q(Counter[20]), 
        .QN(n13) );
  DFFRX1M Counter_reg_21_ ( .D(n70), .CK(CLK), .RN(n109), .Q(Counter[21]), 
        .QN(n12) );
  DFFRX1M Counter_reg_22_ ( .D(n69), .CK(CLK), .RN(n109), .Q(Counter[22]), 
        .QN(n11) );
  DFFRX1M Counter_reg_23_ ( .D(n68), .CK(CLK), .RN(n109), .Q(Counter[23]), 
        .QN(n10) );
  DFFRX1M Counter_reg_24_ ( .D(n67), .CK(CLK), .RN(n110), .Q(Counter[24]), 
        .QN(n9) );
  DFFRX1M Counter_reg_25_ ( .D(n66), .CK(CLK), .RN(n110), .Q(Counter[25]), 
        .QN(n8) );
  DFFRX1M Counter_reg_26_ ( .D(n65), .CK(CLK), .RN(n110), .Q(Counter[26]), 
        .QN(n7) );
  DFFRX1M Counter_reg_27_ ( .D(n64), .CK(CLK), .RN(n110), .Q(Counter[27]), 
        .QN(n6) );
  DFFRX1M Counter_reg_28_ ( .D(n63), .CK(CLK), .RN(n110), .Q(Counter[28]), 
        .QN(n5) );
  DFFRX1M Counter_reg_29_ ( .D(n62), .CK(CLK), .RN(n110), .Q(Counter[29]), 
        .QN(n4) );
  DFFRX1M Counter_reg_30_ ( .D(n61), .CK(CLK), .RN(n110), .Q(Counter[30]), 
        .QN(n3) );
  DFFRX1M Counter_reg_31_ ( .D(n92), .CK(CLK), .RN(n108), .Q(Counter[31]), 
        .QN(n2) );
  OAI2B1X4M U3 ( .A1N(n37), .A0(n36), .B0(n38), .Y(n34) );
  NOR2BX4M U4 ( .AN(DATA_VALID), .B(BUSY), .Y(n49) );
  INVX6M U5 ( .A(n111), .Y(n108) );
  INVX6M U6 ( .A(n111), .Y(n109) );
  INVX6M U7 ( .A(n112), .Y(n110) );
  BUFX2M U8 ( .A(n112), .Y(n111) );
  INVX2M U9 ( .A(RST), .Y(n112) );
  CLKAND2X4M U10 ( .A(n33), .B(n49), .Y(n53) );
  CLKBUFX6M U11 ( .A(n50), .Y(n33) );
  NOR2BX2M U12 ( .AN(n38), .B(n111), .Y(n50) );
  NOR2BX2M U13 ( .AN(n49), .B(n111), .Y(n60) );
  CLKBUFX6M U14 ( .A(n34), .Y(n105) );
  CLKBUFX6M U15 ( .A(n34), .Y(n106) );
  BUFX6M U16 ( .A(n35), .Y(n103) );
  BUFX6M U17 ( .A(n35), .Y(n102) );
  CLKBUFX6M U18 ( .A(n34), .Y(n107) );
  BUFX4M U19 ( .A(n35), .Y(n104) );
  NOR2BX8M U20 ( .AN(n33), .B(n36), .Y(n52) );
  NOR2BX4M U21 ( .AN(n107), .B(n36), .Y(n35) );
  NAND2BX2M U22 ( .AN(n49), .B(n36), .Y(n38) );
  OAI2B1X2M U23 ( .A1N(LFSR[1]), .A0(n33), .B0(n59), .Y(n101) );
  AOI22X1M U24 ( .A0(LFSR[2]), .A1(n52), .B0(P_DATA[1]), .B1(n53), .Y(n59) );
  OAI2B1X2M U25 ( .A1N(LFSR[2]), .A0(n33), .B0(n58), .Y(n100) );
  AOI22X1M U26 ( .A0(LFSR[3]), .A1(n52), .B0(P_DATA[2]), .B1(n53), .Y(n58) );
  OAI2B1X2M U27 ( .A1N(LFSR[3]), .A0(n33), .B0(n57), .Y(n99) );
  AOI22X1M U28 ( .A0(LFSR[4]), .A1(n52), .B0(P_DATA[3]), .B1(n53), .Y(n57) );
  OAI2B1X2M U29 ( .A1N(LFSR[4]), .A0(n33), .B0(n56), .Y(n98) );
  AOI22X1M U30 ( .A0(LFSR[5]), .A1(n52), .B0(P_DATA[4]), .B1(n53), .Y(n56) );
  OAI2B1X2M U31 ( .A1N(LFSR[5]), .A0(n33), .B0(n55), .Y(n97) );
  AOI22X1M U32 ( .A0(LFSR[6]), .A1(n52), .B0(P_DATA[5]), .B1(n53), .Y(n55) );
  OAI2B1X2M U33 ( .A1N(LFSR[6]), .A0(n33), .B0(n54), .Y(n96) );
  AOI22X1M U34 ( .A0(LFSR[7]), .A1(n52), .B0(P_DATA[6]), .B1(n53), .Y(n54) );
  OAI21X2M U35 ( .A0(n33), .A1(n1), .B0(n51), .Y(n95) );
  AOI22X1M U36 ( .A0(LFSR[1]), .A1(n52), .B0(P_DATA[0]), .B1(n53), .Y(n51) );
  OAI2BB2X1M U37 ( .B0(n107), .B1(n2), .A0N(N40), .A1N(n104), .Y(n92) );
  OAI2BB2X1M U38 ( .B0(n106), .B1(n3), .A0N(N39), .A1N(n103), .Y(n61) );
  OAI2BB2X1M U39 ( .B0(n105), .B1(n5), .A0N(N37), .A1N(n102), .Y(n63) );
  OAI2BB2X1M U40 ( .B0(n105), .B1(n4), .A0N(N38), .A1N(n102), .Y(n62) );
  OAI2BB2X1M U41 ( .B0(n105), .B1(n6), .A0N(N36), .A1N(n102), .Y(n64) );
  OAI2BB2X1M U42 ( .B0(n105), .B1(n10), .A0N(N32), .A1N(n102), .Y(n68) );
  OAI2BB2X1M U43 ( .B0(n105), .B1(n9), .A0N(N33), .A1N(n102), .Y(n67) );
  OAI2BB2X1M U44 ( .B0(n105), .B1(n7), .A0N(N35), .A1N(n102), .Y(n65) );
  OAI2BB2X1M U45 ( .B0(n105), .B1(n8), .A0N(N34), .A1N(n102), .Y(n66) );
  OAI2BB2X1M U46 ( .B0(n105), .B1(n13), .A0N(N29), .A1N(n102), .Y(n71) );
  OAI2BB2X1M U47 ( .B0(n106), .B1(n16), .A0N(N26), .A1N(n103), .Y(n74) );
  OAI2BB2X1M U48 ( .B0(n105), .B1(n11), .A0N(N31), .A1N(n102), .Y(n69) );
  OAI2BB2X1M U49 ( .B0(n105), .B1(n14), .A0N(N28), .A1N(n102), .Y(n72) );
  OAI2BB2X1M U50 ( .B0(n105), .B1(n12), .A0N(N30), .A1N(n102), .Y(n70) );
  OAI2BB2X1M U51 ( .B0(n105), .B1(n15), .A0N(N27), .A1N(n102), .Y(n73) );
  NAND2X4M U52 ( .A(ser_en), .B(BUSY), .Y(n36) );
  OAI2BB2X1M U53 ( .B0(n106), .B1(n17), .A0N(N25), .A1N(n103), .Y(n75) );
  OAI2BB2X1M U54 ( .B0(n106), .B1(n21), .A0N(N21), .A1N(n103), .Y(n79) );
  OAI2BB2X1M U55 ( .B0(n107), .B1(n27), .A0N(N15), .A1N(n103), .Y(n85) );
  OAI2BB2X1M U56 ( .B0(n107), .B1(n31), .A0N(N10), .A1N(n104), .Y(n90) );
  OAI2BB2X1M U57 ( .B0(n106), .B1(n20), .A0N(N22), .A1N(n103), .Y(n78) );
  OAI2BB2X1M U58 ( .B0(n106), .B1(n26), .A0N(N16), .A1N(n103), .Y(n84) );
  OAI2BB2X1M U59 ( .B0(n107), .B1(n32), .A0N(N9), .A1N(n102), .Y(n93) );
  OAI2BB2X1M U60 ( .B0(n106), .B1(n18), .A0N(N24), .A1N(n103), .Y(n76) );
  OAI2BB2X1M U61 ( .B0(n106), .B1(n22), .A0N(N20), .A1N(n103), .Y(n80) );
  OAI2BB2X1M U62 ( .B0(n106), .B1(n24), .A0N(N18), .A1N(n103), .Y(n82) );
  OAI2BB2X1M U63 ( .B0(n107), .B1(n28), .A0N(N14), .A1N(n104), .Y(n86) );
  OAI2BB2X1M U64 ( .B0(n107), .B1(n30), .A0N(N11), .A1N(n104), .Y(n89) );
  OAI2BB2X1M U65 ( .B0(n106), .B1(n19), .A0N(N23), .A1N(n103), .Y(n77) );
  OAI2BB2X1M U66 ( .B0(n106), .B1(n23), .A0N(N19), .A1N(n103), .Y(n81) );
  OAI2BB2X1M U67 ( .B0(n106), .B1(n25), .A0N(N17), .A1N(n103), .Y(n83) );
  OAI2BB2X1M U68 ( .B0(n107), .B1(n29), .A0N(N13), .A1N(n104), .Y(n87) );
  AO2B2X2M U69 ( .B0(N12), .B1(n104), .A0(Counter[3]), .A1N(n107), .Y(n88) );
  OAI2BB2X1M U70 ( .B0(n36), .B1(n37), .A0N(ser_done), .A1N(n38), .Y(n91) );
  OAI2BB2X1M U71 ( .B0(n36), .B1(n1), .A0N(ser_data), .A1N(n49), .Y(n94) );
  NAND4X2M U72 ( .A(n6), .B(n5), .C(n4), .D(n30), .Y(n43) );
  NAND4X2M U73 ( .A(n21), .B(n20), .C(n19), .D(n18), .Y(n47) );
  NAND4X2M U74 ( .A(n10), .B(n9), .C(n8), .D(n7), .Y(n44) );
  NAND4X2M U75 ( .A(n27), .B(n26), .C(n25), .D(n24), .Y(n41) );
  NAND4X2M U76 ( .A(n31), .B(n13), .C(n12), .D(n11), .Y(n45) );
  NAND4X2M U77 ( .A(n3), .B(n2), .C(n29), .D(n28), .Y(n42) );
  NAND4X2M U78 ( .A(n17), .B(n16), .C(n15), .D(n14), .Y(n46) );
  NAND2X2M U79 ( .A(n39), .B(n40), .Y(n37) );
  NOR4X2M U80 ( .A(n45), .B(n46), .C(n47), .D(n48), .Y(n39) );
  NOR4X2M U81 ( .A(n41), .B(n42), .C(n43), .D(n44), .Y(n40) );
  NAND4X2M U82 ( .A(Counter[3]), .B(n32), .C(n23), .D(n22), .Y(n48) );
endmodule


module parity_calc_IN_WIDTH8 ( P_DATA, DATA_VALID, CLK, RST, PAR_TYP, BUSY, 
        par_bit );
  input [7:0] P_DATA;
  input DATA_VALID, CLK, RST, PAR_TYP, BUSY;
  output par_bit;
  wire   n1, n2, n3, n4, n5, n6, n7;

  DFFRQX1M par_bit_reg ( .D(n7), .CK(CLK), .RN(RST), .Q(par_bit) );
  XNOR2X2M U2 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n5) );
  XOR3XLM U3 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U4 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n7) );
  NAND2BX2M U6 ( .AN(BUSY), .B(DATA_VALID), .Y(n2) );
  XOR3XLM U7 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n5), .Y(n4) );
endmodule


module MUX ( TX_OUT, mux_sel, par_bit, ser_data );
  input [1:0] mux_sel;
  input par_bit, ser_data;
  output TX_OUT;
  wire   n2, n3, n1;

  OAI21X4M U3 ( .A0(n2), .A1(n1), .B0(n3), .Y(TX_OUT) );
  NAND3X2M U4 ( .A(mux_sel[1]), .B(n1), .C(ser_data), .Y(n3) );
  NOR2BX2M U5 ( .AN(mux_sel[1]), .B(par_bit), .Y(n2) );
  INVX2M U6 ( .A(mux_sel[0]), .Y(n1) );
endmodule


module UART_TX_TOP ( PAR_EN, P_DATA, DATA_VALID, PAR_TYP, CLK, RST, TX_OUT, 
        BUSY );
  input [7:0] P_DATA;
  input PAR_EN, DATA_VALID, PAR_TYP, CLK, RST;
  output TX_OUT, BUSY;
  wire   ser_done, ser_en, ser_data, par_bit, n1, n2;
  wire   [1:0] mux_sel;

  UART_TX uart ( .DATA_VALID(DATA_VALID), .PAR_EN(PAR_EN), .ser_done(ser_done), 
        .CLK(CLK), .RST(n1), .ser_en(ser_en), .BUSY(BUSY), .mux_sel(mux_sel)
         );
  serializer_IN_WIDTH8 ser ( .CLK(CLK), .RST(n1), .P_DATA(P_DATA), 
        .DATA_VALID(DATA_VALID), .ser_en(ser_en), .BUSY(BUSY), .ser_done(
        ser_done), .ser_data(ser_data) );
  parity_calc_IN_WIDTH8 parity ( .P_DATA(P_DATA), .DATA_VALID(DATA_VALID), 
        .CLK(CLK), .RST(n1), .PAR_TYP(PAR_TYP), .BUSY(BUSY), .par_bit(par_bit)
         );
  MUX mux ( .TX_OUT(TX_OUT), .mux_sel(mux_sel), .par_bit(par_bit), .ser_data(
        ser_data) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART_RX_TX_TOP ( UART_TX_CLK, UART_RX_CLK, RX_IN, RST, F_Empty, PAR_EN, 
        PAR_TYP, UART_config, RD_DATA, TX_OUT, BUSY, par_err, stp_err, P_data, 
        data_valid );
  input [5:0] UART_config;
  input [7:0] RD_DATA;
  output [7:0] P_data;
  input UART_TX_CLK, UART_RX_CLK, RX_IN, RST, F_Empty, PAR_EN, PAR_TYP;
  output TX_OUT, BUSY, par_err, stp_err, data_valid;
  wire   n1, n2;

  UART_TOP_RX UART_TOP_RX_UO ( .RX_IN(RX_IN), .PRESCALE(UART_config), .PAR_EN(
        PAR_EN), .PAR_TYP(PAR_TYP), .CLK(UART_RX_CLK), .RST(n1), .P_data(
        P_data), .data_valid(data_valid), .par_err(par_err), .stp_err(stp_err)
         );
  UART_TX_TOP UART_TX_TOP_U0 ( .PAR_EN(PAR_EN), .P_DATA(RD_DATA), .DATA_VALID(
        F_Empty), .PAR_TYP(PAR_TYP), .CLK(UART_TX_CLK), .RST(n1), .TX_OUT(
        TX_OUT), .BUSY(BUSY) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module FIFO_buffer_in_width8 ( clk, WDATA, wclken, winc, wfull, waddr, raddr, 
        RDATA );
  input [7:0] WDATA;
  input [2:0] waddr;
  input [2:0] raddr;
  output [7:0] RDATA;
  input clk, wclken, winc, wfull;
  wire   n12, n16, n18, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n14,
         n15, n17, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35;
  wire   [63:0] FIFO;

  EDFFX1M FIFO_reg_7__7_ ( .D(WDATA[7]), .E(n5), .CK(clk), .Q(FIFO[63]) );
  EDFFX1M FIFO_reg_7__6_ ( .D(WDATA[6]), .E(n5), .CK(clk), .Q(FIFO[62]) );
  EDFFX1M FIFO_reg_7__5_ ( .D(WDATA[5]), .E(n5), .CK(clk), .Q(FIFO[61]) );
  EDFFX1M FIFO_reg_7__4_ ( .D(WDATA[4]), .E(n5), .CK(clk), .Q(FIFO[60]) );
  EDFFX1M FIFO_reg_7__3_ ( .D(WDATA[3]), .E(n5), .CK(clk), .Q(FIFO[59]) );
  EDFFX1M FIFO_reg_7__2_ ( .D(WDATA[2]), .E(n5), .CK(clk), .Q(FIFO[58]) );
  EDFFX1M FIFO_reg_7__1_ ( .D(WDATA[1]), .E(n5), .CK(clk), .Q(FIFO[57]) );
  EDFFX1M FIFO_reg_7__0_ ( .D(WDATA[0]), .E(n5), .CK(clk), .Q(FIFO[56]) );
  EDFFX1M FIFO_reg_6__7_ ( .D(WDATA[7]), .E(n4), .CK(clk), .Q(FIFO[55]) );
  EDFFX1M FIFO_reg_6__6_ ( .D(WDATA[6]), .E(n4), .CK(clk), .Q(FIFO[54]) );
  EDFFX1M FIFO_reg_6__5_ ( .D(WDATA[5]), .E(n4), .CK(clk), .Q(FIFO[53]) );
  EDFFX1M FIFO_reg_6__4_ ( .D(WDATA[4]), .E(n4), .CK(clk), .Q(FIFO[52]) );
  EDFFX1M FIFO_reg_6__3_ ( .D(WDATA[3]), .E(n4), .CK(clk), .Q(FIFO[51]) );
  EDFFX1M FIFO_reg_6__2_ ( .D(WDATA[2]), .E(n4), .CK(clk), .Q(FIFO[50]) );
  EDFFX1M FIFO_reg_6__1_ ( .D(WDATA[1]), .E(n4), .CK(clk), .Q(FIFO[49]) );
  EDFFX1M FIFO_reg_6__0_ ( .D(WDATA[0]), .E(n4), .CK(clk), .Q(FIFO[48]) );
  EDFFX1M FIFO_reg_5__7_ ( .D(WDATA[7]), .E(n6), .CK(clk), .Q(FIFO[47]) );
  EDFFX1M FIFO_reg_5__6_ ( .D(WDATA[6]), .E(n6), .CK(clk), .Q(FIFO[46]) );
  EDFFX1M FIFO_reg_5__5_ ( .D(WDATA[5]), .E(n6), .CK(clk), .Q(FIFO[45]) );
  EDFFX1M FIFO_reg_5__4_ ( .D(WDATA[4]), .E(n6), .CK(clk), .Q(FIFO[44]) );
  EDFFX1M FIFO_reg_5__3_ ( .D(WDATA[3]), .E(n6), .CK(clk), .Q(FIFO[43]) );
  EDFFX1M FIFO_reg_5__2_ ( .D(WDATA[2]), .E(n6), .CK(clk), .Q(FIFO[42]) );
  EDFFX1M FIFO_reg_5__1_ ( .D(WDATA[1]), .E(n6), .CK(clk), .Q(FIFO[41]) );
  EDFFX1M FIFO_reg_5__0_ ( .D(WDATA[0]), .E(n6), .CK(clk), .Q(FIFO[40]) );
  EDFFX1M FIFO_reg_4__7_ ( .D(WDATA[7]), .E(n2), .CK(clk), .Q(FIFO[39]) );
  EDFFX1M FIFO_reg_4__6_ ( .D(WDATA[6]), .E(n2), .CK(clk), .Q(FIFO[38]) );
  EDFFX1M FIFO_reg_4__5_ ( .D(WDATA[5]), .E(n2), .CK(clk), .Q(FIFO[37]) );
  EDFFX1M FIFO_reg_4__4_ ( .D(WDATA[4]), .E(n2), .CK(clk), .Q(FIFO[36]) );
  EDFFX1M FIFO_reg_4__3_ ( .D(WDATA[3]), .E(n2), .CK(clk), .Q(FIFO[35]) );
  EDFFX1M FIFO_reg_4__2_ ( .D(WDATA[2]), .E(n2), .CK(clk), .Q(FIFO[34]) );
  EDFFX1M FIFO_reg_4__1_ ( .D(WDATA[1]), .E(n2), .CK(clk), .Q(FIFO[33]) );
  EDFFX1M FIFO_reg_4__0_ ( .D(WDATA[0]), .E(n2), .CK(clk), .Q(FIFO[32]) );
  EDFFX1M FIFO_reg_0__7_ ( .D(WDATA[7]), .E(n1), .CK(clk), .Q(FIFO[7]) );
  EDFFX1M FIFO_reg_0__6_ ( .D(WDATA[6]), .E(n1), .CK(clk), .Q(FIFO[6]) );
  EDFFX1M FIFO_reg_0__5_ ( .D(WDATA[5]), .E(n1), .CK(clk), .Q(FIFO[5]) );
  EDFFX1M FIFO_reg_0__4_ ( .D(WDATA[4]), .E(n1), .CK(clk), .Q(FIFO[4]) );
  EDFFX1M FIFO_reg_0__3_ ( .D(WDATA[3]), .E(n1), .CK(clk), .Q(FIFO[3]) );
  EDFFX1M FIFO_reg_0__2_ ( .D(WDATA[2]), .E(n1), .CK(clk), .Q(FIFO[2]) );
  EDFFX1M FIFO_reg_0__1_ ( .D(WDATA[1]), .E(n1), .CK(clk), .Q(FIFO[1]) );
  EDFFX1M FIFO_reg_0__0_ ( .D(WDATA[0]), .E(n1), .CK(clk), .Q(FIFO[0]) );
  EDFFX1M FIFO_reg_3__7_ ( .D(WDATA[7]), .E(n3), .CK(clk), .Q(FIFO[31]) );
  EDFFX1M FIFO_reg_3__6_ ( .D(WDATA[6]), .E(n3), .CK(clk), .Q(FIFO[30]) );
  EDFFX1M FIFO_reg_3__5_ ( .D(WDATA[5]), .E(n3), .CK(clk), .Q(FIFO[29]) );
  EDFFX1M FIFO_reg_3__4_ ( .D(WDATA[4]), .E(n3), .CK(clk), .Q(FIFO[28]) );
  EDFFX1M FIFO_reg_3__3_ ( .D(WDATA[3]), .E(n3), .CK(clk), .Q(FIFO[27]) );
  EDFFX1M FIFO_reg_3__2_ ( .D(WDATA[2]), .E(n3), .CK(clk), .Q(FIFO[26]) );
  EDFFX1M FIFO_reg_3__1_ ( .D(WDATA[1]), .E(n3), .CK(clk), .Q(FIFO[25]) );
  EDFFX1M FIFO_reg_3__0_ ( .D(WDATA[0]), .E(n3), .CK(clk), .Q(FIFO[24]) );
  EDFFX1M FIFO_reg_2__7_ ( .D(WDATA[7]), .E(n8), .CK(clk), .Q(FIFO[23]) );
  EDFFX1M FIFO_reg_2__6_ ( .D(WDATA[6]), .E(n8), .CK(clk), .Q(FIFO[22]) );
  EDFFX1M FIFO_reg_2__5_ ( .D(WDATA[5]), .E(n8), .CK(clk), .Q(FIFO[21]) );
  EDFFX1M FIFO_reg_2__4_ ( .D(WDATA[4]), .E(n8), .CK(clk), .Q(FIFO[20]) );
  EDFFX1M FIFO_reg_2__3_ ( .D(WDATA[3]), .E(n8), .CK(clk), .Q(FIFO[19]) );
  EDFFX1M FIFO_reg_2__2_ ( .D(WDATA[2]), .E(n8), .CK(clk), .Q(FIFO[18]) );
  EDFFX1M FIFO_reg_2__1_ ( .D(WDATA[1]), .E(n8), .CK(clk), .Q(FIFO[17]) );
  EDFFX1M FIFO_reg_2__0_ ( .D(WDATA[0]), .E(n8), .CK(clk), .Q(FIFO[16]) );
  EDFFX1M FIFO_reg_1__7_ ( .D(WDATA[7]), .E(n7), .CK(clk), .Q(FIFO[15]) );
  EDFFX1M FIFO_reg_1__6_ ( .D(WDATA[6]), .E(n7), .CK(clk), .Q(FIFO[14]) );
  EDFFX1M FIFO_reg_1__5_ ( .D(WDATA[5]), .E(n7), .CK(clk), .Q(FIFO[13]) );
  EDFFX1M FIFO_reg_1__4_ ( .D(WDATA[4]), .E(n7), .CK(clk), .Q(FIFO[12]) );
  EDFFX1M FIFO_reg_1__3_ ( .D(WDATA[3]), .E(n7), .CK(clk), .Q(FIFO[11]) );
  EDFFX1M FIFO_reg_1__2_ ( .D(WDATA[2]), .E(n7), .CK(clk), .Q(FIFO[10]) );
  EDFFX1M FIFO_reg_1__1_ ( .D(WDATA[1]), .E(n7), .CK(clk), .Q(FIFO[9]) );
  EDFFX1M FIFO_reg_1__0_ ( .D(WDATA[0]), .E(n7), .CK(clk), .Q(FIFO[8]) );
  AND3X4M U2 ( .A(n34), .B(n35), .C(n12), .Y(n1) );
  AND3X4M U3 ( .A(n34), .B(n35), .C(n18), .Y(n2) );
  AND3X4M U4 ( .A(waddr[0]), .B(n12), .C(waddr[1]), .Y(n3) );
  AND3X4M U5 ( .A(waddr[1]), .B(n34), .C(n18), .Y(n4) );
  AND3X4M U6 ( .A(waddr[1]), .B(waddr[0]), .C(n18), .Y(n5) );
  AND3X4M U7 ( .A(waddr[0]), .B(n35), .C(n18), .Y(n6) );
  AND3X4M U8 ( .A(n12), .B(n35), .C(waddr[0]), .Y(n7) );
  AND3X4M U9 ( .A(n12), .B(n34), .C(waddr[1]), .Y(n8) );
  NOR2BX4M U10 ( .AN(n16), .B(waddr[2]), .Y(n12) );
  INVX2M U11 ( .A(waddr[1]), .Y(n35) );
  INVX2M U12 ( .A(waddr[0]), .Y(n34) );
  INVX6M U13 ( .A(n30), .Y(n29) );
  INVX6M U14 ( .A(n30), .Y(n28) );
  INVX4M U15 ( .A(n33), .Y(n32) );
  INVX4M U16 ( .A(n33), .Y(n31) );
  NOR2BX2M U17 ( .AN(winc), .B(wfull), .Y(n16) );
  AND2X2M U18 ( .A(waddr[2]), .B(n16), .Y(n18) );
  MX2X2M U19 ( .A(n25), .B(n24), .S0(raddr[2]), .Y(RDATA[6]) );
  MX4X1M U20 ( .A(FIFO[38]), .B(FIFO[46]), .C(FIFO[54]), .D(FIFO[62]), .S0(n28), .S1(n31), .Y(n24) );
  MX4X1M U21 ( .A(FIFO[6]), .B(FIFO[14]), .C(FIFO[22]), .D(FIFO[30]), .S0(n29), 
        .S1(n32), .Y(n25) );
  MX2X2M U22 ( .A(n15), .B(n14), .S0(raddr[2]), .Y(RDATA[2]) );
  MX4X1M U23 ( .A(FIFO[34]), .B(FIFO[42]), .C(FIFO[50]), .D(FIFO[58]), .S0(n28), .S1(n31), .Y(n14) );
  MX4X1M U24 ( .A(FIFO[2]), .B(FIFO[10]), .C(FIFO[18]), .D(FIFO[26]), .S0(n29), 
        .S1(n32), .Y(n15) );
  MX2X2M U25 ( .A(n19), .B(n17), .S0(raddr[2]), .Y(RDATA[3]) );
  MX4X1M U26 ( .A(FIFO[35]), .B(FIFO[43]), .C(FIFO[51]), .D(FIFO[59]), .S0(n28), .S1(n31), .Y(n17) );
  MX4X1M U27 ( .A(FIFO[3]), .B(FIFO[11]), .C(FIFO[19]), .D(FIFO[27]), .S0(n29), 
        .S1(n32), .Y(n19) );
  MX2X2M U28 ( .A(n21), .B(n20), .S0(raddr[2]), .Y(RDATA[4]) );
  MX4X1M U29 ( .A(FIFO[36]), .B(FIFO[44]), .C(FIFO[52]), .D(FIFO[60]), .S0(n28), .S1(n31), .Y(n20) );
  MX4X1M U30 ( .A(FIFO[4]), .B(FIFO[12]), .C(FIFO[20]), .D(FIFO[28]), .S0(n29), 
        .S1(n32), .Y(n21) );
  MX2X2M U31 ( .A(n23), .B(n22), .S0(raddr[2]), .Y(RDATA[5]) );
  MX4X1M U32 ( .A(FIFO[37]), .B(FIFO[45]), .C(FIFO[53]), .D(FIFO[61]), .S0(n28), .S1(n31), .Y(n22) );
  MX4X1M U33 ( .A(FIFO[5]), .B(FIFO[13]), .C(FIFO[21]), .D(FIFO[29]), .S0(n29), 
        .S1(n32), .Y(n23) );
  MX2X2M U34 ( .A(n10), .B(n9), .S0(raddr[2]), .Y(RDATA[0]) );
  MX4X1M U35 ( .A(FIFO[32]), .B(FIFO[40]), .C(FIFO[48]), .D(FIFO[56]), .S0(n28), .S1(n31), .Y(n9) );
  MX4X1M U36 ( .A(FIFO[0]), .B(FIFO[8]), .C(FIFO[16]), .D(FIFO[24]), .S0(n29), 
        .S1(n32), .Y(n10) );
  MX2X2M U37 ( .A(n13), .B(n11), .S0(raddr[2]), .Y(RDATA[1]) );
  MX4X1M U38 ( .A(FIFO[33]), .B(FIFO[41]), .C(FIFO[49]), .D(FIFO[57]), .S0(n28), .S1(n31), .Y(n11) );
  MX4X1M U39 ( .A(FIFO[1]), .B(FIFO[9]), .C(FIFO[17]), .D(FIFO[25]), .S0(n29), 
        .S1(n32), .Y(n13) );
  MX2X2M U40 ( .A(n27), .B(n26), .S0(raddr[2]), .Y(RDATA[7]) );
  MX4X1M U41 ( .A(FIFO[39]), .B(FIFO[47]), .C(FIFO[55]), .D(FIFO[63]), .S0(n28), .S1(n31), .Y(n26) );
  MX4X1M U42 ( .A(FIFO[7]), .B(FIFO[15]), .C(FIFO[23]), .D(FIFO[31]), .S0(n29), 
        .S1(n32), .Y(n27) );
  INVX2M U43 ( .A(raddr[1]), .Y(n33) );
  INVX2M U44 ( .A(raddr[0]), .Y(n30) );
endmodule


module fifo_wr_IN_WIDTH3 ( winc, wclk, wrst_n, wq2_rptr, waddr, wptr, wfull );
  input [3:0] wq2_rptr;
  output [2:0] waddr;
  output [3:0] wptr;
  input winc, wclk, wrst_n;
  output wfull;
  wire   wbin_3_, wfull_val_0_, n1, n2, n3, n4, n6, n8, n5, n7, n9, n10;
  wire   [3:0] wbinnext;
  wire   [2:0] wgraynext;

  DFFRQX2M wbin_reg_3_ ( .D(wbinnext[3]), .CK(wclk), .RN(n9), .Q(wbin_3_) );
  DFFRQX2M wfull_reg ( .D(wfull_val_0_), .CK(wclk), .RN(n9), .Q(wfull) );
  DFFRQX2M wptr_reg_3_ ( .D(wbinnext[3]), .CK(wclk), .RN(n9), .Q(wptr[3]) );
  DFFRQX2M wbin_reg_2_ ( .D(wbinnext[2]), .CK(wclk), .RN(n9), .Q(waddr[2]) );
  DFFRQX2M wptr_reg_2_ ( .D(wgraynext[2]), .CK(wclk), .RN(n9), .Q(wptr[2]) );
  DFFRQX2M wptr_reg_1_ ( .D(wgraynext[1]), .CK(wclk), .RN(n9), .Q(wptr[1]) );
  DFFRQX2M wptr_reg_0_ ( .D(wgraynext[0]), .CK(wclk), .RN(n9), .Q(wptr[0]) );
  DFFRHQX4M wbin_reg_0_ ( .D(wbinnext[0]), .CK(wclk), .RN(n9), .Q(waddr[0]) );
  DFFRHQX4M wbin_reg_1_ ( .D(wbinnext[1]), .CK(wclk), .RN(n9), .Q(waddr[1]) );
  NOR2BX2M U3 ( .AN(winc), .B(wfull), .Y(n8) );
  INVX4M U4 ( .A(n10), .Y(n9) );
  INVX2M U5 ( .A(wrst_n), .Y(n10) );
  CLKXOR2X2M U6 ( .A(wbinnext[2]), .B(wbinnext[1]), .Y(wgraynext[1]) );
  CLKXOR2X2M U7 ( .A(wbinnext[1]), .B(wbinnext[0]), .Y(wgraynext[0]) );
  CLKXOR2X2M U8 ( .A(wbinnext[3]), .B(wbinnext[2]), .Y(wgraynext[2]) );
  CLKXOR2X2M U9 ( .A(n5), .B(waddr[2]), .Y(wbinnext[2]) );
  AND2X2M U10 ( .A(waddr[1]), .B(n6), .Y(n5) );
  CLKXOR2X2M U11 ( .A(wq2_rptr[1]), .B(wgraynext[1]), .Y(n4) );
  NOR4X1M U12 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(wfull_val_0_) );
  XNOR2X2M U13 ( .A(wbinnext[3]), .B(wq2_rptr[3]), .Y(n2) );
  CLKXOR2X2M U14 ( .A(wq2_rptr[0]), .B(wgraynext[0]), .Y(n3) );
  XNOR2X2M U15 ( .A(wgraynext[2]), .B(wq2_rptr[2]), .Y(n1) );
  AND2X2M U16 ( .A(waddr[0]), .B(n8), .Y(n6) );
  CLKXOR2X2M U17 ( .A(n7), .B(wbin_3_), .Y(wbinnext[3]) );
  AND3X2M U18 ( .A(waddr[1]), .B(n6), .C(waddr[2]), .Y(n7) );
  CLKXOR2X2M U19 ( .A(n6), .B(waddr[1]), .Y(wbinnext[1]) );
  CLKXOR2X2M U20 ( .A(n8), .B(waddr[0]), .Y(wbinnext[0]) );
endmodule


module fifo_rd_ADDRSIZE3 ( rinc, rclk, rrst_n, rq2_wptr, rempty, raddr, rptr
 );
  input [3:0] rq2_wptr;
  output [2:0] raddr;
  output [3:0] rptr;
  input rinc, rclk, rrst_n;
  output rempty;
  wire   rbin_3_, N2, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [3:0] rbinnext;
  wire   [2:0] rgraynext;

  DFFRHQX8M rbin_reg_2_ ( .D(rbinnext[2]), .CK(rclk), .RN(n9), .Q(raddr[2]) );
  DFFRQX1M rbin_reg_3_ ( .D(rbinnext[3]), .CK(rclk), .RN(n9), .Q(rbin_3_) );
  DFFSQX2M rempty_reg ( .D(N2), .CK(rclk), .SN(n9), .Q(rempty) );
  DFFRQX1M rptr_reg_3_ ( .D(rbinnext[3]), .CK(rclk), .RN(n9), .Q(rptr[3]) );
  DFFRQX2M rbin_reg_0_ ( .D(rbinnext[0]), .CK(rclk), .RN(n9), .Q(raddr[0]) );
  DFFRQX2M rbin_reg_1_ ( .D(rbinnext[1]), .CK(rclk), .RN(n9), .Q(raddr[1]) );
  DFFRQX1M rptr_reg_0_ ( .D(rgraynext[0]), .CK(rclk), .RN(n9), .Q(rptr[0]) );
  DFFRQX1M rptr_reg_1_ ( .D(rgraynext[1]), .CK(rclk), .RN(n9), .Q(rptr[1]) );
  DFFRQX1M rptr_reg_2_ ( .D(rgraynext[2]), .CK(rclk), .RN(n9), .Q(rptr[2]) );
  INVX4M U3 ( .A(n10), .Y(n9) );
  INVX2M U4 ( .A(rrst_n), .Y(n10) );
  CLKXOR2X2M U5 ( .A(rbinnext[3]), .B(rbinnext[2]), .Y(rgraynext[2]) );
  CLKXOR2X2M U6 ( .A(rbinnext[2]), .B(rbinnext[1]), .Y(rgraynext[1]) );
  CLKXOR2X2M U7 ( .A(rbinnext[1]), .B(rbinnext[0]), .Y(rgraynext[0]) );
  CLKXOR2X2M U8 ( .A(n6), .B(raddr[1]), .Y(rbinnext[1]) );
  CLKXOR2X2M U9 ( .A(rq2_wptr[0]), .B(rgraynext[0]), .Y(n3) );
  NOR4X1M U10 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(N2) );
  CLKXOR2X2M U11 ( .A(rq2_wptr[3]), .B(rbinnext[3]), .Y(n2) );
  CLKXOR2X2M U12 ( .A(rq2_wptr[2]), .B(rgraynext[2]), .Y(n1) );
  CLKXOR2X2M U13 ( .A(rq2_wptr[1]), .B(rgraynext[1]), .Y(n4) );
  NOR2BX2M U14 ( .AN(rinc), .B(rempty), .Y(n5) );
  CLKXOR2X2M U15 ( .A(n7), .B(rbin_3_), .Y(rbinnext[3]) );
  AND3X2M U16 ( .A(raddr[1]), .B(n6), .C(raddr[2]), .Y(n7) );
  AND2X2M U17 ( .A(raddr[0]), .B(n5), .Y(n6) );
  CLKXOR2X2M U18 ( .A(n8), .B(raddr[2]), .Y(rbinnext[2]) );
  AND2X2M U19 ( .A(raddr[1]), .B(n6), .Y(n8) );
  CLKXOR2X2M U20 ( .A(n5), .B(raddr[0]), .Y(rbinnext[0]) );
endmodule


module DF_SYNC_0 ( pointer_in, clk_in, rst_n, pointer_out );
  input [3:0] pointer_in;
  output [3:0] pointer_out;
  input clk_in, rst_n;
  wire   n1, n2;
  wire   [3:0] pointer_2;

  DFFRQX2M pointer_out_reg_1_ ( .D(pointer_2[1]), .CK(clk_in), .RN(n1), .Q(
        pointer_out[1]) );
  DFFRQX2M pointer_out_reg_0_ ( .D(pointer_2[0]), .CK(clk_in), .RN(n1), .Q(
        pointer_out[0]) );
  DFFRQX2M pointer_out_reg_3_ ( .D(pointer_2[3]), .CK(clk_in), .RN(n1), .Q(
        pointer_out[3]) );
  DFFRQX2M pointer_out_reg_2_ ( .D(pointer_2[2]), .CK(clk_in), .RN(n1), .Q(
        pointer_out[2]) );
  DFFRQX2M pointer_2_reg_3_ ( .D(pointer_in[3]), .CK(clk_in), .RN(n1), .Q(
        pointer_2[3]) );
  DFFRQX2M pointer_2_reg_2_ ( .D(pointer_in[2]), .CK(clk_in), .RN(n1), .Q(
        pointer_2[2]) );
  DFFRQX2M pointer_2_reg_1_ ( .D(pointer_in[1]), .CK(clk_in), .RN(n1), .Q(
        pointer_2[1]) );
  DFFRQX2M pointer_2_reg_0_ ( .D(pointer_in[0]), .CK(clk_in), .RN(n1), .Q(
        pointer_2[0]) );
  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rst_n), .Y(n2) );
endmodule


module DF_SYNC_1 ( pointer_in, clk_in, rst_n, pointer_out );
  input [3:0] pointer_in;
  output [3:0] pointer_out;
  input clk_in, rst_n;
  wire   n1, n2;
  wire   [3:0] pointer_2;

  DFFRQX1M pointer_out_reg_3_ ( .D(pointer_2[3]), .CK(clk_in), .RN(n1), .Q(
        pointer_out[3]) );
  DFFRQX1M pointer_out_reg_2_ ( .D(pointer_2[2]), .CK(clk_in), .RN(n1), .Q(
        pointer_out[2]) );
  DFFRQX1M pointer_out_reg_1_ ( .D(pointer_2[1]), .CK(clk_in), .RN(n1), .Q(
        pointer_out[1]) );
  DFFRQX1M pointer_out_reg_0_ ( .D(pointer_2[0]), .CK(clk_in), .RN(n1), .Q(
        pointer_out[0]) );
  DFFRQX1M pointer_2_reg_3_ ( .D(pointer_in[3]), .CK(clk_in), .RN(n1), .Q(
        pointer_2[3]) );
  DFFRQX1M pointer_2_reg_2_ ( .D(pointer_in[2]), .CK(clk_in), .RN(n1), .Q(
        pointer_2[2]) );
  DFFRQX1M pointer_2_reg_1_ ( .D(pointer_in[1]), .CK(clk_in), .RN(n1), .Q(
        pointer_2[1]) );
  DFFRQX1M pointer_2_reg_0_ ( .D(pointer_in[0]), .CK(clk_in), .RN(n1), .Q(
        pointer_2[0]) );
  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(rst_n), .Y(n2) );
endmodule


module FIFO_TOP ( WDATA, winc, wclk, wrst_n, rinc, rclk, rrst_n, wfull, rdata, 
        rempty );
  input [7:0] WDATA;
  output [7:0] rdata;
  input winc, wclk, wrst_n, rinc, rclk, rrst_n;
  output wfull, rempty;
  wire   n1, n2, n3, n4;
  wire   [2:0] waddr;
  wire   [2:0] raddr;
  wire   [3:0] wq2_rptr;
  wire   [3:0] wptr;
  wire   [3:0] rq2_wptr;
  wire   [3:0] rptr;

  FIFO_buffer_in_width8 fifo_mem ( .clk(wclk), .WDATA(WDATA), .wclken(1'b0), 
        .winc(winc), .wfull(wfull), .waddr(waddr), .raddr(raddr), .RDATA(rdata) );
  fifo_wr_IN_WIDTH3 fifo_wr_u0 ( .winc(winc), .wclk(wclk), .wrst_n(n1), 
        .wq2_rptr(wq2_rptr), .waddr(waddr), .wptr(wptr), .wfull(wfull) );
  fifo_rd_ADDRSIZE3 fifo_rd_u0 ( .rinc(rinc), .rclk(rclk), .rrst_n(n3), 
        .rq2_wptr(rq2_wptr), .rempty(rempty), .raddr(raddr), .rptr(rptr) );
  DF_SYNC_0 DF_SYNC_rd ( .pointer_in(rptr), .clk_in(wclk), .rst_n(n1), 
        .pointer_out(wq2_rptr) );
  DF_SYNC_1 DF_SYNC_wr ( .pointer_in(wptr), .clk_in(rclk), .rst_n(n3), 
        .pointer_out(rq2_wptr) );
  INVX2M U1 ( .A(n4), .Y(n3) );
  INVX2M U2 ( .A(rrst_n), .Y(n4) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(wrst_n), .Y(n2) );
endmodule


module sys_ctrl_IN_WIDTH16_WIDTH8 ( CLK_IN, RST_IN, full_flag, error, Alu_Out, 
        Out_Valid, RX_P_DATA, RX_D_VLD, RdData, RdData_Valid, ALU_FUN, EN, 
        Gate_EN, Address, WrEn, RdEn, WrData, TX_P_DATA, TX_D_VLD, clk_div_en
 );
  input [15:0] Alu_Out;
  input [7:0] RX_P_DATA;
  input [7:0] RdData;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] WrData;
  output [7:0] TX_P_DATA;
  input CLK_IN, RST_IN, full_flag, error, Out_Valid, RX_D_VLD, RdData_Valid;
  output EN, Gate_EN, WrEn, RdEn, TX_D_VLD, clk_div_en;
  wire   TX_D_VLD_comb, op_B_flag_seq, op_B_flag, op_A_flag,
         is_ALU_operation_seq, is_ALU_operation, N140, N141, N142, N143, N150,
         N152, N159, N162, N163, N169, N170, N171, N172, N174, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167;
  wire   [3:0] current_state;
  wire   [3:0] next_state;

  DFFRHQX8M current_state_reg_1_ ( .D(next_state[1]), .CK(CLK_IN), .RN(RST_IN), 
        .Q(current_state[1]) );
  DFFRHQX8M Address_reg_3_ ( .D(n89), .CK(CLK_IN), .RN(RST_IN), .Q(Address[3])
         );
  DFFRHQX8M Address_reg_2_ ( .D(n90), .CK(CLK_IN), .RN(RST_IN), .Q(Address[2])
         );
  DFFRQX2M Gate_EN_reg ( .D(n72), .CK(CLK_IN), .RN(RST_IN), .Q(Gate_EN) );
  DFFRQX2M WrData_reg_5_ ( .D(n83), .CK(CLK_IN), .RN(n144), .Q(WrData[5]) );
  DFFRQX2M WrData_reg_7_ ( .D(n81), .CK(CLK_IN), .RN(n144), .Q(WrData[7]) );
  DFFRQX2M WrData_reg_6_ ( .D(n82), .CK(CLK_IN), .RN(n144), .Q(WrData[6]) );
  DFFRQX2M WrData_reg_4_ ( .D(n84), .CK(CLK_IN), .RN(n144), .Q(WrData[4]) );
  DFFRQX2M WrData_reg_3_ ( .D(n85), .CK(CLK_IN), .RN(n144), .Q(WrData[3]) );
  DFFRQX2M WrData_reg_2_ ( .D(n86), .CK(CLK_IN), .RN(n144), .Q(WrData[2]) );
  DFFRQX2M WrData_reg_1_ ( .D(n87), .CK(CLK_IN), .RN(n144), .Q(WrData[1]) );
  DFFRQX2M WrData_reg_0_ ( .D(n88), .CK(CLK_IN), .RN(n144), .Q(WrData[0]) );
  EDFFHQX2M op_B_flag_seq_reg ( .D(op_B_flag), .E(RST_IN), .CK(CLK_IN), .Q(
        op_B_flag_seq) );
  EDFFHQX2M is_ALU_operation_seq_reg ( .D(is_ALU_operation), .E(RST_IN), .CK(
        CLK_IN), .Q(is_ALU_operation_seq) );
  DFFRQX2M WrEn_reg ( .D(n150), .CK(CLK_IN), .RN(n144), .Q(WrEn) );
  DFFRQX2M TX_D_VLD_reg ( .D(TX_D_VLD_comb), .CK(CLK_IN), .RN(RST_IN), .Q(
        TX_D_VLD) );
  DFFRQX2M Address_reg_1_ ( .D(n91), .CK(CLK_IN), .RN(n144), .Q(Address[1]) );
  DFFRQX2M Address_reg_0_ ( .D(n92), .CK(CLK_IN), .RN(n144), .Q(Address[0]) );
  DFFRQX2M RdEn_reg ( .D(n151), .CK(CLK_IN), .RN(n144), .Q(RdEn) );
  DFFRQX2M current_state_reg_0_ ( .D(next_state[0]), .CK(CLK_IN), .RN(RST_IN), 
        .Q(current_state[0]) );
  DFFRQX2M ALU_FUN_reg_3_ ( .D(n94), .CK(CLK_IN), .RN(RST_IN), .Q(ALU_FUN[3])
         );
  DFFRQX2M EN_reg ( .D(n93), .CK(CLK_IN), .RN(RST_IN), .Q(EN) );
  DFFRQX2M ALU_FUN_reg_1_ ( .D(n96), .CK(CLK_IN), .RN(RST_IN), .Q(ALU_FUN[1])
         );
  EDFFX1M op_A_flag_seq_reg ( .D(op_A_flag), .E(RST_IN), .CK(CLK_IN), .QN(n123) );
  DFFRQX4M TX_P_DATA_reg_7_ ( .D(n73), .CK(CLK_IN), .RN(RST_IN), .Q(
        TX_P_DATA[7]) );
  DFFRQX4M TX_P_DATA_reg_6_ ( .D(n74), .CK(CLK_IN), .RN(RST_IN), .Q(
        TX_P_DATA[6]) );
  DFFRQX4M TX_P_DATA_reg_5_ ( .D(n75), .CK(CLK_IN), .RN(RST_IN), .Q(
        TX_P_DATA[5]) );
  DFFRQX4M TX_P_DATA_reg_4_ ( .D(n76), .CK(CLK_IN), .RN(n144), .Q(TX_P_DATA[4]) );
  DFFRQX4M TX_P_DATA_reg_3_ ( .D(n77), .CK(CLK_IN), .RN(RST_IN), .Q(
        TX_P_DATA[3]) );
  DFFRQX4M TX_P_DATA_reg_2_ ( .D(n78), .CK(CLK_IN), .RN(RST_IN), .Q(
        TX_P_DATA[2]) );
  DFFRQX4M TX_P_DATA_reg_1_ ( .D(n79), .CK(CLK_IN), .RN(n144), .Q(TX_P_DATA[1]) );
  DFFRQX4M TX_P_DATA_reg_0_ ( .D(n80), .CK(CLK_IN), .RN(n144), .Q(TX_P_DATA[0]) );
  DFFRQX4M current_state_reg_2_ ( .D(next_state[2]), .CK(CLK_IN), .RN(RST_IN), 
        .Q(current_state[2]) );
  DFFRQX4M ALU_FUN_reg_0_ ( .D(n97), .CK(CLK_IN), .RN(RST_IN), .Q(ALU_FUN[0])
         );
  DFFRQX4M current_state_reg_3_ ( .D(next_state[3]), .CK(CLK_IN), .RN(RST_IN), 
        .Q(current_state[3]) );
  DFFRQX4M ALU_FUN_reg_2_ ( .D(n95), .CK(CLK_IN), .RN(RST_IN), .Q(ALU_FUN[2])
         );
  INVX2M U4 ( .A(1'b0), .Y(clk_div_en) );
  MX2X2M U6 ( .A(n142), .B(n16), .S0(n141), .Y(n13) );
  NAND2X2M U7 ( .A(n58), .B(n145), .Y(n3) );
  CLKINVX1M U8 ( .A(n138), .Y(n136) );
  INVX2M U9 ( .A(error), .Y(N174) );
  NAND3X3M U10 ( .A(n65), .B(current_state[3]), .C(current_state[2]), .Y(n56)
         );
  NOR3X8M U11 ( .A(current_state[2]), .B(current_state[3]), .C(n158), .Y(n41)
         );
  BUFX4M U12 ( .A(n38), .Y(n4) );
  OAI22X1M U13 ( .A0(n39), .A1(n40), .B0(n150), .B1(n41), .Y(n38) );
  BUFX2M U14 ( .A(n44), .Y(n5) );
  OAI31X2M U15 ( .A0(n47), .A1(n41), .A2(n48), .B0(n49), .Y(n44) );
  INVX4M U16 ( .A(n140), .Y(n139) );
  INVX4M U17 ( .A(n140), .Y(n138) );
  NOR2X4M U18 ( .A(N172), .B(error), .Y(N159) );
  AOI2B1X2M U19 ( .A1N(n57), .A0(n58), .B0(full_flag), .Y(TX_D_VLD_comb) );
  INVX2M U20 ( .A(current_state[0]), .Y(n159) );
  BUFX6M U21 ( .A(current_state[2]), .Y(n142) );
  NOR2X4M U22 ( .A(n154), .B(current_state[2]), .Y(n60) );
  NAND4X2M U23 ( .A(n56), .B(n63), .C(n24), .D(n64), .Y(is_ALU_operation) );
  INVX2M U24 ( .A(RX_P_DATA[3]), .Y(n164) );
  NOR2X6M U25 ( .A(RX_D_VLD), .B(error), .Y(N172) );
  INVX2M U26 ( .A(n139), .Y(n134) );
  INVX2M U27 ( .A(n114), .Y(n128) );
  INVX2M U28 ( .A(n139), .Y(n135) );
  NOR2X4M U29 ( .A(n157), .B(n155), .Y(n35) );
  NAND2X2M U30 ( .A(n139), .B(n124), .Y(n17) );
  INVX2M U31 ( .A(n8), .Y(n125) );
  INVX2M U32 ( .A(n106), .Y(n129) );
  INVX2M U33 ( .A(n39), .Y(n150) );
  MX2X2M U34 ( .A(error), .B(n127), .S0(n135), .Y(n114) );
  INVX2M U35 ( .A(N159), .Y(n126) );
  NOR2X2M U36 ( .A(n127), .B(n138), .Y(n6) );
  CLKBUFX8M U37 ( .A(RST_IN), .Y(n144) );
  OAI21X4M U38 ( .A0(n158), .A1(n50), .B0(n36), .Y(n48) );
  INVX4M U39 ( .A(n34), .Y(n152) );
  AOI31X2M U40 ( .A0(n35), .A1(n36), .A2(n156), .B0(n143), .Y(n34) );
  OAI2BB1X2M U41 ( .A0N(n60), .A1N(n65), .B0(n45), .Y(n47) );
  INVX2M U42 ( .A(n41), .Y(n156) );
  INVX2M U43 ( .A(n137), .Y(n124) );
  INVX2M U44 ( .A(n50), .Y(n153) );
  NAND2BX2M U45 ( .AN(n142), .B(n124), .Y(n8) );
  NAND2X2M U46 ( .A(TX_D_VLD_comb), .B(n145), .Y(n54) );
  INVX6M U47 ( .A(n36), .Y(n151) );
  NAND2X2M U48 ( .A(n53), .B(n60), .Y(n45) );
  NAND2BX2M U49 ( .AN(n137), .B(n112), .Y(n106) );
  MX2X2M U50 ( .A(N170), .B(N171), .S0(n130), .Y(n112) );
  INVX2M U51 ( .A(n138), .Y(n130) );
  NAND2X2M U52 ( .A(n54), .B(n55), .Y(N170) );
  INVX6M U53 ( .A(n56), .Y(n155) );
  INVX6M U54 ( .A(n59), .Y(n157) );
  INVX2M U55 ( .A(n65), .Y(n158) );
  INVX2M U56 ( .A(is_ALU_operation), .Y(n148) );
  MX3X1M U57 ( .A(n23), .B(n22), .C(n21), .S0(n142), .S1(n141), .Y(
        next_state[0]) );
  AND2X2M U58 ( .A(n98), .B(n124), .Y(n23) );
  MX3X1M U59 ( .A(n128), .B(n6), .C(n19), .S0(current_state[1]), .S1(n142), 
        .Y(n21) );
  MX3X1M U60 ( .A(N159), .B(N150), .C(n6), .S0(n136), .S1(n137), .Y(n22) );
  CLKXOR2X2M U61 ( .A(n138), .B(n142), .Y(n16) );
  MX2X2M U62 ( .A(n17), .B(n137), .S0(n141), .Y(n14) );
  INVX2M U63 ( .A(op_B_flag), .Y(n146) );
  MX2X2M U64 ( .A(N143), .B(n122), .S0(n142), .Y(n110) );
  MX2X2M U65 ( .A(N152), .B(N159), .S0(current_state[1]), .Y(n122) );
  AOI211X2M U66 ( .A0(n146), .A1(n147), .B0(N172), .C0(n148), .Y(N152) );
  INVX2M U67 ( .A(op_A_flag), .Y(n147) );
  INVX2M U68 ( .A(n159), .Y(n140) );
  AOI21BX2M U69 ( .A0(n9), .A1(n10), .B0N(n11), .Y(op_A_flag) );
  XNOR2X2M U70 ( .A(n134), .B(n141), .Y(n10) );
  OAI2BB1X2M U71 ( .A0N(n141), .A1N(n125), .B0(n123), .Y(n11) );
  MX2X2M U72 ( .A(n125), .B(n113), .S0(n141), .Y(n9) );
  MX2X2M U73 ( .A(n109), .B(n108), .S0(n141), .Y(next_state[3]) );
  MX3X1M U74 ( .A(N159), .B(n107), .C(n129), .S0(n137), .S1(n142), .Y(n108) );
  AND2X2M U75 ( .A(n110), .B(n111), .Y(n109) );
  MX2X2M U76 ( .A(N174), .B(N174), .S0(n135), .Y(n107) );
  OR2X2M U77 ( .A(n138), .B(n7), .Y(n118) );
  OR4X1M U78 ( .A(op_A_flag), .B(N172), .C(n148), .D(n146), .Y(n7) );
  MXI3X1M U79 ( .A(n100), .B(n101), .C(n102), .S0(n142), .S1(n141), .Y(
        next_state[1]) );
  NAND2BX2M U80 ( .AN(n136), .B(n119), .Y(n100) );
  NAND2BX2M U81 ( .AN(n142), .B(n116), .Y(n102) );
  MX2X2M U82 ( .A(n118), .B(n117), .S0(current_state[1]), .Y(n101) );
  MXI4X2M U83 ( .A(n103), .B(n104), .C(n105), .D(n106), .S0(n141), .S1(n142), 
        .Y(next_state[2]) );
  MX2X2M U84 ( .A(n121), .B(n126), .S0(n15), .Y(n103) );
  MX2X2M U85 ( .A(n127), .B(n120), .S0(current_state[1]), .Y(n104) );
  MX2X2M U86 ( .A(n114), .B(n117), .S0(n137), .Y(n105) );
  NAND2BX2M U87 ( .AN(n123), .B(n8), .Y(n113) );
  AO21XLM U88 ( .A0(is_ALU_operation), .A1(op_A_flag), .B0(N172), .Y(N150) );
  AND2X2M U89 ( .A(n20), .B(n124), .Y(n19) );
  MX2X2M U90 ( .A(N169), .B(N171), .S0(n133), .Y(n20) );
  INVX2M U91 ( .A(n138), .Y(n133) );
  NOR2X2M U92 ( .A(n56), .B(n54), .Y(N169) );
  NAND2X4M U93 ( .A(n150), .B(n40), .Y(n37) );
  NOR2X4M U94 ( .A(n41), .B(n149), .Y(n52) );
  NOR2X4M U95 ( .A(n164), .B(n161), .Y(n70) );
  NAND2X2M U96 ( .A(n49), .B(n48), .Y(n43) );
  OAI21X2M U97 ( .A0(n56), .A1(n160), .B0(n145), .Y(n55) );
  INVX2M U98 ( .A(N172), .Y(n127) );
  NOR2X2M U99 ( .A(N143), .B(N142), .Y(n68) );
  INVX2M U100 ( .A(n51), .Y(n149) );
  AND4X2M U101 ( .A(n70), .B(n71), .C(n167), .D(n163), .Y(N142) );
  NAND2X2M U102 ( .A(n53), .B(n153), .Y(n39) );
  MX2X2M U103 ( .A(n3), .B(n127), .S0(n131), .Y(n117) );
  INVX2M U104 ( .A(n138), .Y(n131) );
  NOR2X2M U105 ( .A(error), .B(n149), .Y(N162) );
  MX2X2M U106 ( .A(n99), .B(n115), .S0(n137), .Y(n116) );
  NOR2X2M U107 ( .A(n139), .B(n126), .Y(n99) );
  MX2X2M U108 ( .A(N162), .B(N174), .S0(n135), .Y(n115) );
  NAND2BX2M U109 ( .AN(n135), .B(N163), .Y(n120) );
  NOR2X2M U110 ( .A(error), .B(n51), .Y(N163) );
  XNOR2X2M U111 ( .A(current_state[1]), .B(n139), .Y(n15) );
  MXI2X1M U112 ( .A(n17), .B(n138), .S0(n142), .Y(n111) );
  NAND2BX2M U113 ( .AN(current_state[1]), .B(N142), .Y(n121) );
  INVX2M U114 ( .A(error), .Y(n145) );
  OAI211X4M U115 ( .A0(n61), .A1(n62), .B0(n151), .C0(RdData_Valid), .Y(n58)
         );
  OR4X1M U116 ( .A(RdData[4]), .B(RdData[5]), .C(RdData[6]), .D(RdData[7]), 
        .Y(n61) );
  OR4X1M U117 ( .A(RdData[0]), .B(RdData[1]), .C(RdData[2]), .D(RdData[3]), 
        .Y(n62) );
  NOR2X4M U118 ( .A(n159), .B(current_state[1]), .Y(n53) );
  NOR2X2M U119 ( .A(n35), .B(n160), .Y(n57) );
  NAND3X4M U120 ( .A(current_state[1]), .B(n159), .C(n153), .Y(n36) );
  NOR2X4M U121 ( .A(current_state[0]), .B(current_state[1]), .Y(n65) );
  NAND3X2M U122 ( .A(n153), .B(current_state[1]), .C(current_state[0]), .Y(n63) );
  AOI31X2M U123 ( .A0(n156), .A1(n59), .A2(is_ALU_operation_seq), .B0(n47), 
        .Y(n64) );
  NAND3X2M U124 ( .A(current_state[2]), .B(current_state[3]), .C(n53), .Y(n59)
         );
  OAI211X2M U125 ( .A0(n167), .A1(n43), .B0(n45), .C0(n46), .Y(n92) );
  NAND2XLM U126 ( .A(Address[0]), .B(n5), .Y(n46) );
  NAND2X2M U127 ( .A(current_state[1]), .B(n60), .Y(n24) );
  OAI2BB2X1M U128 ( .B0(n165), .B1(n43), .A0N(n5), .A1N(Address[2]), .Y(n90)
         );
  NAND2X2M U129 ( .A(current_state[2]), .B(n154), .Y(n50) );
  OAI2BB2X1M U130 ( .B0(n166), .B1(n43), .A0N(Address[1]), .A1N(n5), .Y(n91)
         );
  OAI2BB2X1M U131 ( .B0(n164), .B1(n43), .A0N(n5), .A1N(Address[3]), .Y(n89)
         );
  OAI2BB2X1M U132 ( .B0(n33), .B1(n143), .A0N(TX_P_DATA[0]), .A1N(n152), .Y(
        n80) );
  AOI222X2M U133 ( .A0(RdData[0]), .A1(n151), .B0(Alu_Out[8]), .B1(n157), .C0(
        Alu_Out[0]), .C1(n155), .Y(n33) );
  OAI2BB2X1M U134 ( .B0(n32), .B1(n143), .A0N(TX_P_DATA[1]), .A1N(n152), .Y(
        n79) );
  AOI222X2M U135 ( .A0(RdData[1]), .A1(n151), .B0(Alu_Out[9]), .B1(n157), .C0(
        Alu_Out[1]), .C1(n155), .Y(n32) );
  OAI2BB2X1M U136 ( .B0(n31), .B1(n143), .A0N(TX_P_DATA[2]), .A1N(n152), .Y(
        n78) );
  AOI222X2M U137 ( .A0(RdData[2]), .A1(n151), .B0(Alu_Out[10]), .B1(n157), 
        .C0(Alu_Out[2]), .C1(n155), .Y(n31) );
  OAI2BB2X1M U138 ( .B0(n30), .B1(n143), .A0N(TX_P_DATA[3]), .A1N(n152), .Y(
        n77) );
  AOI222X2M U139 ( .A0(RdData[3]), .A1(n151), .B0(Alu_Out[11]), .B1(n157), 
        .C0(Alu_Out[3]), .C1(n155), .Y(n30) );
  OAI2BB2X1M U140 ( .B0(n29), .B1(n143), .A0N(TX_P_DATA[4]), .A1N(n152), .Y(
        n76) );
  AOI222X2M U141 ( .A0(RdData[4]), .A1(n151), .B0(Alu_Out[12]), .B1(n157), 
        .C0(Alu_Out[4]), .C1(n155), .Y(n29) );
  OAI2BB2X1M U142 ( .B0(n28), .B1(n143), .A0N(TX_P_DATA[5]), .A1N(n152), .Y(
        n75) );
  AOI222X2M U143 ( .A0(RdData[5]), .A1(n151), .B0(Alu_Out[13]), .B1(n157), 
        .C0(Alu_Out[5]), .C1(n155), .Y(n28) );
  OAI2BB2X1M U144 ( .B0(n27), .B1(n143), .A0N(TX_P_DATA[6]), .A1N(n152), .Y(
        n74) );
  AOI222X2M U145 ( .A0(RdData[6]), .A1(n151), .B0(Alu_Out[14]), .B1(n157), 
        .C0(Alu_Out[6]), .C1(n155), .Y(n27) );
  OAI2BB2X1M U146 ( .B0(n25), .B1(n143), .A0N(TX_P_DATA[7]), .A1N(n152), .Y(
        n73) );
  AOI222X2M U147 ( .A0(RdData[7]), .A1(n151), .B0(Alu_Out[15]), .B1(n157), 
        .C0(Alu_Out[7]), .C1(n155), .Y(n25) );
  MX2X2M U148 ( .A(op_B_flag_seq), .B(n18), .S0(n12), .Y(op_B_flag) );
  NOR2X2M U149 ( .A(n142), .B(n154), .Y(n18) );
  NOR2X2M U150 ( .A(n13), .B(n14), .Y(n12) );
  INVX2M U151 ( .A(current_state[3]), .Y(n154) );
  CLKBUFX6M U152 ( .A(n26), .Y(n143) );
  OAI22X1M U153 ( .A0(n35), .A1(Out_Valid), .B0(RdData_Valid), .B1(n36), .Y(
        n26) );
  BUFX4M U154 ( .A(current_state[1]), .Y(n137) );
  OAI2B2X4M U155 ( .A1N(is_ALU_operation_seq), .A0(RX_D_VLD), .B0(RX_D_VLD), 
        .B1(n42), .Y(n40) );
  NOR2X2M U156 ( .A(Address[2]), .B(Address[3]), .Y(n42) );
  NAND3X4M U157 ( .A(n60), .B(n159), .C(current_state[1]), .Y(n51) );
  NOR4X4M U158 ( .A(n165), .B(n162), .C(RX_P_DATA[1]), .D(RX_P_DATA[5]), .Y(
        n71) );
  INVX4M U159 ( .A(RX_P_DATA[2]), .Y(n165) );
  AOI21X2M U160 ( .A0(Out_Valid), .A1(n157), .B0(error), .Y(N171) );
  INVX2M U161 ( .A(RX_P_DATA[6]), .Y(n162) );
  OAI2BB2X1M U162 ( .B0(n37), .B1(n167), .A0N(WrData[0]), .A1N(n4), .Y(n88) );
  OAI2BB2X1M U163 ( .B0(n37), .B1(n166), .A0N(WrData[1]), .A1N(n4), .Y(n87) );
  OAI2BB2X1M U164 ( .B0(n37), .B1(n165), .A0N(WrData[2]), .A1N(n4), .Y(n86) );
  OAI2BB2X1M U165 ( .B0(n37), .B1(n164), .A0N(WrData[3]), .A1N(n4), .Y(n85) );
  OAI2BB2X1M U166 ( .B0(n37), .B1(n163), .A0N(WrData[4]), .A1N(n4), .Y(n84) );
  OAI2BB2X1M U167 ( .B0(n37), .B1(n162), .A0N(WrData[6]), .A1N(n4), .Y(n82) );
  OAI2BB2X1M U168 ( .B0(n37), .B1(n161), .A0N(WrData[7]), .A1N(n4), .Y(n81) );
  OAI2BB2X1M U169 ( .B0(n167), .B1(n51), .A0N(ALU_FUN[0]), .A1N(n52), .Y(n97)
         );
  OAI2BB2X1M U170 ( .B0(n166), .B1(n51), .A0N(ALU_FUN[1]), .A1N(n52), .Y(n96)
         );
  OAI2BB2X1M U171 ( .B0(n165), .B1(n51), .A0N(ALU_FUN[2]), .A1N(n52), .Y(n95)
         );
  OAI2BB2X1M U172 ( .B0(n164), .B1(n51), .A0N(ALU_FUN[3]), .A1N(n52), .Y(n94)
         );
  OAI2BB1X2M U173 ( .A0N(EN), .A1N(n156), .B0(n51), .Y(n93) );
  NAND2X2M U174 ( .A(RX_D_VLD), .B(n48), .Y(n49) );
  CLKBUFX6M U175 ( .A(current_state[3]), .Y(n141) );
  AND4X2M U176 ( .A(n70), .B(n71), .C(RX_P_DATA[0]), .D(RX_P_DATA[4]), .Y(N143) );
  NAND3X2M U177 ( .A(RX_P_DATA[1]), .B(RX_P_DATA[5]), .C(n70), .Y(n67) );
  OAI2BB1X2M U178 ( .A0N(Gate_EN), .A1N(n156), .B0(n24), .Y(n72) );
  AO2B2XLM U179 ( .B0(WrData[5]), .B1(n4), .A0(RX_P_DATA[5]), .A1N(n37), .Y(
        n83) );
  INVX2M U180 ( .A(Out_Valid), .Y(n160) );
  MX2X2M U181 ( .A(N141), .B(N174), .S0(n137), .Y(n119) );
  OAI31X2M U182 ( .A0(n66), .A1(n167), .A2(n67), .B0(n68), .Y(N141) );
  NAND3X2M U183 ( .A(n165), .B(n162), .C(RX_P_DATA[4]), .Y(n66) );
  INVX2M U184 ( .A(RX_P_DATA[7]), .Y(n161) );
  MX2X2M U185 ( .A(N140), .B(N172), .S0(n132), .Y(n98) );
  INVX2M U186 ( .A(n138), .Y(n132) );
  OAI31X2M U187 ( .A0(n69), .A1(RX_P_DATA[0]), .A2(n67), .B0(n68), .Y(N140) );
  NAND3X2M U188 ( .A(n163), .B(n162), .C(n165), .Y(n69) );
  INVX4M U189 ( .A(RX_P_DATA[0]), .Y(n167) );
  INVX2M U190 ( .A(RX_P_DATA[4]), .Y(n163) );
  INVX2M U191 ( .A(RX_P_DATA[1]), .Y(n166) );
endmodule


module PULSE_GEN ( clk, rst, lvl_sig, pulse_sig );
  input clk, rst, lvl_sig;
  output pulse_sig;
  wire   rcv_flop, pls_flop;

  DFFRQX1M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst), .Q(pls_flop) );
  DFFRQX1M rcv_flop_reg ( .D(lvl_sig), .CK(clk), .RN(rst), .Q(rcv_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module ClkDiv_0_DW01_inc_0 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;

  wire   [31:2] carry;

  ADDHX1M U1_1_30 ( .A(A[30]), .B(carry[30]), .CO(carry[31]), .S(SUM[30]) );
  ADDHX1M U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX1M U1_1_28 ( .A(A[28]), .B(carry[28]), .CO(carry[29]), .S(SUM[28]) );
  ADDHX1M U1_1_27 ( .A(A[27]), .B(carry[27]), .CO(carry[28]), .S(SUM[27]) );
  ADDHX1M U1_1_24 ( .A(A[24]), .B(carry[24]), .CO(carry[25]), .S(SUM[24]) );
  ADDHX1M U1_1_23 ( .A(A[23]), .B(carry[23]), .CO(carry[24]), .S(SUM[23]) );
  ADDHX1M U1_1_20 ( .A(A[20]), .B(carry[20]), .CO(carry[21]), .S(SUM[20]) );
  ADDHX1M U1_1_19 ( .A(A[19]), .B(carry[19]), .CO(carry[20]), .S(SUM[19]) );
  ADDHX1M U1_1_16 ( .A(A[16]), .B(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  ADDHX1M U1_1_15 ( .A(A[15]), .B(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  ADDHX1M U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHX1M U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHX1M U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX1M U1_1_29 ( .A(A[29]), .B(carry[29]), .CO(carry[30]), .S(SUM[29]) );
  ADDHX1M U1_1_26 ( .A(A[26]), .B(carry[26]), .CO(carry[27]), .S(SUM[26]) );
  ADDHX1M U1_1_25 ( .A(A[25]), .B(carry[25]), .CO(carry[26]), .S(SUM[25]) );
  ADDHX1M U1_1_22 ( .A(A[22]), .B(carry[22]), .CO(carry[23]), .S(SUM[22]) );
  ADDHX1M U1_1_21 ( .A(A[21]), .B(carry[21]), .CO(carry[22]), .S(SUM[21]) );
  ADDHX1M U1_1_18 ( .A(A[18]), .B(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  ADDHX1M U1_1_17 ( .A(A[17]), .B(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  ADDHX1M U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADDHX1M U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADDHX1M U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[31]), .B(A[31]), .Y(SUM[31]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_0_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(SUM[7]), .S(SUM[6]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX2M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1M U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_0 ( I_ref_clk, I_rst_n, I_clk_en, I_div_ratio, o_div_clk );
  input [7:0] I_div_ratio;
  input I_ref_clk, I_rst_n, I_clk_en;
  output o_div_clk;
  wire   div_clk, flag, N11, N12, N13, N14, N15, N16, N17, N18, N19, N24, N25,
         N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39,
         N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53,
         N54, N55, n11, n13, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n1, n3, n4, n5, n6, n7, n8, n9, n10, n12, n14, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94;
  wire   [31:0] count;

  ClkDiv_0_DW01_inc_0 add_43 ( .A(count), .SUM({N55, N54, N53, N52, N51, N50, 
        N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, 
        N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24}) );
  ClkDiv_0_DW01_inc_1 add_35 ( .A({1'b0, I_div_ratio[7:1]}), .SUM({N18, N17, 
        N16, N15, N14, N13, N12, N11}) );
  DFFRQX2M div_clk_reg ( .D(n21), .CK(I_ref_clk), .RN(n12), .Q(div_clk) );
  DFFSQX2M flag_reg ( .D(n22), .CK(I_ref_clk), .SN(n10), .Q(flag) );
  DFFRQX4M count_reg_15_ ( .D(n39), .CK(I_ref_clk), .RN(n12), .Q(count[15]) );
  DFFRQX4M count_reg_16_ ( .D(n38), .CK(I_ref_clk), .RN(n12), .Q(count[16]) );
  DFFRQX4M count_reg_18_ ( .D(n36), .CK(I_ref_clk), .RN(n12), .Q(count[18]) );
  DFFRQX4M count_reg_17_ ( .D(n37), .CK(I_ref_clk), .RN(n12), .Q(count[17]) );
  DFFRQX2M count_reg_31_ ( .D(n23), .CK(I_ref_clk), .RN(n14), .Q(count[31]) );
  DFFRQX4M count_reg_1_ ( .D(n53), .CK(I_ref_clk), .RN(n10), .Q(count[1]) );
  DFFRQX4M count_reg_0_ ( .D(n94), .CK(I_ref_clk), .RN(n10), .Q(count[0]) );
  DFFRQX2M count_reg_10_ ( .D(n44), .CK(I_ref_clk), .RN(n10), .Q(count[10]) );
  DFFRQX2M count_reg_14_ ( .D(n40), .CK(I_ref_clk), .RN(n12), .Q(count[14]) );
  DFFRQX2M count_reg_13_ ( .D(n41), .CK(I_ref_clk), .RN(n12), .Q(count[13]) );
  DFFRQX2M count_reg_6_ ( .D(n48), .CK(I_ref_clk), .RN(n10), .Q(count[6]) );
  DFFRQX2M count_reg_5_ ( .D(n49), .CK(I_ref_clk), .RN(n10), .Q(count[5]) );
  DFFRQX2M count_reg_4_ ( .D(n50), .CK(I_ref_clk), .RN(n10), .Q(count[4]) );
  DFFRQX2M count_reg_3_ ( .D(n51), .CK(I_ref_clk), .RN(n10), .Q(count[3]) );
  DFFRQX2M count_reg_7_ ( .D(n47), .CK(I_ref_clk), .RN(n10), .Q(count[7]) );
  DFFRQX2M count_reg_8_ ( .D(n46), .CK(I_ref_clk), .RN(n10), .Q(count[8]) );
  DFFRQX2M count_reg_27_ ( .D(n27), .CK(I_ref_clk), .RN(n14), .Q(count[27]) );
  DFFRQX2M count_reg_23_ ( .D(n31), .CK(I_ref_clk), .RN(n12), .Q(count[23]) );
  DFFRQX2M count_reg_19_ ( .D(n35), .CK(I_ref_clk), .RN(n12), .Q(count[19]) );
  DFFRQX2M count_reg_11_ ( .D(n43), .CK(I_ref_clk), .RN(n10), .Q(count[11]) );
  DFFRQX2M count_reg_28_ ( .D(n26), .CK(I_ref_clk), .RN(n14), .Q(count[28]) );
  DFFRQX2M count_reg_24_ ( .D(n30), .CK(I_ref_clk), .RN(n14), .Q(count[24]) );
  DFFRQX2M count_reg_20_ ( .D(n34), .CK(I_ref_clk), .RN(n12), .Q(count[20]) );
  DFFRQX2M count_reg_12_ ( .D(n42), .CK(I_ref_clk), .RN(n12), .Q(count[12]) );
  DFFRQX2M count_reg_30_ ( .D(n24), .CK(I_ref_clk), .RN(n14), .Q(count[30]) );
  DFFRQX2M count_reg_26_ ( .D(n28), .CK(I_ref_clk), .RN(n14), .Q(count[26]) );
  DFFRQX2M count_reg_22_ ( .D(n32), .CK(I_ref_clk), .RN(n12), .Q(count[22]) );
  DFFRQX2M count_reg_29_ ( .D(n25), .CK(I_ref_clk), .RN(n14), .Q(count[29]) );
  DFFRQX2M count_reg_25_ ( .D(n29), .CK(I_ref_clk), .RN(n14), .Q(count[25]) );
  DFFRQX2M count_reg_21_ ( .D(n33), .CK(I_ref_clk), .RN(n12), .Q(count[21]) );
  DFFRQX2M count_reg_9_ ( .D(n45), .CK(I_ref_clk), .RN(n10), .Q(count[9]) );
  DFFRQX2M count_reg_2_ ( .D(n52), .CK(I_ref_clk), .RN(n10), .Q(count[2]) );
  NOR4X1M U3 ( .A(I_div_ratio[7]), .B(I_div_ratio[6]), .C(I_div_ratio[5]), .D(
        I_div_ratio[4]), .Y(n20) );
  NOR3X2M U4 ( .A(I_div_ratio[1]), .B(I_div_ratio[3]), .C(I_div_ratio[2]), .Y(
        n19) );
  NOR2BX2M U5 ( .AN(count[0]), .B(N11), .Y(n81) );
  NOR2BX2M U7 ( .AN(I_div_ratio[1]), .B(count[0]), .Y(n62) );
  NOR2BX2M U8 ( .AN(count[0]), .B(I_div_ratio[1]), .Y(n61) );
  NOR2BX2M U9 ( .AN(N11), .B(count[0]), .Y(n80) );
  OAI21X2M U10 ( .A0(I_div_ratio[0]), .A1(n3), .B0(n13), .Y(n17) );
  AOI21BX2M U11 ( .A0(n19), .A1(n20), .B0N(I_clk_en), .Y(n1) );
  CLKBUFX8M U12 ( .A(n54), .Y(n12) );
  BUFX4M U13 ( .A(n54), .Y(n14) );
  BUFX6M U14 ( .A(n15), .Y(n5) );
  BUFX6M U15 ( .A(n15), .Y(n6) );
  BUFX4M U16 ( .A(n15), .Y(n7) );
  CLKBUFX8M U17 ( .A(n54), .Y(n10) );
  BUFX2M U18 ( .A(I_rst_n), .Y(n54) );
  NOR2X4M U19 ( .A(n17), .B(n8), .Y(n15) );
  OR4X1M U20 ( .A(n73), .B(n72), .C(n71), .D(n70), .Y(n3) );
  AND2X2M U21 ( .A(n17), .B(n1), .Y(n11) );
  INVX8M U22 ( .A(n1), .Y(n9) );
  INVX8M U23 ( .A(n1), .Y(n8) );
  AO22X1M U24 ( .A0(count[31]), .A1(n8), .B0(N55), .B1(n7), .Y(n23) );
  NAND2X2M U25 ( .A(I_div_ratio[0]), .B(n18), .Y(n13) );
  OAI2BB2X1M U26 ( .B0(flag), .B1(n3), .A0N(flag), .A1N(N19), .Y(n18) );
  INVX2M U27 ( .A(n16), .Y(n94) );
  AOI221X2M U28 ( .A0(count[0]), .A1(n8), .B0(N24), .B1(n5), .C0(n11), .Y(n16)
         );
  AO22X1M U29 ( .A0(count[1]), .A1(n9), .B0(N25), .B1(n5), .Y(n53) );
  AO22X1M U30 ( .A0(count[9]), .A1(n9), .B0(N33), .B1(n5), .Y(n45) );
  AO22X1M U31 ( .A0(count[13]), .A1(n9), .B0(N37), .B1(n6), .Y(n41) );
  AO22X1M U32 ( .A0(count[14]), .A1(n9), .B0(N38), .B1(n6), .Y(n40) );
  AO22X1M U33 ( .A0(count[17]), .A1(n8), .B0(N41), .B1(n6), .Y(n37) );
  AO22X1M U34 ( .A0(count[18]), .A1(n8), .B0(N42), .B1(n6), .Y(n36) );
  AO22X1M U35 ( .A0(count[21]), .A1(n8), .B0(N45), .B1(n6), .Y(n33) );
  AO22X1M U36 ( .A0(count[22]), .A1(n8), .B0(N46), .B1(n6), .Y(n32) );
  AO22X1M U37 ( .A0(count[25]), .A1(n8), .B0(N49), .B1(n6), .Y(n29) );
  AO22X1M U38 ( .A0(count[26]), .A1(n8), .B0(N50), .B1(n7), .Y(n28) );
  AO22X1M U39 ( .A0(count[29]), .A1(n8), .B0(N53), .B1(n7), .Y(n25) );
  AO22X1M U40 ( .A0(count[30]), .A1(n8), .B0(N54), .B1(n7), .Y(n24) );
  AO22X1M U41 ( .A0(count[11]), .A1(n9), .B0(N35), .B1(n5), .Y(n43) );
  AO22X1M U42 ( .A0(count[12]), .A1(n9), .B0(N36), .B1(n5), .Y(n42) );
  AO22X1M U43 ( .A0(count[15]), .A1(n9), .B0(N39), .B1(n6), .Y(n39) );
  AO22X1M U44 ( .A0(count[16]), .A1(n9), .B0(N40), .B1(n6), .Y(n38) );
  AO22X1M U45 ( .A0(count[19]), .A1(n8), .B0(N43), .B1(n6), .Y(n35) );
  AO22X1M U46 ( .A0(count[20]), .A1(n8), .B0(N44), .B1(n6), .Y(n34) );
  AO22X1M U47 ( .A0(count[23]), .A1(n8), .B0(N47), .B1(n6), .Y(n31) );
  AO22X1M U48 ( .A0(count[24]), .A1(n9), .B0(N48), .B1(n6), .Y(n30) );
  AO22X1M U49 ( .A0(count[27]), .A1(n8), .B0(N51), .B1(n7), .Y(n27) );
  AO22X1M U50 ( .A0(count[28]), .A1(n8), .B0(N52), .B1(n7), .Y(n26) );
  AO22X1M U51 ( .A0(count[8]), .A1(n9), .B0(N32), .B1(n5), .Y(n46) );
  AO22X1M U52 ( .A0(count[7]), .A1(n9), .B0(N31), .B1(n5), .Y(n47) );
  AO22X1M U53 ( .A0(count[2]), .A1(n9), .B0(N26), .B1(n5), .Y(n52) );
  AO22X1M U54 ( .A0(count[3]), .A1(n9), .B0(N27), .B1(n5), .Y(n51) );
  AO22X1M U55 ( .A0(count[4]), .A1(n9), .B0(N28), .B1(n5), .Y(n50) );
  AO22X1M U56 ( .A0(count[5]), .A1(n9), .B0(N29), .B1(n5), .Y(n49) );
  AO22X1M U57 ( .A0(count[6]), .A1(n9), .B0(N30), .B1(n5), .Y(n48) );
  AO22X1M U58 ( .A0(count[10]), .A1(n9), .B0(N34), .B1(n5), .Y(n44) );
  CLKXOR2X2M U59 ( .A(div_clk), .B(n11), .Y(n21) );
  CLKXOR2X2M U60 ( .A(flag), .B(n4), .Y(n22) );
  NOR2X2M U61 ( .A(n13), .B(n8), .Y(n4) );
  MX2X6M U62 ( .A(I_ref_clk), .B(div_clk), .S0(n1), .Y(o_div_clk) );
  NOR4X1M U63 ( .A(count[22]), .B(count[21]), .C(count[20]), .D(count[19]), 
        .Y(n58) );
  NOR4X1M U64 ( .A(count[26]), .B(count[25]), .C(count[24]), .D(count[23]), 
        .Y(n57) );
  NOR4X1M U65 ( .A(count[30]), .B(count[29]), .C(count[28]), .D(count[27]), 
        .Y(n56) );
  NOR4X1M U66 ( .A(count[9]), .B(count[8]), .C(count[7]), .D(count[31]), .Y(
        n55) );
  NAND4X1M U67 ( .A(n58), .B(n57), .C(n56), .D(n55), .Y(n73) );
  NOR4X1M U68 ( .A(count[14]), .B(count[13]), .C(count[12]), .D(count[11]), 
        .Y(n60) );
  NOR4X1M U69 ( .A(count[18]), .B(count[17]), .C(count[16]), .D(count[15]), 
        .Y(n59) );
  CLKNAND2X2M U70 ( .A(n60), .B(n59), .Y(n72) );
  OAI2B2X1M U71 ( .A1N(I_div_ratio[2]), .A0(n61), .B0(count[1]), .B1(n61), .Y(
        n65) );
  XNOR2X1M U72 ( .A(I_div_ratio[3]), .B(count[2]), .Y(n64) );
  OAI2B2X1M U73 ( .A1N(count[1]), .A0(n62), .B0(I_div_ratio[2]), .B1(n62), .Y(
        n63) );
  NAND4BX1M U74 ( .AN(count[10]), .B(n65), .C(n64), .D(n63), .Y(n71) );
  XNOR2X1M U75 ( .A(I_div_ratio[7]), .B(count[6]), .Y(n69) );
  XNOR2X1M U76 ( .A(I_div_ratio[6]), .B(count[5]), .Y(n68) );
  XNOR2X1M U77 ( .A(I_div_ratio[5]), .B(count[4]), .Y(n67) );
  XNOR2X1M U78 ( .A(I_div_ratio[4]), .B(count[3]), .Y(n66) );
  NAND4X1M U79 ( .A(n69), .B(n68), .C(n67), .D(n66), .Y(n70) );
  NOR4X1M U80 ( .A(count[21]), .B(count[20]), .C(count[19]), .D(count[18]), 
        .Y(n77) );
  NOR4X1M U81 ( .A(count[25]), .B(count[24]), .C(count[23]), .D(count[22]), 
        .Y(n76) );
  NOR4X1M U82 ( .A(count[29]), .B(count[28]), .C(count[27]), .D(count[26]), 
        .Y(n75) );
  NOR4X1M U83 ( .A(count[9]), .B(count[8]), .C(count[31]), .D(count[30]), .Y(
        n74) );
  NAND4X1M U84 ( .A(n77), .B(n76), .C(n75), .D(n74), .Y(n93) );
  NOR4X1M U85 ( .A(count[13]), .B(count[12]), .C(count[11]), .D(count[10]), 
        .Y(n79) );
  NOR4X1M U86 ( .A(count[17]), .B(count[16]), .C(count[15]), .D(count[14]), 
        .Y(n78) );
  CLKNAND2X2M U87 ( .A(n79), .B(n78), .Y(n92) );
  XNOR2X1M U88 ( .A(N13), .B(count[2]), .Y(n85) );
  XNOR2X1M U89 ( .A(N18), .B(count[7]), .Y(n84) );
  OAI2B2X1M U90 ( .A1N(count[1]), .A0(n80), .B0(N12), .B1(n80), .Y(n83) );
  OAI2B2X1M U91 ( .A1N(N12), .A0(n81), .B0(count[1]), .B1(n81), .Y(n82) );
  NAND4X1M U92 ( .A(n85), .B(n84), .C(n83), .D(n82), .Y(n91) );
  XNOR2X1M U93 ( .A(N17), .B(count[6]), .Y(n89) );
  XNOR2X1M U94 ( .A(N16), .B(count[5]), .Y(n88) );
  XNOR2X1M U95 ( .A(N15), .B(count[4]), .Y(n87) );
  XNOR2X1M U96 ( .A(N14), .B(count[3]), .Y(n86) );
  NAND4X1M U97 ( .A(n89), .B(n88), .C(n87), .D(n86), .Y(n90) );
  NOR4X1M U98 ( .A(n93), .B(n92), .C(n91), .D(n90), .Y(N19) );
endmodule


module ClkDiv_1_DW01_inc_0 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;

  wire   [31:2] carry;

  ADDHX1M U1_1_30 ( .A(A[30]), .B(carry[30]), .CO(carry[31]), .S(SUM[30]) );
  ADDHX1M U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX1M U1_1_28 ( .A(A[28]), .B(carry[28]), .CO(carry[29]), .S(SUM[28]) );
  ADDHX1M U1_1_27 ( .A(A[27]), .B(carry[27]), .CO(carry[28]), .S(SUM[27]) );
  ADDHX1M U1_1_24 ( .A(A[24]), .B(carry[24]), .CO(carry[25]), .S(SUM[24]) );
  ADDHX1M U1_1_23 ( .A(A[23]), .B(carry[23]), .CO(carry[24]), .S(SUM[23]) );
  ADDHX1M U1_1_20 ( .A(A[20]), .B(carry[20]), .CO(carry[21]), .S(SUM[20]) );
  ADDHX1M U1_1_19 ( .A(A[19]), .B(carry[19]), .CO(carry[20]), .S(SUM[19]) );
  ADDHX1M U1_1_16 ( .A(A[16]), .B(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  ADDHX1M U1_1_15 ( .A(A[15]), .B(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  ADDHX1M U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHX1M U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHX1M U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX1M U1_1_29 ( .A(A[29]), .B(carry[29]), .CO(carry[30]), .S(SUM[29]) );
  ADDHX1M U1_1_26 ( .A(A[26]), .B(carry[26]), .CO(carry[27]), .S(SUM[26]) );
  ADDHX1M U1_1_25 ( .A(A[25]), .B(carry[25]), .CO(carry[26]), .S(SUM[25]) );
  ADDHX1M U1_1_22 ( .A(A[22]), .B(carry[22]), .CO(carry[23]), .S(SUM[22]) );
  ADDHX1M U1_1_21 ( .A(A[21]), .B(carry[21]), .CO(carry[22]), .S(SUM[21]) );
  ADDHX1M U1_1_18 ( .A(A[18]), .B(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  ADDHX1M U1_1_17 ( .A(A[17]), .B(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  ADDHX1M U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADDHX1M U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADDHX1M U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[31]), .B(A[31]), .Y(SUM[31]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_1_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(SUM[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX2M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1M U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_1 ( I_ref_clk, I_rst_n, I_clk_en, I_div_ratio, o_div_clk );
  input [7:0] I_div_ratio;
  input I_ref_clk, I_rst_n, I_clk_en;
  output o_div_clk;
  wire   div_clk, flag, N11, N12, N13, N14, N15, N16, N17, N18, N19, N24, N25,
         N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39,
         N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53,
         N54, N55, n1, n3, n4, n5, n6, n7, n8, n9, n10, n12, n14, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135;
  wire   [31:0] count;

  ClkDiv_1_DW01_inc_0 add_43 ( .A(count), .SUM({N55, N54, N53, N52, N51, N50, 
        N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, 
        N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24}) );
  ClkDiv_1_DW01_inc_1 add_35 ( .A({1'b0, I_div_ratio[7:1]}), .SUM({N18, N17, 
        N16, N15, N14, N13, N12, N11}) );
  DFFRQX2M div_clk_reg ( .D(n127), .CK(I_ref_clk), .RN(n12), .Q(div_clk) );
  DFFSQX2M flag_reg ( .D(n126), .CK(I_ref_clk), .SN(n10), .Q(flag) );
  DFFRQX4M count_reg_15_ ( .D(n109), .CK(I_ref_clk), .RN(n12), .Q(count[15])
         );
  DFFRQX4M count_reg_16_ ( .D(n110), .CK(I_ref_clk), .RN(n12), .Q(count[16])
         );
  DFFRQX4M count_reg_18_ ( .D(n112), .CK(I_ref_clk), .RN(n12), .Q(count[18])
         );
  DFFRQX4M count_reg_17_ ( .D(n111), .CK(I_ref_clk), .RN(n12), .Q(count[17])
         );
  DFFRQX2M count_reg_31_ ( .D(n125), .CK(I_ref_clk), .RN(n14), .Q(count[31])
         );
  DFFRQX4M count_reg_1_ ( .D(n95), .CK(I_ref_clk), .RN(n10), .Q(count[1]) );
  DFFRQX4M count_reg_0_ ( .D(n94), .CK(I_ref_clk), .RN(n10), .Q(count[0]) );
  DFFRQX2M count_reg_10_ ( .D(n104), .CK(I_ref_clk), .RN(n10), .Q(count[10])
         );
  DFFRQX2M count_reg_14_ ( .D(n108), .CK(I_ref_clk), .RN(n12), .Q(count[14])
         );
  DFFRQX2M count_reg_13_ ( .D(n107), .CK(I_ref_clk), .RN(n12), .Q(count[13])
         );
  DFFRQX2M count_reg_6_ ( .D(n100), .CK(I_ref_clk), .RN(n10), .Q(count[6]) );
  DFFRQX2M count_reg_5_ ( .D(n99), .CK(I_ref_clk), .RN(n10), .Q(count[5]) );
  DFFRQX2M count_reg_4_ ( .D(n98), .CK(I_ref_clk), .RN(n10), .Q(count[4]) );
  DFFRQX2M count_reg_3_ ( .D(n97), .CK(I_ref_clk), .RN(n10), .Q(count[3]) );
  DFFRQX2M count_reg_7_ ( .D(n101), .CK(I_ref_clk), .RN(n10), .Q(count[7]) );
  DFFRQX2M count_reg_8_ ( .D(n102), .CK(I_ref_clk), .RN(n10), .Q(count[8]) );
  DFFRQX2M count_reg_27_ ( .D(n121), .CK(I_ref_clk), .RN(n14), .Q(count[27])
         );
  DFFRQX2M count_reg_23_ ( .D(n117), .CK(I_ref_clk), .RN(n12), .Q(count[23])
         );
  DFFRQX2M count_reg_19_ ( .D(n113), .CK(I_ref_clk), .RN(n12), .Q(count[19])
         );
  DFFRQX2M count_reg_11_ ( .D(n105), .CK(I_ref_clk), .RN(n10), .Q(count[11])
         );
  DFFRQX2M count_reg_28_ ( .D(n122), .CK(I_ref_clk), .RN(n14), .Q(count[28])
         );
  DFFRQX2M count_reg_24_ ( .D(n118), .CK(I_ref_clk), .RN(n14), .Q(count[24])
         );
  DFFRQX2M count_reg_20_ ( .D(n114), .CK(I_ref_clk), .RN(n12), .Q(count[20])
         );
  DFFRQX2M count_reg_12_ ( .D(n106), .CK(I_ref_clk), .RN(n12), .Q(count[12])
         );
  DFFRQX2M count_reg_30_ ( .D(n124), .CK(I_ref_clk), .RN(n14), .Q(count[30])
         );
  DFFRQX2M count_reg_26_ ( .D(n120), .CK(I_ref_clk), .RN(n14), .Q(count[26])
         );
  DFFRQX2M count_reg_22_ ( .D(n116), .CK(I_ref_clk), .RN(n12), .Q(count[22])
         );
  DFFRQX2M count_reg_29_ ( .D(n123), .CK(I_ref_clk), .RN(n14), .Q(count[29])
         );
  DFFRQX2M count_reg_25_ ( .D(n119), .CK(I_ref_clk), .RN(n14), .Q(count[25])
         );
  DFFRQX2M count_reg_21_ ( .D(n115), .CK(I_ref_clk), .RN(n12), .Q(count[21])
         );
  DFFRQX2M count_reg_9_ ( .D(n103), .CK(I_ref_clk), .RN(n10), .Q(count[9]) );
  DFFRQX2M count_reg_2_ ( .D(n96), .CK(I_ref_clk), .RN(n10), .Q(count[2]) );
  NOR2BX2M U3 ( .AN(count[0]), .B(N11), .Y(n81) );
  NOR2BX2M U4 ( .AN(I_div_ratio[1]), .B(count[0]), .Y(n62) );
  NOR2BX2M U5 ( .AN(count[0]), .B(I_div_ratio[1]), .Y(n61) );
  NOR2BX2M U7 ( .AN(N11), .B(count[0]), .Y(n80) );
  OAI21X2M U8 ( .A0(I_div_ratio[0]), .A1(n3), .B0(n134), .Y(n131) );
  AOI21BX2M U9 ( .A0(n129), .A1(n128), .B0N(I_clk_en), .Y(n1) );
  BUFX6M U10 ( .A(n133), .Y(n5) );
  BUFX6M U11 ( .A(n133), .Y(n6) );
  BUFX4M U12 ( .A(n133), .Y(n7) );
  CLKBUFX8M U13 ( .A(n54), .Y(n12) );
  BUFX4M U14 ( .A(n54), .Y(n14) );
  NOR2X4M U15 ( .A(n131), .B(n8), .Y(n133) );
  AND2X2M U16 ( .A(n131), .B(n1), .Y(n135) );
  CLKBUFX8M U17 ( .A(n54), .Y(n10) );
  BUFX2M U18 ( .A(I_rst_n), .Y(n54) );
  OR4X1M U19 ( .A(n73), .B(n72), .C(n71), .D(n70), .Y(n3) );
  INVX8M U20 ( .A(n1), .Y(n9) );
  INVX8M U21 ( .A(n1), .Y(n8) );
  AO22X1M U22 ( .A0(count[31]), .A1(n8), .B0(N55), .B1(n7), .Y(n125) );
  NAND2X2M U23 ( .A(I_div_ratio[0]), .B(n130), .Y(n134) );
  OAI2BB2X1M U24 ( .B0(flag), .B1(n3), .A0N(flag), .A1N(N19), .Y(n130) );
  INVX2M U25 ( .A(n132), .Y(n94) );
  AOI221X2M U26 ( .A0(count[0]), .A1(n8), .B0(N24), .B1(n5), .C0(n135), .Y(
        n132) );
  AO22X1M U27 ( .A0(count[1]), .A1(n9), .B0(N25), .B1(n5), .Y(n95) );
  AO22X1M U28 ( .A0(count[9]), .A1(n9), .B0(N33), .B1(n5), .Y(n103) );
  AO22X1M U29 ( .A0(count[13]), .A1(n9), .B0(N37), .B1(n6), .Y(n107) );
  AO22X1M U30 ( .A0(count[14]), .A1(n9), .B0(N38), .B1(n6), .Y(n108) );
  AO22X1M U31 ( .A0(count[17]), .A1(n8), .B0(N41), .B1(n6), .Y(n111) );
  AO22X1M U32 ( .A0(count[18]), .A1(n8), .B0(N42), .B1(n6), .Y(n112) );
  AO22X1M U33 ( .A0(count[21]), .A1(n8), .B0(N45), .B1(n6), .Y(n115) );
  AO22X1M U34 ( .A0(count[22]), .A1(n8), .B0(N46), .B1(n6), .Y(n116) );
  AO22X1M U35 ( .A0(count[25]), .A1(n8), .B0(N49), .B1(n6), .Y(n119) );
  AO22X1M U36 ( .A0(count[26]), .A1(n8), .B0(N50), .B1(n7), .Y(n120) );
  AO22X1M U37 ( .A0(count[29]), .A1(n8), .B0(N53), .B1(n7), .Y(n123) );
  AO22X1M U38 ( .A0(count[30]), .A1(n8), .B0(N54), .B1(n7), .Y(n124) );
  AO22X1M U39 ( .A0(count[11]), .A1(n9), .B0(N35), .B1(n5), .Y(n105) );
  AO22X1M U40 ( .A0(count[12]), .A1(n9), .B0(N36), .B1(n5), .Y(n106) );
  AO22X1M U41 ( .A0(count[15]), .A1(n9), .B0(N39), .B1(n6), .Y(n109) );
  AO22X1M U42 ( .A0(count[16]), .A1(n9), .B0(N40), .B1(n6), .Y(n110) );
  AO22X1M U43 ( .A0(count[19]), .A1(n8), .B0(N43), .B1(n6), .Y(n113) );
  AO22X1M U44 ( .A0(count[20]), .A1(n8), .B0(N44), .B1(n6), .Y(n114) );
  AO22X1M U45 ( .A0(count[23]), .A1(n8), .B0(N47), .B1(n6), .Y(n117) );
  AO22X1M U46 ( .A0(count[24]), .A1(n9), .B0(N48), .B1(n6), .Y(n118) );
  AO22X1M U47 ( .A0(count[27]), .A1(n8), .B0(N51), .B1(n7), .Y(n121) );
  AO22X1M U48 ( .A0(count[28]), .A1(n8), .B0(N52), .B1(n7), .Y(n122) );
  AO22X1M U49 ( .A0(count[8]), .A1(n9), .B0(N32), .B1(n5), .Y(n102) );
  AO22X1M U50 ( .A0(count[7]), .A1(n9), .B0(N31), .B1(n5), .Y(n101) );
  AO22X1M U51 ( .A0(count[2]), .A1(n9), .B0(N26), .B1(n5), .Y(n96) );
  AO22X1M U52 ( .A0(count[3]), .A1(n9), .B0(N27), .B1(n5), .Y(n97) );
  AO22X1M U53 ( .A0(count[4]), .A1(n9), .B0(N28), .B1(n5), .Y(n98) );
  AO22X1M U54 ( .A0(count[5]), .A1(n9), .B0(N29), .B1(n5), .Y(n99) );
  AO22X1M U55 ( .A0(count[6]), .A1(n9), .B0(N30), .B1(n5), .Y(n100) );
  AO22X1M U56 ( .A0(count[10]), .A1(n9), .B0(N34), .B1(n5), .Y(n104) );
  CLKXOR2X2M U57 ( .A(div_clk), .B(n135), .Y(n127) );
  CLKXOR2X2M U58 ( .A(flag), .B(n4), .Y(n126) );
  NOR2X2M U59 ( .A(n134), .B(n8), .Y(n4) );
  NOR4X2M U60 ( .A(I_div_ratio[7]), .B(I_div_ratio[6]), .C(I_div_ratio[5]), 
        .D(I_div_ratio[4]), .Y(n128) );
  NOR3X2M U61 ( .A(I_div_ratio[1]), .B(I_div_ratio[3]), .C(I_div_ratio[2]), 
        .Y(n129) );
  MX2X6M U62 ( .A(I_ref_clk), .B(div_clk), .S0(n1), .Y(o_div_clk) );
  NOR4X1M U63 ( .A(count[22]), .B(count[21]), .C(count[20]), .D(count[19]), 
        .Y(n58) );
  NOR4X1M U64 ( .A(count[26]), .B(count[25]), .C(count[24]), .D(count[23]), 
        .Y(n57) );
  NOR4X1M U65 ( .A(count[30]), .B(count[29]), .C(count[28]), .D(count[27]), 
        .Y(n56) );
  NOR4X1M U66 ( .A(count[9]), .B(count[8]), .C(count[7]), .D(count[31]), .Y(
        n55) );
  NAND4X1M U67 ( .A(n58), .B(n57), .C(n56), .D(n55), .Y(n73) );
  NOR4X1M U68 ( .A(count[14]), .B(count[13]), .C(count[12]), .D(count[11]), 
        .Y(n60) );
  NOR4X1M U69 ( .A(count[18]), .B(count[17]), .C(count[16]), .D(count[15]), 
        .Y(n59) );
  CLKNAND2X2M U70 ( .A(n60), .B(n59), .Y(n72) );
  OAI2B2X1M U71 ( .A1N(I_div_ratio[2]), .A0(n61), .B0(count[1]), .B1(n61), .Y(
        n65) );
  XNOR2X1M U72 ( .A(I_div_ratio[3]), .B(count[2]), .Y(n64) );
  OAI2B2X1M U73 ( .A1N(count[1]), .A0(n62), .B0(I_div_ratio[2]), .B1(n62), .Y(
        n63) );
  NAND4BX1M U74 ( .AN(count[10]), .B(n65), .C(n64), .D(n63), .Y(n71) );
  XNOR2X1M U75 ( .A(I_div_ratio[7]), .B(count[6]), .Y(n69) );
  XNOR2X1M U76 ( .A(I_div_ratio[6]), .B(count[5]), .Y(n68) );
  XNOR2X1M U77 ( .A(I_div_ratio[5]), .B(count[4]), .Y(n67) );
  XNOR2X1M U78 ( .A(I_div_ratio[4]), .B(count[3]), .Y(n66) );
  NAND4X1M U79 ( .A(n69), .B(n68), .C(n67), .D(n66), .Y(n70) );
  NOR4X1M U80 ( .A(count[21]), .B(count[20]), .C(count[19]), .D(count[18]), 
        .Y(n77) );
  NOR4X1M U81 ( .A(count[25]), .B(count[24]), .C(count[23]), .D(count[22]), 
        .Y(n76) );
  NOR4X1M U82 ( .A(count[29]), .B(count[28]), .C(count[27]), .D(count[26]), 
        .Y(n75) );
  NOR4X1M U83 ( .A(count[9]), .B(count[8]), .C(count[31]), .D(count[30]), .Y(
        n74) );
  NAND4X1M U84 ( .A(n77), .B(n76), .C(n75), .D(n74), .Y(n93) );
  NOR4X1M U85 ( .A(count[13]), .B(count[12]), .C(count[11]), .D(count[10]), 
        .Y(n79) );
  NOR4X1M U86 ( .A(count[17]), .B(count[16]), .C(count[15]), .D(count[14]), 
        .Y(n78) );
  CLKNAND2X2M U87 ( .A(n79), .B(n78), .Y(n92) );
  XNOR2X1M U88 ( .A(N13), .B(count[2]), .Y(n85) );
  XNOR2X1M U89 ( .A(N18), .B(count[7]), .Y(n84) );
  OAI2B2X1M U90 ( .A1N(count[1]), .A0(n80), .B0(N12), .B1(n80), .Y(n83) );
  OAI2B2X1M U91 ( .A1N(N12), .A0(n81), .B0(count[1]), .B1(n81), .Y(n82) );
  NAND4X1M U92 ( .A(n85), .B(n84), .C(n83), .D(n82), .Y(n91) );
  XNOR2X1M U93 ( .A(N17), .B(count[6]), .Y(n89) );
  XNOR2X1M U94 ( .A(N16), .B(count[5]), .Y(n88) );
  XNOR2X1M U95 ( .A(N15), .B(count[4]), .Y(n87) );
  XNOR2X1M U96 ( .A(N14), .B(count[3]), .Y(n86) );
  NAND4X1M U97 ( .A(n89), .B(n88), .C(n87), .D(n86), .Y(n90) );
  NOR4X1M U98 ( .A(n93), .B(n92), .C(n91), .D(n90), .Y(N19) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
  NOR4X2M U11 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  INVX2M U12 ( .A(IN[2]), .Y(n15) );
  NOR3X12M U13 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  CLKINVX1M U14 ( .A(IN[1]), .Y(n16) );
  CLKINVX1M U15 ( .A(IN[0]), .Y(n17) );
  NOR3X8M U16 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NOR4X4M U17 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U18 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  NAND4BX2M U19 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  NAND4BX2M U20 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  OAI211X4M U21 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NAND2X2M U22 ( .A(n7), .B(n6), .Y(n9) );
  INVX2M U23 ( .A(IN[5]), .Y(n14) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( RST, UART_CLK, REF_CLK, RX_IN, TX_OUT );
  input RST, UART_CLK, REF_CLK, RX_IN;
  output TX_OUT;
  wire   SYNC_UART_RST, SYNC_REF_RST, UART_RX_V_OUT, UART_RX_V_SYNC, WrEn,
         RdEn, RdData_VLD, ALU_EN, ALU_CLK, ALU_OUT_VALID, UART_TX_CLK,
         UART_RX_CLK, UART_TX_Busy, par_err, stp_err, rempty, UART_TX_VLD,
         UART_TX_Busy_PULSE, FIFO_FULL, n_1_net_, CLKG_EN, n1, n2, n3, n4, n5,
         n6, n7, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4;
  wire   [7:0] UART_RX_OUT;
  wire   [7:0] UART_RX_SYNC;
  wire   [3:0] Address;
  wire   [7:0] WrData;
  wire   [7:0] RdData_REG;
  wire   [7:0] Operand_A;
  wire   [7:0] Operand_B;
  wire   [7:0] UART_Config;
  wire   [7:0] DIV_RATIO;
  wire   [3:0] ALU_FUN;
  wire   [15:0] ALU_OUT;
  wire   [7:0] UART_TX_RD_DATA;
  wire   [7:0] WR_DATA_CTRL_FIFO;
  wire   [7:0] DIV_RATIO_RX;

  RST_SYNC_NUM_STAGES2_0 U0_RST_SYNC ( .RST(RST), .CLK(UART_CLK), .SYNC_RST(
        SYNC_UART_RST) );
  RST_SYNC_NUM_STAGES2_1 U1_RST_SYNC ( .RST(RST), .CLK(REF_CLK), .SYNC_RST(
        SYNC_REF_RST) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 U0_ref_sync ( .CLK(REF_CLK), .RST(n4), 
        .unsync_bus(UART_RX_OUT), .bus_enable(UART_RX_V_OUT), .sync_bus(
        UART_RX_SYNC), .enable_pulse_d(UART_RX_V_SYNC) );
  RegFile_WIDTH8_DEPTH16_ADDR4 RegFile_U0 ( .CLK(REF_CLK), .RST(RST), .WrEn(
        WrEn), .RdEn(RdEn), .Address({Address[3:2], n3, n2}), .WrData(WrData), 
        .RdData(RdData_REG), .RdData_VLD(RdData_VLD), .REG0(Operand_A), .REG1(
        Operand_B), .REG2(UART_Config), .REG3(DIV_RATIO) );
  ALU_OPER_WIDTH8_OUT_WIDTH16 ALU_U0 ( .A(Operand_A), .B(Operand_B), .EN(
        ALU_EN), .ALU_FUN(ALU_FUN), .CLK(ALU_CLK), .RST(RST), .ALU_OUT(ALU_OUT), .OUT_VALID(ALU_OUT_VALID) );
  UART_RX_TX_TOP UART_RX_TX_TOP_U0 ( .UART_TX_CLK(UART_TX_CLK), .UART_RX_CLK(
        UART_RX_CLK), .RX_IN(RX_IN), .RST(n6), .F_Empty(n1), .PAR_EN(
        UART_Config[0]), .PAR_TYP(UART_Config[1]), .UART_config(
        UART_Config[7:2]), .RD_DATA(UART_TX_RD_DATA), .TX_OUT(TX_OUT), .BUSY(
        UART_TX_Busy), .par_err(par_err), .stp_err(stp_err), .P_data(
        UART_RX_OUT), .data_valid(UART_RX_V_OUT) );
  FIFO_TOP FIFO_TOP_U0 ( .WDATA(WR_DATA_CTRL_FIFO), .winc(UART_TX_VLD), .wclk(
        REF_CLK), .wrst_n(n4), .rinc(UART_TX_Busy_PULSE), .rclk(UART_TX_CLK), 
        .rrst_n(n6), .wfull(FIFO_FULL), .rdata(UART_TX_RD_DATA), .rempty(
        rempty) );
  sys_ctrl_IN_WIDTH16_WIDTH8 sys_ctrl_U0 ( .CLK_IN(REF_CLK), .RST_IN(RST), 
        .full_flag(FIFO_FULL), .error(n_1_net_), .Alu_Out(ALU_OUT), 
        .Out_Valid(ALU_OUT_VALID), .RX_P_DATA(UART_RX_SYNC), .RX_D_VLD(
        UART_RX_V_SYNC), .RdData(RdData_REG), .RdData_Valid(RdData_VLD), 
        .ALU_FUN(ALU_FUN), .EN(ALU_EN), .Gate_EN(CLKG_EN), .Address(Address), 
        .WrEn(WrEn), .RdEn(RdEn), .WrData(WrData), .TX_P_DATA(
        WR_DATA_CTRL_FIFO), .TX_D_VLD(UART_TX_VLD) );
  PULSE_GEN U0_PULSE_GEN ( .clk(UART_TX_CLK), .rst(n6), .lvl_sig(UART_TX_Busy), 
        .pulse_sig(UART_TX_Busy_PULSE) );
  ClkDiv_0 U0_ClkDiv ( .I_ref_clk(UART_CLK), .I_rst_n(n6), .I_clk_en(1'b1), 
        .I_div_ratio(DIV_RATIO), .o_div_clk(UART_TX_CLK) );
  ClkDiv_1 U1_ClkDiv ( .I_ref_clk(UART_CLK), .I_rst_n(n6), .I_clk_en(1'b1), 
        .I_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX[3:0]}), .o_div_clk(
        UART_RX_CLK) );
  CLKDIV_MUX U0_CLKDIV_MUX ( .IN(UART_Config[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, 
        SYNOPSYS_UNCONNECTED_4, DIV_RATIO_RX[3:0]}) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(CLKG_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK)
         );
  OR2X4M U3 ( .A(par_err), .B(stp_err), .Y(n_1_net_) );
  BUFX2M U4 ( .A(Address[1]), .Y(n3) );
  BUFX2M U5 ( .A(Address[0]), .Y(n2) );
  INVX4M U6 ( .A(n7), .Y(n6) );
  INVX2M U7 ( .A(SYNC_UART_RST), .Y(n7) );
  INVX2M U8 ( .A(rempty), .Y(n1) );
  INVX2M U9 ( .A(n5), .Y(n4) );
  INVX2M U10 ( .A(SYNC_REF_RST), .Y(n5) );
endmodule

