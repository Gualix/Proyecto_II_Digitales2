/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* cells_not_processed =  1  *)
(* src = "arbitro_sint.v:1" *)
module arbitro_sint(clk, reset, almost_full_P0, almost_full_P1, almost_full_P2, almost_full_P3, empty_P0, empty_P1, empty_P2, empty_P3, empty_P4, empty_P5, empty_P6, empty_P7, pop_F0_sint, pop_F1_sint, pop_F2_sint, pop_F3_sint, push_F0_sint, push_F1_sint, push_F2_sint, push_F3_sint);
  (* src = "arbitro_sint.v:37" *)
  wire _00_;
  (* src = "arbitro_sint.v:37" *)
  wire _01_;
  (* src = "arbitro_sint.v:37" *)
  wire _02_;
  (* src = "arbitro_sint.v:37" *)
  wire _03_;
  (* src = "arbitro_sint.v:37" *)
  wire _04_;
  (* src = "arbitro_sint.v:80" *)
  wire _05_;
  (* src = "arbitro_sint.v:80" *)
  wire _06_;
  (* src = "arbitro_sint.v:80" *)
  wire _07_;
  (* src = "arbitro_sint.v:44" *)
  wire _08_;
  (* src = "arbitro_sint.v:44" *)
  wire _09_;
  (* src = "arbitro_sint.v:44" *)
  wire _10_;
  (* src = "arbitro_sint.v:44" *)
  wire _11_;
  (* src = "arbitro_sint.v:44" *)
  wire _12_;
  (* src = "arbitro_sint.v:44" *)
  wire _13_;
  (* src = "arbitro_sint.v:44" *)
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  wire _28_;
  wire _29_;
  wire _30_;
  wire _31_;
  wire _32_;
  wire _33_;
  wire _34_;
  wire _35_;
  (* src = "arbitro_sint.v:8" *)
  input almost_full_P0;
  (* src = "arbitro_sint.v:9" *)
  input almost_full_P1;
  (* src = "arbitro_sint.v:10" *)
  input almost_full_P2;
  (* src = "arbitro_sint.v:11" *)
  input almost_full_P3;
  (* src = "arbitro_sint.v:4" *)
  input clk;
  (* src = "arbitro_sint.v:13" *)
  input empty_P0;
  (* src = "arbitro_sint.v:14" *)
  input empty_P1;
  (* src = "arbitro_sint.v:15" *)
  input empty_P2;
  (* src = "arbitro_sint.v:16" *)
  input empty_P3;
  (* src = "arbitro_sint.v:17" *)
  input empty_P4;
  (* src = "arbitro_sint.v:18" *)
  input empty_P5;
  (* src = "arbitro_sint.v:19" *)
  input empty_P6;
  (* src = "arbitro_sint.v:20" *)
  input empty_P7;
  (* src = "arbitro_sint.v:24" *)
  output pop_F0_sint;
  reg pop_F0_sint;
  (* src = "arbitro_sint.v:25" *)
  output pop_F1_sint;
  reg pop_F1_sint;
  (* src = "arbitro_sint.v:26" *)
  output pop_F2_sint;
  reg pop_F2_sint;
  (* src = "arbitro_sint.v:27" *)
  output pop_F3_sint;
  reg pop_F3_sint;
  (* src = "arbitro_sint.v:29" *)
  output push_F0_sint;
  (* src = "arbitro_sint.v:30" *)
  output push_F1_sint;
  (* src = "arbitro_sint.v:31" *)
  output push_F2_sint;
  (* src = "arbitro_sint.v:32" *)
  output push_F3_sint;
  reg push_F3_sint;
  (* src = "arbitro_sint.v:4" *)
  input reset;
  assign _05_ = _08_ && (* src = "arbitro_sint.v:80" *) _09_;
  assign _06_ = _05_ && (* src = "arbitro_sint.v:80" *) _10_;
  assign _07_ = _06_ && (* src = "arbitro_sint.v:80" *) _11_;
  assign _08_ = ~ (* src = "arbitro_sint.v:80" *) almost_full_P0;
  assign _09_ = ~ (* src = "arbitro_sint.v:80" *) almost_full_P1;
  assign _10_ = ~ (* src = "arbitro_sint.v:80" *) almost_full_P2;
  assign _11_ = ~ (* src = "arbitro_sint.v:80" *) almost_full_P3;
  assign _12_ = _08_ | (* src = "arbitro_sint.v:44" *) _09_;
  assign _13_ = _12_ | (* src = "arbitro_sint.v:44" *) _10_;
  assign _14_ = _13_ | (* src = "arbitro_sint.v:44" *) _11_;
  always @(posedge clk)
      pop_F0_sint <= _00_;
  always @(posedge clk)
      pop_F1_sint <= _01_;
  always @(posedge clk)
      pop_F2_sint <= _02_;
  always @(posedge clk)
      pop_F3_sint <= _03_;
  always @(posedge clk)
      push_F3_sint <= _04_;
  assign _15_ = empty_P0 ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:46" *) _35_ : 1'h0;
  assign _16_ = _14_ ? (* src = "arbitro_sint.v:44" *) _15_ : pop_F1_sint;
  assign _01_ = reset ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:38" *) 1'h0 : _16_;
  assign _17_ = empty_P3 ? (* src = "arbitro_sint.v:67" *) pop_F0_sint : 1'h0;
  assign _18_ = empty_P2 ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:59" *) _17_ : 1'h0;
  assign _19_ = empty_P1 ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:53" *) _18_ : 1'h0;
  assign _20_ = empty_P0 ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:46" *) _19_ : 1'h1;
  assign _21_ = _14_ ? (* src = "arbitro_sint.v:44" *) _20_ : pop_F0_sint;
  assign _00_ = reset ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:38" *) 1'h0 : _21_;
  assign _22_ = _07_ ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:80" *) 1'h1 : 1'h0;
  assign _04_ = reset ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:38" *) 1'h0 : _22_;
  assign _23_ = empty_P3 ? (* src = "arbitro_sint.v:67" *) pop_F3_sint : 1'h1;
  assign _24_ = empty_P2 ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:59" *) _23_ : 1'h0;
  assign _25_ = empty_P1 ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:53" *) _24_ : 1'h0;
  assign _26_ = empty_P0 ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:46" *) _25_ : 1'h0;
  assign _27_ = _14_ ? (* src = "arbitro_sint.v:44" *) _26_ : pop_F3_sint;
  assign _03_ = reset ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:38" *) 1'h0 : _27_;
  assign _28_ = empty_P3 ? (* src = "arbitro_sint.v:67" *) pop_F2_sint : 1'h0;
  assign _29_ = empty_P2 ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:59" *) _28_ : 1'h1;
  assign _30_ = empty_P1 ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:53" *) _29_ : 1'h0;
  assign _31_ = empty_P0 ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:46" *) _30_ : 1'h0;
  assign _32_ = _14_ ? (* src = "arbitro_sint.v:44" *) _31_ : pop_F2_sint;
  assign _02_ = reset ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:38" *) 1'h0 : _32_;
  assign _33_ = empty_P3 ? (* src = "arbitro_sint.v:67" *) pop_F1_sint : 1'h0;
  assign _34_ = empty_P2 ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:59" *) _33_ : 1'h0;
  assign _35_ = empty_P1 ? (* full_case = 32'd1 *) (* src = "arbitro_sint.v:53" *) _34_ : 1'h1;
  assign push_F0_sint = push_F3_sint;
  assign push_F1_sint = push_F3_sint;
  assign push_F2_sint = push_F3_sint;
endmodule
