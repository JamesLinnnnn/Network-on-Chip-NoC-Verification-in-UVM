module router(
    input clk,
    input reset,
    input si_E, si_W, si_S, si_N, si_PE,
    input ro_E, ro_W, ro_S, ro_N, ro_PE,
    input [63:0]E_packet_in,W_packet_in,S_packet_in,N_packet_in,PE_packet_in,
    output ri_E, ri_W, ri_S, ri_N, ri_PE,
    output so_E, so_W, so_S, so_N, so_PE,
    output [63:0]router_out_E, router_out_W, router_out_S, router_out_N, router_out_PE, 
    output polarity
);


//wire for routing 
wire [63:0]E_packet_in_wire;
wire [63:0]W_packet_in_wire;
wire [63:0]S_packet_in_wire;
wire [63:0]N_packet_in_wire;
wire [63:0]PE_packet_in_wire;
wire E_empty, W_empty, S_empty, N_empty, PE_empty;
//full for E in
wire E_full_W, E_full_S, E_full_N, E_full_PE;
//full for W in
wire W_full_E, W_full_S, W_full_N, W_full_PE;
//full for S in
wire S_full_E, S_full_W, S_full_N, S_full_PE;
//full for N in
wire N_full_E, N_full_W, N_full_S, N_full_PE;
//full for PE in
wire PE_full_E, PE_full_W, PE_full_N, PE_full_S;
//East in Output
wire [63:0]E_packet_out_W;
wire E_req_W;
wire [63:0]E_packet_out_N;
wire E_req_N;
wire [63:0]E_packet_out_S;
wire E_req_S;
wire [63:0]E_packet_out_PE;
wire E_req_PE;
wire E_read_en; 
//West in Output
wire [63:0]W_packet_out_E;
wire W_req_E;
wire [63:0]W_packet_out_S;
wire W_req_S;
wire [63:0]W_packet_out_N;
wire W_req_N;
wire [63:0]W_packet_out_PE;
wire W_req_PE;
wire W_read_en;
//South in Output
wire [63:0]S_packet_out_E;
wire S_req_E;
wire [63:0]S_packet_out_W;
wire S_req_W;
wire [63:0]S_packet_out_N;
wire S_req_N;
wire [63:0]S_packet_out_PE;
wire S_req_PE;
wire S_read_en;
//North in output
wire [63:0]N_packet_out_E;
wire N_req_E;
wire [63:0]N_packet_out_W;
wire N_req_W;
wire [63:0]N_packet_out_S;
wire N_req_S;
wire [63:0]N_packet_out_PE;
wire N_req_PE;
wire N_read_en;
//PE in wire
wire [63:0]PE_packet_out_E;
wire PE_req_E;
wire [63:0]PE_packet_out_W;
wire PE_req_W;
wire [63:0]PE_packet_out_S;
wire PE_req_S;
wire [63:0]PE_packet_out_N;
wire PE_req_N;
wire PE_read_en;   



//Input HandShaking
wire E_wr_en_hand, W_wr_en_hand, N_wr_en_hand, S_wr_en_hand, PE_wr_en_hand;
wire [63:0]E_packet_in_hand, W_packet_in_hand, S_packet_in_hand, N_packet_in_hand, PE_packet_in_hand;
wire fifo_E_full, fifo_W_full, fifo_N_full, fifo_S_full,fifo_PE_full;//fifo full output signal
in_hand_shaking hand_in_E(.clk(clk), .reset(reset), .si(si_E), .full(fifo_E_full), .in_packet(E_packet_in), .wr_en(E_wr_en_hand),  .ri(ri_E), .output_packet(E_packet_in_hand));
in_hand_shaking hand_in_W(.clk(clk), .reset(reset), .si(si_W), .full(fifo_W_full), .in_packet(W_packet_in), .wr_en(W_wr_en_hand),  .ri(ri_W), .output_packet(W_packet_in_hand));
in_hand_shaking hand_in_S(.clk(clk), .reset(reset), .si(si_S), .full(fifo_S_full), .in_packet(S_packet_in), .wr_en(S_wr_en_hand),  .ri(ri_S), .output_packet(S_packet_in_hand));
in_hand_shaking hand_in_N(.clk(clk), .reset(reset), .si(si_N), .full(fifo_N_full), .in_packet(N_packet_in), .wr_en(N_wr_en_hand),  .ri(ri_N), .output_packet(N_packet_in_hand));
in_hand_shaking hand_in_PE(.clk(clk), .reset(reset), .si(si_PE), .full(fifo_PE_full), .in_packet(PE_packet_in), .wr_en(PE_wr_en_hand),  .ri(ri_PE), .output_packet(PE_packet_in_hand));

