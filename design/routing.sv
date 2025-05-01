module routing(
    input clk,
    input reset,
    input [63:0]E_packet_in,
    input [63:0]W_packet_in,
    input [63:0]S_packet_in,
    input [63:0]N_packet_in,
    input [63:0]PE_packet_in,
    input E_empty, W_empty, S_empty, N_empty, PE_empty,
    //full for E in
    input E_full_W, E_full_S, E_full_N, E_full_PE,
    //full for W in
    input W_full_E, W_full_S, W_full_N, W_full_PE,
    //full for S in
    input S_full_E, S_full_W, S_full_N, S_full_PE,
    //full for N in
    input N_full_E, N_full_W, N_full_S, N_full_PE,
    //full for PE in
    input PE_full_E, PE_full_W, PE_full_N, PE_full_S,
    //East in's Output
    output [63:0]E_packet_out_W,
    output E_req_W,
    output [63:0]E_packet_out_N,
    output E_req_N,
    output [63:0]E_packet_out_S,
    output E_req_S, 
    output [63:0]E_packet_out_PE,
    output E_req_PE, 
    output E_read_en, 
    //West in's Output
    output [63:0]W_packet_out_E,
    output W_req_E,
    output [63:0]W_packet_out_S,
    output W_req_S,
    output [63:0]W_packet_out_N,
    output W_req_N,
    output [63:0]W_packet_out_PE,
    output W_req_PE,
    output W_read_en,
    //South in's output
    output [63:0]S_packet_out_E,
    output S_req_E,
    output [63:0]S_packet_out_W,
    output S_req_W,
    output [63:0]S_packet_out_N,
    output S_req_N,
    output [63:0]S_packet_out_PE,
    output S_req_PE,
    output S_read_en,
    //North in's output
    output [63:0]N_packet_out_E,
    output N_req_E,
    output [63:0]N_packet_out_W,
    output N_req_W,
    output [63:0]N_packet_out_S,
    output N_req_S,
    output [63:0]N_packet_out_PE,
    output N_req_PE,
    output N_read_en,
    //PE in's output
    output [63:0]PE_packet_out_E,
    output PE_req_E,
    output [63:0]PE_packet_out_W,
    output PE_req_W,
    output [63:0]PE_packet_out_S,
    output PE_req_S,
    output [63:0]PE_packet_out_N,
    output PE_req_N,
    output PE_read_en
);

routing_dir_E rout_E(.clk(clk), .reset(reset), .empty(E_empty), .in_packet(E_packet_in), .full_W(E_full_W), .full_S(E_full_S), .full_N(E_full_N), .full_PE(E_full_PE),
.W_packet(E_packet_out_W), .W_req(E_req_W), .S_packet(E_packet_out_S), .S_req(E_req_S), .N_packet(E_packet_out_N), .N_req(E_req_N),
.PE_packet(E_packet_out_PE), .PE_req(E_req_PE), .read_en(E_read_en));

routing_dir_W rout_W(.clk(clk), .reset(reset), .empty(W_empty), .in_packet(W_packet_in), .full_E(W_full_E), .full_S(W_full_S), .full_N(W_full_N), .full_PE(W_full_PE),
.E_packet(W_packet_out_E), .E_req(W_req_E), .S_packet(W_packet_out_S), .S_req(W_req_S), .N_packet(W_packet_out_N), .N_req(W_req_N),
.PE_packet(W_packet_out_PE), .PE_req(W_req_PE), .read_en(W_read_en));

routing_dir_S rout_S(.clk(clk), .reset(reset), .empty(S_empty), .in_packet(S_packet_in), .full_E(S_full_E), .full_W(S_full_W), .full_N(S_full_N), .full_PE(S_full_PE),
.E_packet(S_packet_out_E), .E_req(S_req_E), .W_packet(S_packet_out_W), .W_req(S_req_W), .N_packet(S_packet_out_N), .N_req(S_req_N),
.PE_packet(S_packet_out_PE), .PE_req(S_req_PE), .read_en(S_read_en));

routing_dir_N rout_N(.clk(clk), .reset(reset), .empty(N_empty), .in_packet(N_packet_in), .full_E(N_full_E), .full_W(N_full_W), .full_S(N_full_S), .full_PE(N_full_PE),
.E_packet(N_packet_out_E), .E_req(N_req_E), .W_packet(N_packet_out_W), .W_req(N_req_W), .S_packet(N_packet_out_S), .S_req(N_req_S),
.PE_packet(N_packet_out_PE), .PE_req(N_req_PE), .read_en(N_read_en));

routing_dir_PE rout_PE(.clk(clk), .reset(reset), .empty(PE_empty), .in_packet(PE_packet_in), .full_E(PE_full_E), .full_W(PE_full_W), .full_S(PE_full_S), .full_N(PE_full_N),
.E_packet(PE_packet_out_E), .E_req(PE_req_E), .W_packet(PE_packet_out_W), .W_req(PE_req_W), .S_packet(PE_packet_out_S), .S_req(PE_req_S),
.N_packet(PE_packet_out_N), .N_req(PE_req_N), .read_en(PE_read_en));
endmodule