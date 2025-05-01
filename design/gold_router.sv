module gold_router(
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

router gold_router(
        .clk(clk),
        .reset(reset),
        .si_E(si_E), .si_W(si_W), .si_S(si_S), .si_N(si_N), .si_PE(si_PE),
        .ro_E(ro_E), .ro_W(ro_W), .ro_S(ro_S), .ro_N(ro_N), .ro_PE(ro_PE),
        .E_packet_in(E_packet_in),
        .W_packet_in(W_packet_in),
        .S_packet_in(S_packet_in),
        .N_packet_in(N_packet_in),
        .PE_packet_in(PE_packet_in),
        .ri_E(ri_E), .ri_W(ri_W), .ri_S(ri_S), .ri_N(ri_N), .ri_PE(ri_PE),
        .so_E(so_E), .so_W(so_W), .so_S(so_S), .so_N(so_N), .so_PE(so_PE),
        .router_out_E(router_out_E),
        .router_out_W(router_out_W),
        .router_out_S(router_out_S),
        .router_out_N(router_out_N),
        .router_out_PE(router_out_PE),
        .polarity(polarity)
    );


endmodule