//Input FIFO
FIFO fifo_E_in(.clk(clk), .rst(reset), .wr_en(E_wr_en_hand), .rd_en(E_read_en), .din(E_packet_in_hand), .dout(E_packet_in_wire), .empty(E_empty), .full(fifo_E_full));
FIFO fifo_W_in(.clk(clk), .rst(reset), .wr_en(W_wr_en_hand), .rd_en(W_read_en), .din(W_packet_in_hand), .dout(W_packet_in_wire), .empty(W_empty), .full(fifo_W_full));
FIFO fifo_S_in(.clk(clk), .rst(reset), .wr_en(S_wr_en_hand), .rd_en(S_read_en), .din(S_packet_in_hand), .dout(S_packet_in_wire), .empty(S_empty), .full(fifo_S_full));
FIFO fifo_N_in(.clk(clk), .rst(reset), .wr_en(N_wr_en_hand), .rd_en(N_read_en), .din(N_packet_in_hand), .dout(N_packet_in_wire), .empty(N_empty), .full(fifo_N_full));
FIFO fifo_PE_in(.clk(clk), .rst(reset), .wr_en(PE_wr_en_hand), .rd_en(PE_read_en), .din(PE_packet_in_hand), .dout(PE_packet_in_wire), .empty(PE_empty), .full(fifo_PE_full));


//Routing Algorithm
routing routing_top(
    .clk(clk),
    .reset(reset),
    .E_packet_in(E_packet_in_wire),
    .W_packet_in(W_packet_in_wire),
    .S_packet_in(S_packet_in_wire),
    .N_packet_in(N_packet_in_wire),
    .PE_packet_in(PE_packet_in_wire),
    .E_empty(E_empty),
    .W_empty(W_empty),
    .S_empty(S_empty),
    .N_empty(N_empty),
    .PE_empty(PE_empty),
    // Full signals for E input
    .E_full_W(E_full_W),
    .E_full_S(E_full_S),
    .E_full_N(E_full_N),
    .E_full_PE(E_full_PE),
    // Full signals for W input
    .W_full_E(W_full_E),
    .W_full_S(W_full_S),
    .W_full_N(W_full_N),
    .W_full_PE(W_full_PE),
    // Full signals for S input
    .S_full_E(S_full_E),
    .S_full_W(S_full_W),
    .S_full_N(S_full_N),
    .S_full_PE(S_full_PE),
    // Full signals for N input
    .N_full_E(N_full_E),
    .N_full_W(N_full_W),
    .N_full_S(N_full_S),
    .N_full_PE(N_full_PE),
    // Full signals for PE input
    .PE_full_E(PE_full_E),
    .PE_full_W(PE_full_W),
    .PE_full_S(PE_full_S),
    .PE_full_N(PE_full_N),
    // East output
    .E_packet_out_W(E_packet_out_W),
    .E_req_W(E_req_W),
    .E_packet_out_N(E_packet_out_N),
    .E_req_N(E_req_N),
    .E_packet_out_S(E_packet_out_S),
    .E_req_S(E_req_S),
    .E_packet_out_PE(E_packet_out_PE),
    .E_req_PE(E_req_PE),
    .E_read_en(E_read_en),
    // West output
    .W_packet_out_E(W_packet_out_E),
    .W_req_E(W_req_E),
    .W_packet_out_S(W_packet_out_S),
    .W_req_S(W_req_S),
    .W_packet_out_N(W_packet_out_N),
    .W_req_N(W_req_N),
    .W_packet_out_PE(W_packet_out_PE),
    .W_req_PE(W_req_PE),
    .W_read_en(W_read_en),
    // South output
    .S_packet_out_E(S_packet_out_E),
    .S_req_E(S_req_E),
    .S_packet_out_W(S_packet_out_W),
    .S_req_W(S_req_W),
    .S_packet_out_N(S_packet_out_N),
    .S_req_N(S_req_N),
    .S_packet_out_PE(S_packet_out_PE),
    .S_req_PE(S_req_PE),
    .S_read_en(S_read_en),
    // North output
    .N_packet_out_E(N_packet_out_E),
    .N_req_E(N_req_E),
    .N_packet_out_W(N_packet_out_W),
    .N_req_W(N_req_W),
    .N_packet_out_S(N_packet_out_S),
    .N_req_S(N_req_S),
    .N_packet_out_PE(N_packet_out_PE),
    .N_req_PE(N_req_PE),
    .N_read_en(N_read_en),
    // PE output
    .PE_packet_out_E(PE_packet_out_E),
    .PE_req_E(PE_req_E),
    .PE_packet_out_W(PE_packet_out_W),
    .PE_req_W(PE_req_W),
    .PE_packet_out_S(PE_packet_out_S),
    .PE_req_S(PE_req_S),
    .PE_packet_out_N(PE_packet_out_N),
    .PE_req_N(PE_req_N),
    .PE_read_en(PE_read_en)
);

