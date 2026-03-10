// Copyright (c) 2026 Leonardo Capossio — bard0 design  hello@bard0.com
// SPDX-License-Identifier: MIT
//
// axi_traffic_gen — Lightweight AXI4-Lite write-only traffic generator
//
// When trigger goes 0→1, writes NWORDS sequential words to BASE_ADDR.
// Pattern: word[i] = DATA_PATTERN | i
// Asserts done when all write responses received.
//
// Used as the second master in the WRR hardware test: MicroBlaze (weight 3)
// and this module (weight 1) both write to BRAM #0 through the axiZero
// crossbar simultaneously, exercising weighted round-robin arbitration.

module axi_traffic_gen #(
    parameter [31:0] BASE_ADDR    = 32'hC000_1000,
    parameter [31:0] DATA_PATTERN = 32'hB000_0000,
    parameter        NWORDS       = 256
)(
    input  wire        aclk,
    input  wire        aresetn,
    input  wire        trigger,
    output wire        done,

    // AXI4-Lite Write Address
    output wire        awvalid,
    input  wire        awready,
    output wire [31:0] awaddr,
    output wire [2:0]  awprot,

    // AXI4-Lite Write Data
    output wire        wvalid,
    input  wire        wready,
    output wire [31:0] wdata,
    output wire [3:0]  wstrb,

    // AXI4-Lite Write Response
    input  wire        bvalid,
    output wire        bready,
    input  wire [1:0]  bresp,

    // AXI4-Lite Read Address (unused — tied off)
    output wire        arvalid,
    input  wire        arready,
    output wire [31:0] araddr,
    output wire [2:0]  arprot,

    // AXI4-Lite Read Data (unused — tied off)
    input  wire        rvalid,
    output wire        rready,
    input  wire [31:0] rdata,
    input  wire [1:0]  rresp
);

    // Read channel permanently idle
    assign arvalid = 1'b0;
    assign araddr  = 32'b0;
    assign arprot  = 3'b0;
    assign rready  = 1'b0;

    // State machine
    localparam [1:0] S_IDLE   = 2'd0,
                     S_AW_W   = 2'd1,
                     S_WAIT_B = 2'd2,
                     S_DONE   = 2'd3;

    reg [1:0]  state;
    reg [8:0]  count;       // 0..NWORDS-1 (9 bits for up to 512)
    reg        aw_sent;
    reg        w_sent;
    reg        trigger_prev;

    // AW channel
    assign awvalid = (state == S_AW_W) && !aw_sent;
    assign awaddr  = BASE_ADDR + {count[7:0], 2'b00};
    assign awprot  = 3'b000;

    // W channel
    assign wvalid  = (state == S_AW_W) && !w_sent;
    assign wdata   = DATA_PATTERN | {23'b0, count[8:0]};
    assign wstrb   = 4'hF;

    // B channel
    assign bready  = (state == S_WAIT_B);

    // Done output
    assign done    = (state == S_DONE);

    always @(posedge aclk) begin
        if (!aresetn) begin
            state        <= S_IDLE;
            count        <= 9'd0;
            aw_sent      <= 1'b0;
            w_sent       <= 1'b0;
            trigger_prev <= 1'b0;
        end else begin
            trigger_prev <= trigger;

            case (state)
                S_IDLE: begin
                    if (trigger && !trigger_prev) begin
                        state   <= S_AW_W;
                        count   <= 9'd0;
                        aw_sent <= 1'b0;
                        w_sent  <= 1'b0;
                    end
                end

                S_AW_W: begin
                    // Track AW handshake
                    if (awvalid && awready)
                        aw_sent <= 1'b1;
                    // Track W handshake
                    if (wvalid && wready)
                        w_sent <= 1'b1;
                    // Both channels accepted → wait for B
                    if ((aw_sent || (awvalid && awready)) &&
                        (w_sent  || (wvalid  && wready))) begin
                        state <= S_WAIT_B;
                    end
                end

                S_WAIT_B: begin
                    if (bvalid) begin
                        if (count == NWORDS - 1) begin
                            state <= S_DONE;
                        end else begin
                            count   <= count + 9'd1;
                            state   <= S_AW_W;
                            aw_sent <= 1'b0;
                            w_sent  <= 1'b0;
                        end
                    end
                end

                S_DONE: begin
                    // Stay done until reset
                end
            endcase
        end
    end

endmodule
