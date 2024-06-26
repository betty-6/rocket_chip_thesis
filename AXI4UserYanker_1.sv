// Generated by CIRCT firtool-1.37.0
// Standard header to adapt well known macros to our needs.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

module AXI4UserYanker_1(
  input         clock,
                reset,
                auto_in_aw_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_aw_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [31:0] auto_in_aw_bits_addr,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]  auto_in_aw_bits_len,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]  auto_in_aw_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [1:0]  auto_in_aw_bits_burst,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_in_aw_bits_lock,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]  auto_in_aw_bits_cache,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]  auto_in_aw_bits_prot,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]  auto_in_aw_bits_qos,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [6:0]  auto_in_aw_bits_echo_extra_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_in_aw_bits_echo_real_last,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_w_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [63:0] auto_in_w_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]  auto_in_w_bits_strb,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_in_w_bits_last,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_b_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_ar_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_ar_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [31:0] auto_in_ar_bits_addr,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [7:0]  auto_in_ar_bits_len,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]  auto_in_ar_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [1:0]  auto_in_ar_bits_burst,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_in_ar_bits_lock,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]  auto_in_ar_bits_cache,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [2:0]  auto_in_ar_bits_prot,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [3:0]  auto_in_ar_bits_qos,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [6:0]  auto_in_ar_bits_echo_extra_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_in_ar_bits_echo_real_last,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_r_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_aw_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_w_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_b_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_b_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [1:0]  auto_out_b_bits_resp,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_out_ar_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_r_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_r_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [63:0] auto_out_r_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input  [1:0]  auto_out_r_bits_resp,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  input         auto_out_r_bits_last,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_in_aw_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_w_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_b_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_b_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [1:0]  auto_in_b_bits_resp,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [6:0]  auto_in_b_bits_echo_extra_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_in_b_bits_echo_real_last,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_ar_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_r_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_r_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [63:0] auto_in_r_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [1:0]  auto_in_r_bits_resp,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [6:0]  auto_in_r_bits_echo_extra_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_in_r_bits_echo_real_last,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_in_r_bits_last,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_aw_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_aw_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [31:0] auto_out_aw_bits_addr,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [7:0]  auto_out_aw_bits_len,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]  auto_out_aw_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [1:0]  auto_out_aw_bits_burst,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_out_aw_bits_lock,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]  auto_out_aw_bits_cache,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]  auto_out_aw_bits_prot,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]  auto_out_aw_bits_qos,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_out_w_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [63:0] auto_out_w_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [7:0]  auto_out_w_bits_strb,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_out_w_bits_last,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_b_ready,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_ar_valid,	// src/main/scala/diplomacy/LazyModule.scala:374:18
                auto_out_ar_bits_id,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [31:0] auto_out_ar_bits_addr,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [7:0]  auto_out_ar_bits_len,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]  auto_out_ar_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [1:0]  auto_out_ar_bits_burst,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_out_ar_bits_lock,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]  auto_out_ar_bits_cache,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [2:0]  auto_out_ar_bits_prot,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output [3:0]  auto_out_ar_bits_qos,	// src/main/scala/diplomacy/LazyModule.scala:374:18
  output        auto_out_r_ready	// src/main/scala/diplomacy/LazyModule.scala:374:18
);

  wire        _Queue_3_io_enq_ready;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire        _Queue_3_io_deq_valid;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire [6:0]  _Queue_3_io_deq_bits_extra_id;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire        _Queue_3_io_deq_bits_real_last;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire        _Queue_2_io_enq_ready;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire        _Queue_2_io_deq_valid;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire [6:0]  _Queue_2_io_deq_bits_extra_id;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire        _Queue_2_io_deq_bits_real_last;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire        _Queue_1_io_enq_ready;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire        _Queue_1_io_deq_valid;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire [6:0]  _Queue_1_io_deq_bits_extra_id;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire        _Queue_1_io_deq_bits_real_last;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire        _Queue_io_enq_ready;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire        _Queue_io_deq_valid;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire [6:0]  _Queue_io_deq_bits_extra_id;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire        _Queue_io_deq_bits_real_last;	// src/main/scala/amba/axi4/UserYanker.scala:48:17
  wire        nodeIn_aw_valid = auto_in_aw_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_aw_bits_id = auto_in_aw_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [31:0] nodeIn_aw_bits_addr = auto_in_aw_bits_addr;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]  nodeIn_aw_bits_len = auto_in_aw_bits_len;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_aw_bits_size = auto_in_aw_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]  nodeIn_aw_bits_burst = auto_in_aw_bits_burst;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_aw_bits_lock = auto_in_aw_bits_lock;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]  nodeIn_aw_bits_cache = auto_in_aw_bits_cache;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_aw_bits_prot = auto_in_aw_bits_prot;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]  nodeIn_aw_bits_qos = auto_in_aw_bits_qos;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [6:0]  nodeIn_aw_bits_echo_extra_id = auto_in_aw_bits_echo_extra_id;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_aw_bits_echo_real_last = auto_in_aw_bits_echo_real_last;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_w_valid = auto_in_w_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [63:0] nodeIn_w_bits_data = auto_in_w_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]  nodeIn_w_bits_strb = auto_in_w_bits_strb;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_w_bits_last = auto_in_w_bits_last;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_b_ready = auto_in_b_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_ar_valid = auto_in_ar_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_ar_bits_id = auto_in_ar_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [31:0] nodeIn_ar_bits_addr = auto_in_ar_bits_addr;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]  nodeIn_ar_bits_len = auto_in_ar_bits_len;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_ar_bits_size = auto_in_ar_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]  nodeIn_ar_bits_burst = auto_in_ar_bits_burst;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_ar_bits_lock = auto_in_ar_bits_lock;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]  nodeIn_ar_bits_cache = auto_in_ar_bits_cache;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_ar_bits_prot = auto_in_ar_bits_prot;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [3:0]  nodeIn_ar_bits_qos = auto_in_ar_bits_qos;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [6:0]  nodeIn_ar_bits_echo_extra_id = auto_in_ar_bits_echo_extra_id;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_ar_bits_echo_real_last = auto_in_ar_bits_echo_real_last;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_r_ready = auto_in_r_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeOut_aw_ready = auto_out_aw_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_w_ready = auto_out_w_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_b_valid = auto_out_b_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_b_bits_id = auto_out_b_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]  nodeOut_b_bits_resp = auto_out_b_bits_resp;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_ar_ready = auto_out_ar_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_r_valid = auto_out_r_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_r_bits_id = auto_out_r_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [63:0] nodeOut_r_bits_data = auto_out_r_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]  nodeOut_r_bits_resp = auto_out_r_bits_resp;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_r_bits_last = auto_out_r_bits_last;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_aw_bits_id = nodeIn_aw_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        awsel_shiftAmount = nodeIn_aw_bits_id;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [31:0] nodeOut_aw_bits_addr = nodeIn_aw_bits_addr;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [7:0]  nodeOut_aw_bits_len = nodeIn_aw_bits_len;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [2:0]  nodeOut_aw_bits_size = nodeIn_aw_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [1:0]  nodeOut_aw_bits_burst = nodeIn_aw_bits_burst;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeOut_aw_bits_lock = nodeIn_aw_bits_lock;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [3:0]  nodeOut_aw_bits_cache = nodeIn_aw_bits_cache;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [2:0]  nodeOut_aw_bits_prot = nodeIn_aw_bits_prot;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [3:0]  nodeOut_aw_bits_qos = nodeIn_aw_bits_qos;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeOut_w_valid = nodeIn_w_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [63:0] nodeOut_w_bits_data = nodeIn_w_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [7:0]  nodeOut_w_bits_strb = nodeIn_w_bits_strb;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeOut_w_bits_last = nodeIn_w_bits_last;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeOut_b_ready = nodeIn_b_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeOut_ar_bits_id = nodeIn_ar_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        arsel_shiftAmount = nodeIn_ar_bits_id;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [31:0] nodeOut_ar_bits_addr = nodeIn_ar_bits_addr;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [7:0]  nodeOut_ar_bits_len = nodeIn_ar_bits_len;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [2:0]  nodeOut_ar_bits_size = nodeIn_ar_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [1:0]  nodeOut_ar_bits_burst = nodeIn_ar_bits_burst;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeOut_ar_bits_lock = nodeIn_ar_bits_lock;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [3:0]  nodeOut_ar_bits_cache = nodeIn_ar_bits_cache;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [2:0]  nodeOut_ar_bits_prot = nodeIn_ar_bits_prot;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [3:0]  nodeOut_ar_bits_qos = nodeIn_ar_bits_qos;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeOut_r_ready = nodeIn_r_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeIn_w_ready = nodeOut_w_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeIn_b_valid = nodeOut_b_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeIn_b_bits_id = nodeOut_b_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        bsel_shiftAmount = nodeOut_b_bits_id;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]  nodeIn_b_bits_resp = nodeOut_b_bits_resp;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeIn_r_valid = nodeOut_r_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeIn_r_bits_id = nodeOut_r_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        rsel_shiftAmount = nodeOut_r_bits_id;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [63:0] nodeIn_r_bits_data = nodeOut_r_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [1:0]  nodeIn_r_bits_resp = nodeOut_r_bits_resp;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeIn_r_bits_last = nodeOut_r_bits_last;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        _GEN = nodeIn_ar_bits_id ? _Queue_1_io_enq_ready : _Queue_io_enq_ready;	// src/main/scala/amba/axi4/UserYanker.scala:48:17, :57:36, src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_ar_ready = nodeOut_ar_ready & _GEN;	// src/main/scala/amba/axi4/UserYanker.scala:57:36, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeOut_ar_valid = nodeIn_ar_valid & _GEN;	// src/main/scala/amba/axi4/UserYanker.scala:57:36, :58:36, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [6:0]  nodeIn_r_bits_echo_extra_id =
    nodeOut_r_bits_id ? _Queue_1_io_deq_bits_extra_id : _Queue_io_deq_bits_extra_id;	// src/main/scala/amba/axi4/UserYanker.scala:48:17, :70:22, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeIn_r_bits_echo_real_last =
    nodeOut_r_bits_id ? _Queue_1_io_deq_bits_real_last : _Queue_io_deq_bits_real_last;	// src/main/scala/amba/axi4/UserYanker.scala:48:17, :70:22, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        arsel_1 = arsel_shiftAmount;	// src/main/scala/amba/axi4/UserYanker.scala:72:55, src/main/scala/chisel3/util/OneHot.scala:64:49
  wire        arsel_0 = ~arsel_shiftAmount;	// src/main/scala/amba/axi4/UserYanker.scala:72:55, src/main/scala/chisel3/util/OneHot.scala:64:49
  wire        rsel_1 = rsel_shiftAmount;	// src/main/scala/amba/axi4/UserYanker.scala:73:55, src/main/scala/chisel3/util/OneHot.scala:64:49
  wire        rsel_0 = ~rsel_shiftAmount;	// src/main/scala/amba/axi4/UserYanker.scala:73:55, src/main/scala/chisel3/util/OneHot.scala:64:49
  wire        _T_10 = nodeOut_r_valid & nodeIn_r_ready;	// src/main/scala/amba/axi4/UserYanker.scala:75:37, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        _T_13 = nodeIn_ar_valid & nodeOut_ar_ready;	// src/main/scala/amba/axi4/UserYanker.scala:78:37, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        _GEN_0 = nodeIn_aw_bits_id ? _Queue_3_io_enq_ready : _Queue_2_io_enq_ready;	// src/main/scala/amba/axi4/UserYanker.scala:48:17, :86:36, src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_aw_ready = nodeOut_aw_ready & _GEN_0;	// src/main/scala/amba/axi4/UserYanker.scala:86:36, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeOut_aw_valid = nodeIn_aw_valid & _GEN_0;	// src/main/scala/amba/axi4/UserYanker.scala:86:36, :87:36, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  `ifndef SYNTHESIS	// src/main/scala/amba/axi4/UserYanker.scala:66:14
    always @(posedge clock) begin	// src/main/scala/amba/axi4/UserYanker.scala:66:14
      if (~reset
          & ~(~nodeOut_r_valid
              | (nodeOut_r_bits_id ? _Queue_1_io_deq_valid : _Queue_io_deq_valid))) begin	// src/main/scala/amba/axi4/UserYanker.scala:48:17, :66:{14,15,28}, src/main/scala/diplomacy/Nodes.scala:1205:17
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/amba/axi4/UserYanker.scala:66:14
          $error("Assertion failed\n    at UserYanker.scala:66 assert (!out.r.valid || r_valid) // Q must be ready faster than the response\n");	// src/main/scala/amba/axi4/UserYanker.scala:66:14
        if (`STOP_COND_)	// src/main/scala/amba/axi4/UserYanker.scala:66:14
          $fatal;	// src/main/scala/amba/axi4/UserYanker.scala:66:14
      end
      if (~reset
          & ~(~nodeOut_b_valid
              | (nodeOut_b_bits_id
                   ? _Queue_3_io_deq_valid
                   : _Queue_2_io_deq_valid))) begin	// src/main/scala/amba/axi4/UserYanker.scala:48:17, :95:{14,15,28}, src/main/scala/diplomacy/Nodes.scala:1205:17
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/amba/axi4/UserYanker.scala:95:14
          $error("Assertion failed\n    at UserYanker.scala:95 assert (!out.b.valid || b_valid) // Q must be ready faster than the response\n");	// src/main/scala/amba/axi4/UserYanker.scala:95:14
        if (`STOP_COND_)	// src/main/scala/amba/axi4/UserYanker.scala:95:14
          $fatal;	// src/main/scala/amba/axi4/UserYanker.scala:95:14
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [6:0]  nodeIn_b_bits_echo_extra_id =
    nodeOut_b_bits_id ? _Queue_3_io_deq_bits_extra_id : _Queue_2_io_deq_bits_extra_id;	// src/main/scala/amba/axi4/UserYanker.scala:48:17, :99:22, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        nodeIn_b_bits_echo_real_last =
    nodeOut_b_bits_id ? _Queue_3_io_deq_bits_real_last : _Queue_2_io_deq_bits_real_last;	// src/main/scala/amba/axi4/UserYanker.scala:48:17, :99:22, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        awsel_1 = awsel_shiftAmount;	// src/main/scala/amba/axi4/UserYanker.scala:101:55, src/main/scala/chisel3/util/OneHot.scala:64:49
  wire        awsel_0 = ~awsel_shiftAmount;	// src/main/scala/amba/axi4/UserYanker.scala:101:55, src/main/scala/chisel3/util/OneHot.scala:64:49
  wire        bsel_1 = bsel_shiftAmount;	// src/main/scala/amba/axi4/UserYanker.scala:102:55, src/main/scala/chisel3/util/OneHot.scala:64:49
  wire        bsel_0 = ~bsel_shiftAmount;	// src/main/scala/amba/axi4/UserYanker.scala:102:55, src/main/scala/chisel3/util/OneHot.scala:64:49
  wire        _T_24 = nodeOut_b_valid & nodeIn_b_ready;	// src/main/scala/amba/axi4/UserYanker.scala:104:37, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire        _T_26 = nodeIn_aw_valid & nodeOut_aw_ready;	// src/main/scala/amba/axi4/UserYanker.scala:107:37, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  Queue_28 Queue (	// src/main/scala/amba/axi4/UserYanker.scala:48:17
    .clock                 (clock),
    .reset                 (reset),
    .io_enq_valid          (_T_13 & arsel_0),	// src/main/scala/amba/axi4/UserYanker.scala:72:55, :78:{37,53}
    .io_enq_bits_extra_id  (nodeIn_ar_bits_echo_extra_id),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_real_last (nodeIn_ar_bits_echo_real_last),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_deq_ready          (_T_10 & rsel_0 & nodeOut_r_bits_last),	// src/main/scala/amba/axi4/UserYanker.scala:73:55, :75:{37,58}, src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_enq_ready          (_Queue_io_enq_ready),
    .io_deq_valid          (_Queue_io_deq_valid),
    .io_deq_bits_extra_id  (_Queue_io_deq_bits_extra_id),
    .io_deq_bits_real_last (_Queue_io_deq_bits_real_last)
  );
  Queue_28 Queue_1 (	// src/main/scala/amba/axi4/UserYanker.scala:48:17
    .clock                 (clock),
    .reset                 (reset),
    .io_enq_valid          (_T_13 & arsel_1),	// src/main/scala/amba/axi4/UserYanker.scala:72:55, :78:{37,53}
    .io_enq_bits_extra_id  (nodeIn_ar_bits_echo_extra_id),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_real_last (nodeIn_ar_bits_echo_real_last),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_deq_ready          (_T_10 & rsel_1 & nodeOut_r_bits_last),	// src/main/scala/amba/axi4/UserYanker.scala:73:55, :75:{37,58}, src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_enq_ready          (_Queue_1_io_enq_ready),
    .io_deq_valid          (_Queue_1_io_deq_valid),
    .io_deq_bits_extra_id  (_Queue_1_io_deq_bits_extra_id),
    .io_deq_bits_real_last (_Queue_1_io_deq_bits_real_last)
  );
  Queue_28 Queue_2 (	// src/main/scala/amba/axi4/UserYanker.scala:48:17
    .clock                 (clock),
    .reset                 (reset),
    .io_enq_valid          (_T_26 & awsel_0),	// src/main/scala/amba/axi4/UserYanker.scala:101:55, :107:{37,53}
    .io_enq_bits_extra_id  (nodeIn_aw_bits_echo_extra_id),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_real_last (nodeIn_aw_bits_echo_real_last),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_deq_ready          (_T_24 & bsel_0),	// src/main/scala/amba/axi4/UserYanker.scala:102:55, :104:{37,53}
    .io_enq_ready          (_Queue_2_io_enq_ready),
    .io_deq_valid          (_Queue_2_io_deq_valid),
    .io_deq_bits_extra_id  (_Queue_2_io_deq_bits_extra_id),
    .io_deq_bits_real_last (_Queue_2_io_deq_bits_real_last)
  );
  Queue_28 Queue_3 (	// src/main/scala/amba/axi4/UserYanker.scala:48:17
    .clock                 (clock),
    .reset                 (reset),
    .io_enq_valid          (_T_26 & awsel_1),	// src/main/scala/amba/axi4/UserYanker.scala:101:55, :107:{37,53}
    .io_enq_bits_extra_id  (nodeIn_aw_bits_echo_extra_id),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_real_last (nodeIn_aw_bits_echo_real_last),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_deq_ready          (_T_24 & bsel_1),	// src/main/scala/amba/axi4/UserYanker.scala:102:55, :104:{37,53}
    .io_enq_ready          (_Queue_3_io_enq_ready),
    .io_deq_valid          (_Queue_3_io_deq_valid),
    .io_deq_bits_extra_id  (_Queue_3_io_deq_bits_extra_id),
    .io_deq_bits_real_last (_Queue_3_io_deq_bits_real_last)
  );
  assign auto_in_aw_ready = nodeIn_aw_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_w_ready = nodeIn_w_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_b_valid = nodeIn_b_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_b_bits_id = nodeIn_b_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_b_bits_resp = nodeIn_b_bits_resp;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_b_bits_echo_extra_id = nodeIn_b_bits_echo_extra_id;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_b_bits_echo_real_last = nodeIn_b_bits_echo_real_last;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_ar_ready = nodeIn_ar_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_r_valid = nodeIn_r_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_r_bits_id = nodeIn_r_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_r_bits_data = nodeIn_r_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_r_bits_resp = nodeIn_r_bits_resp;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_r_bits_echo_extra_id = nodeIn_r_bits_echo_extra_id;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_r_bits_echo_real_last = nodeIn_r_bits_echo_real_last;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_r_bits_last = nodeIn_r_bits_last;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_out_aw_valid = nodeOut_aw_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_aw_bits_id = nodeOut_aw_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_aw_bits_addr = nodeOut_aw_bits_addr;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_aw_bits_len = nodeOut_aw_bits_len;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_aw_bits_size = nodeOut_aw_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_aw_bits_burst = nodeOut_aw_bits_burst;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_aw_bits_lock = nodeOut_aw_bits_lock;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_aw_bits_cache = nodeOut_aw_bits_cache;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_aw_bits_prot = nodeOut_aw_bits_prot;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_aw_bits_qos = nodeOut_aw_bits_qos;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_w_valid = nodeOut_w_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_w_bits_data = nodeOut_w_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_w_bits_strb = nodeOut_w_bits_strb;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_w_bits_last = nodeOut_w_bits_last;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_b_ready = nodeOut_b_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_ar_valid = nodeOut_ar_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_ar_bits_id = nodeOut_ar_bits_id;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_ar_bits_addr = nodeOut_ar_bits_addr;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_ar_bits_len = nodeOut_ar_bits_len;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_ar_bits_size = nodeOut_ar_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_ar_bits_burst = nodeOut_ar_bits_burst;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_ar_bits_lock = nodeOut_ar_bits_lock;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_ar_bits_cache = nodeOut_ar_bits_cache;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_ar_bits_prot = nodeOut_ar_bits_prot;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_ar_bits_qos = nodeOut_ar_bits_qos;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_r_ready = nodeOut_r_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
endmodule