//Arbiters
wire [63:0]arb_out_E_packet, arb_out_W_packet, arb_out_S_packet, arb_out_N_packet, arb_out_PE_packet;
wire arb_wr_en_E, arb_wr_en_W, arb_wr_en_S, arb_wr_en_N, arb_wr_en_PE;
wire fifo_out_E_full, fifo_out_W_full, fifo_out_S_full, fifo_out_N_full, fifo_out_PE_full;

arbiter arb_E_out(.clk(clk), .reset(reset), .fifo_full(fifo_out_E_full),
    .in_packet_one(W_packet_out_E),
    .one_req(W_req_E),
    .full_one(W_full_E),
    .in_packet_two(S_packet_out_E),
    .two_req(S_req_E),
    .full_two(S_full_E),
    .in_packet_three(N_packet_out_E),
    .three_req(N_req_E),
    .full_three(N_full_E),
    .in_packet_four(PE_packet_out_E),
    .four_req(PE_req_E),
    .full_four(PE_full_E),
    .out_packet(arb_out_E_packet),
    .wr_en(arb_wr_en_E)
);
arbiter arb_W_out(.clk(clk), .reset(reset), .fifo_full(fifo_out_W_full),
    .in_packet_one(E_packet_out_W),
    .one_req(E_req_W),
    .full_one(E_full_W),
    .in_packet_two(S_packet_out_W),
    .two_req(S_req_W),
    .full_two(S_full_W),
    .in_packet_three(N_packet_out_W),
    .three_req(N_req_W),
    .full_three(N_full_W),
    .in_packet_four(PE_packet_out_W),
    .four_req(PE_req_W),
    .full_four(PE_full_W),
    .out_packet(arb_out_W_packet),
    .wr_en(arb_wr_en_W)
);
arbiter arb_S_out(.clk(clk), .reset(reset), .fifo_full(fifo_out_S_full),
    .in_packet_one(E_packet_out_S),
    .one_req(E_req_S),
    .full_one(E_full_S),
    .in_packet_two(W_packet_out_S),
    .two_req(W_req_S),
    .full_two(W_full_S),
    .in_packet_three(N_packet_out_S),
    .three_req(N_req_S),
    .full_three(N_full_S),
    .in_packet_four(PE_packet_out_S),
    .four_req(PE_req_S),
    .full_four(PE_full_S),
    .out_packet(arb_out_S_packet),
    .wr_en(arb_wr_en_S)
);
arbiter arb_N_out(.clk(clk), .reset(reset), .fifo_full(fifo_out_N_full),
    .in_packet_one(E_packet_out_N),
    .one_req(E_req_N),
    .full_one(E_full_N),
    .in_packet_two(W_packet_out_N),
    .two_req(W_req_N),
    .full_two(W_full_N),
    .in_packet_three(S_packet_out_N),
    .three_req(S_req_N),
    .full_three(S_full_N),
    .in_packet_four(PE_packet_out_N),
    .four_req(PE_req_N),
    .full_four(PE_full_N),
    .out_packet(arb_out_N_packet),
    .wr_en(arb_wr_en_N)
);
arbiter arb_PE_out(.clk(clk), .reset(reset), .fifo_full(fifo_out_PE_full),
    .in_packet_one(E_packet_out_PE),
    .one_req(E_req_PE),
    .full_one(E_full_PE),
    .in_packet_two(W_packet_out_PE),
    .two_req(W_req_PE),
    .full_two(W_full_PE),
    .in_packet_three(S_packet_out_PE),
    .three_req(S_req_PE),
    .full_three(S_full_PE),
    .in_packet_four(N_packet_out_PE),
    .four_req(N_req_PE),
    .full_four(N_full_PE),
    .out_packet(arb_out_PE_packet),
    .wr_en(arb_wr_en_PE)
);

