module routing_dir_PE(
    input clk,
    input reset,
    input empty,
    input full_E, full_W, full_S, full_N,//From arbiter
    input [63:0]in_packet,
    output reg [63:0]E_packet,
    output reg E_req,
    output reg [63:0]W_packet,
    output reg W_req,
    output reg [63:0]S_packet,
    output reg S_req,
    output reg [63:0]N_packet,
    output reg N_req,
    output reg read_en

);

reg [63:0]temp_packet;
reg data_valid;
// wire [2:0]src_x;
// wire [2:0]src_y;
wire dir_x=temp_packet[58];//0: Go right, 1: Go left
wire dir_y=temp_packet[57];//0: Go up, 1: Go down
wire [2:0]hop_x=temp_packet[56:55];
wire [2:0]hop_y=temp_packet[54:53];



always@(posedge clk)begin
    if(reset)begin
        temp_packet<=0;
        data_valid<=0;
    end
    else begin 
        if(read_en &&!empty)begin
            temp_packet<=in_packet;
            data_valid<=1;
        end
        if(S_req||W_req||E_req||N_req)begin
            data_valid<=0;
        end
    end
end

always@(*)begin
    E_packet=temp_packet;
    S_packet=temp_packet;
    W_packet=temp_packet;
    N_packet=temp_packet;

    E_req=0;
    W_req=0;
    S_req=0;
    N_req=0;

    if(!empty&&!data_valid)begin
            read_en=1;
    end 
    else begin
        read_en=0;
    end
if(data_valid)begin
    $display("In routing PE");
    //X-Direction. Since packet comes from E, so it is impossible to send packet to right again
    if(hop_x!=0)begin
        if(dir_x==0 && !full_E)begin
            E_packet[56:55]=hop_x-1;
            E_req=1;
        end
        else if(dir_x==1 && !full_W)begin
            W_packet[56:55]=hop_x-1;
            W_req=1;
        end
    end

    //Y-Direction
    else if(hop_y!=0)begin
        if(dir_y==1 && !full_S)begin
             S_packet[54:53]=hop_y-1;
             S_req=1;
        end
        else if(dir_y==0 && !full_N)begin
             N_packet[54:53]=hop_y-1;
             N_req=1;
        end
    end
end
end

endmodule