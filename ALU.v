
module ALU(
  input         io_dw,	// src/main/scala/rocket/ALU.scala:56:14
  input  [3:0]  io_fn,	// src/main/scala/rocket/ALU.scala:56:14
  input  [63:0] io_in2,	// src/main/scala/rocket/ALU.scala:56:14
                io_in1,	// src/main/scala/rocket/ALU.scala:56:14
  output [63:0] io_out,	// src/main/scala/rocket/ALU.scala:56:14
                io_adder_out,	// src/main/scala/rocket/ALU.scala:56:14
  output        io_cmp_out	// src/main/scala/rocket/ALU.scala:56:14
);

  wire [63:0] in2_inv = {64{io_fn[3]}} ^ io_in2;	// src/main/scala/rocket/ALU.scala:43:29, :69:20
  wire [63:0] in1_xor_in2 = io_in1 ^ in2_inv;	// src/main/scala/rocket/ALU.scala:69:20, :70:28
  wire [63:0] _io_adder_out_output = io_in1 + in2_inv + {63'h0, io_fn[3]};	// src/main/scala/rocket/ALU.scala:43:29, :69:20, :71:36, :105:50
  wire        slt =
    io_in1[63] == io_in2[63]
      ? _io_adder_out_output[63]
      : io_fn[1] ? io_in2[63] : io_in1[63];	// src/main/scala/rocket/ALU.scala:45:35, :71:36, :75:{8,15,24,34,56}, :76:8
  wire [31:0] shin_hi_32 = {32{io_fn[3] & io_in1[31]}};	// src/main/scala/rocket/ALU.scala:43:29, :84:{28,52,61}
  wire [31:0] shin_hi = io_dw ? io_in1[63:32] : shin_hi_32;	// src/main/scala/rocket/ALU.scala:84:28, :85:{24,48}
  wire [5:0]  shamt = {io_in2[5] & io_dw, io_in2[4:0]};	// src/main/scala/rocket/ALU.scala:86:{22,29,33,60}
  wire [63:0] shin_r = {shin_hi, io_in1[31:0]};	// src/main/scala/rocket/ALU.scala:85:24, :87:{18,34}
  wire        _shout_T = io_fn == 4'h5;	// src/main/scala/rocket/ALU.scala:89:24
  wire        _shout_T_1 = io_fn == 4'hB;	// src/main/scala/rocket/ALU.scala:89:50
  wire [15:0] _GEN =
    {{shin_r[23:16], shin_r[31:28]} & 12'hF0F, 4'h0} | {shin_r[31:24], shin_r[39:32]}
    & 16'hF0F;	// src/main/scala/rocket/ALU.scala:87:18, :89:83
  wire [37:0] _GEN_0 =
    {shin_r[11:8],
     shin_r[15:12],
     shin_r[19:16],
     _GEN,
     shin_r[39:36],
     shin_r[43:40],
     shin_r[47:46]} & 38'h3333333333;	// src/main/scala/rocket/ALU.scala:87:18, :89:83
  wire [7:0]  _GEN_1 = _GEN_0[37:30] | {shin_r[15:12], shin_r[19:16]} & 8'h33;	// src/main/scala/rocket/ALU.scala:87:18, :89:83
  wire [15:0] _GEN_2 = _GEN_0[29:14] | _GEN & 16'h3333;	// src/main/scala/rocket/ALU.scala:89:83
  wire [1:0]  _GEN_3 = _GEN_0[11:10] | shin_r[37:36];	// src/main/scala/rocket/ALU.scala:87:18, :89:83
  wire [7:0]  _GEN_4 = {_GEN_0[5:0], 2'h0} | {shin_r[47:44], shin_r[51:48]} & 8'h33;	// src/main/scala/rocket/ALU.scala:87:18, :89:83
  wire [50:0] _GEN_5 =
    {shin_r[5:4],
     shin_r[7:6],
     shin_r[9:8],
     _GEN_1,
     _GEN_2,
     _GEN[3:2],
     _GEN_3,
     shin_r[39:38],
     shin_r[41:40],
     _GEN_4,
     shin_r[51:50],
     shin_r[53:52],
     shin_r[55]} & 51'h5555555555555;	// src/main/scala/rocket/ALU.scala:87:18, :89:83
  wire [63:0] shin =
    _shout_T | _shout_T_1
      ? shin_r
      : {shin_r[0],
         shin_r[1],
         shin_r[2],
         shin_r[3],
         shin_r[4],
         _GEN_5[50:47] | {shin_r[7:6], shin_r[9:8]} & 4'h5,
         _GEN_5[46:39] | _GEN_1 & 8'h55,
         _GEN_5[38:23] | _GEN_2 & 16'h5555,
         _GEN_2[1],
         _GEN_5[21] | _GEN[2],
         {_GEN[3], 1'h0} | _GEN_3 & 2'h1,
         _GEN_5[18:15] | {shin_r[39:38], shin_r[41:40]} & 4'h5,
         _GEN_5[14:7] | _GEN_4 & 8'h55,
         _GEN_4[1],
         _GEN_5[5] | shin_r[50],
         shin_r[51],
         shin_r[52],
         {_GEN_5[2:0], 1'h0} | {shin_r[55:54], shin_r[57:56]} & 4'h5,
         shin_r[57],
         shin_r[58],
         shin_r[59],
         shin_r[60],
         shin_r[61],
         shin_r[62],
         shin_r[63]};	// src/main/scala/rocket/ALU.scala:71:26, :87:18, :89:{17,24,41,50,83}
  wire [64:0] _shout_r_T_5 = $signed($signed({io_fn[3] & shin[63], shin}) >>> shamt);	// src/main/scala/rocket/ALU.scala:43:29, :86:22, :89:17, :90:{21,41,47,70}
  wire [63:0] shout_r = _shout_r_T_5[63:0];	// src/main/scala/rocket/ALU.scala:90:{70,79}
  wire [15:0] _GEN_6 =
    {{shout_r[23:16], shout_r[31:28]} & 12'hF0F, 4'h0} | {shout_r[31:24], shout_r[39:32]}
    & 16'hF0F;	// src/main/scala/rocket/ALU.scala:89:83, :90:79, :91:24
  wire [37:0] _GEN_7 =
    {shout_r[11:8],
     shout_r[15:12],
     shout_r[19:16],
     _GEN_6,
     shout_r[39:36],
     shout_r[43:40],
     shout_r[47:46]} & 38'h3333333333;	// src/main/scala/rocket/ALU.scala:89:83, :90:79, :91:24
  wire [7:0]  _GEN_8 = _GEN_7[37:30] | {shout_r[15:12], shout_r[19:16]} & 8'h33;	// src/main/scala/rocket/ALU.scala:89:83, :90:79, :91:24
  wire [15:0] _GEN_9 = _GEN_7[29:14] | _GEN_6 & 16'h3333;	// src/main/scala/rocket/ALU.scala:89:83, :91:24
  wire [1:0]  _GEN_10 = _GEN_7[11:10] | shout_r[37:36];	// src/main/scala/rocket/ALU.scala:89:83, :90:79, :91:24
  wire [7:0]  _GEN_11 = {_GEN_7[5:0], 2'h0} | {shout_r[47:44], shout_r[51:48]} & 8'h33;	// src/main/scala/rocket/ALU.scala:89:83, :90:79, :91:24
  wire [50:0] _GEN_12 =
    {shout_r[5:4],
     shout_r[7:6],
     shout_r[9:8],
     _GEN_8,
     _GEN_9,
     _GEN_6[3:2],
     _GEN_10,
     shout_r[39:38],
     shout_r[41:40],
     _GEN_11,
     shout_r[51:50],
     shout_r[53:52],
     shout_r[55]} & 51'h5555555555555;	// src/main/scala/rocket/ALU.scala:89:83, :90:79, :91:24
  wire [63:0] shout_l =
    {shout_r[0],
     shout_r[1],
     shout_r[2],
     shout_r[3],
     shout_r[4],
     _GEN_12[50:47] | {shout_r[7:6], shout_r[9:8]} & 4'h5,
     _GEN_12[46:39] | _GEN_8 & 8'h55,
     _GEN_12[38:23] | _GEN_9 & 16'h5555,
     _GEN_9[1],
     _GEN_12[21] | _GEN_6[2],
     {_GEN_6[3], 1'h0} | _GEN_10 & 2'h1,
     _GEN_12[18:15] | {shout_r[39:38], shout_r[41:40]} & 4'h5,
     _GEN_12[14:7] | _GEN_11 & 8'h55,
     _GEN_11[1],
     _GEN_12[5] | shout_r[50],
     shout_r[51],
     shout_r[52],
     {_GEN_12[2:0], 1'h0} | {shout_r[55:54], shout_r[57:56]} & 4'h5,
     shout_r[57],
     shout_r[58],
     shout_r[59],
     shout_r[60],
     shout_r[61],
     shout_r[62],
     shout_r[63]};	// src/main/scala/rocket/ALU.scala:71:26, :89:{24,83}, :90:79, :91:24
  wire [63:0] shout =
    (_shout_T | _shout_T_1 ? shout_r : 64'h0) | (io_fn == 4'h1 ? shout_l : 64'h0);	// src/main/scala/rocket/ALU.scala:89:{24,50}, :90:79, :91:24, :92:{18,41,82}, :93:{18,25}
  wire        in2_not_zero = |io_in2;	// src/main/scala/rocket/ALU.scala:96:29
  wire        _logic_T_4 = io_fn == 4'h6;	// src/main/scala/rocket/ALU.scala:102:51
  wire [63:0] logic_0 =
    (io_fn == 4'h4 | _logic_T_4 ? in1_xor_in2 : 64'h0)
    | (_logic_T_4 | io_fn == 4'h7 ? io_in1 & io_in2 : 64'h0);	// src/main/scala/rocket/ALU.scala:70:28, :92:18, :102:{18,25,42,51,86}, :103:{18,41,50,75}
  wire [63:0] shift_logic = {63'h0, io_fn > 4'hB & slt} | logic_0 | shout;	// src/main/scala/rocket/ALU.scala:44:30, :75:8, :89:50, :92:82, :102:86, :105:{42,50,58}
  wire [63:0] out = io_fn == 4'h0 | io_fn == 4'hA ? _io_adder_out_output : shift_logic;	// src/main/scala/rocket/ALU.scala:71:36, :89:83, :105:58, :110:{16,23,40,49}
  assign io_out = io_dw ? out : {{32{out[31]}}, out[31:0]};	// src/main/scala/rocket/ALU.scala:110:16, :112:10, :115:{28,37,43,48,56,66}
  assign io_adder_out = _io_adder_out_output;	// src/main/scala/rocket/ALU.scala:71:36
  assign io_cmp_out = io_fn[0] ^ (io_fn[3] ? slt : in1_xor_in2 == 64'h0);	// src/main/scala/rocket/ALU.scala:43:29, :46:35, :70:28, :75:8, :77:{42,47,80}, :92:18
endmodule