//Ouptut FIFO
wire [63:0]fifo_out_E, fifo_out_W, fifo_out_S, fifo_out_N, fifo_out_PE; 
wire E_empty_fifo_out, W_empty_fifo_out, N_empty_fifo_out, S_empty_fifo_out, PE_empty_fifo_out;
wire E_read_en_out, W_read_en_out, S_read_en_out, N_read_en_out, PE_read_en_out;
FIFO fifo_E_out(.clk(clk), .rst(reset), .wr_en(arb_wr_en_E), .rd_en(E_read_en_out), .din(arb_out_E_packet), .dout(fifo_out_E), .empty(E_empty_fifo_out), .full(fifo_out_E_full));
FIFO fifo_W_out(.clk(clk), .rst(reset), .wr_en(arb_wr_en_W), .rd_en(W_read_en_out), .din(arb_out_W_packet), .dout(fifo_out_W), .empty(W_empty_fifo_out), .full(fifo_out_W_full));
FIFO fifo_S_out(.clk(clk), .rst(reset), .wr_en(arb_wr_en_S), .rd_en(S_read_en_out), .din(arb_out_S_packet), .dout(fifo_out_S), .empty(S_empty_fifo_out), .full(fifo_out_S_full));
FIFO fifo_N_out(.clk(clk), .rst(reset), .wr_en(arb_wr_en_N), .rd_en(N_read_en_out), .din(arb_out_N_packet), .dout(fifo_out_N), .empty(N_empty_fifo_out), .full(fifo_out_N_full));
FIFO_PE fifo_PE_out(.clk(clk), .rst(reset), .wr_en(arb_wr_en_PE), .rd_en(PE_read_en_out), .din(arb_out_PE_packet), .dout(fifo_out_PE), .empty(PE_empty_fifo_out), .full(fifo_out_PE_full), .polarity(polarity));

//Output Hand Shaking
out_hand_shaking hand_out_E(.clk(clk), .reset(reset), .empty(E_empty_fifo_out), .ro(ro_E), .in_packet(fifo_out_E), .read_en(E_read_en_out), .so(so_E), .out_packet(router_out_E));
out_hand_shaking hand_out_W(.clk(clk), .reset(reset), .empty(W_empty_fifo_out), .ro(ro_W), .in_packet(fifo_out_W), .read_en(W_read_en_out), .so(so_W), .out_packet(router_out_W));
out_hand_shaking hand_out_S(.clk(clk), .reset(reset), .empty(S_empty_fifo_out), .ro(ro_S), .in_packet(fifo_out_S), .read_en(S_read_en_out), .so(so_S), .out_packet(router_out_S));
out_hand_shaking hand_out_N(.clk(clk), .reset(reset), .empty(N_empty_fifo_out), .ro(ro_N), .in_packet(fifo_out_N), .read_en(N_read_en_out), .so(so_N), .out_packet(router_out_N));
out_hand_shaking hand_out_PE(.clk(clk), .reset(reset), .empty(PE_empty_fifo_out), .ro(ro_PE), .in_packet(fifo_out_PE), .read_en(PE_read_en_out), .so(so_PE), .out_packet(router_out_PE));


endmodule