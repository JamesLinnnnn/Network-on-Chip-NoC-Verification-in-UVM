`timescale 1ns/1ns


module out_hand_shaking(
    input clk,
    input reset,
    input empty,
    input ro,
    input [63:0]in_packet,
    output reg read_en, 
    output reg so,
    output reg [63:0]out_packet
);
reg [63:0]temp_packet;
reg data_valid;
always@(posedge clk)begin
    if(reset)begin
        data_valid<=0;
        temp_packet<=0;
    end
    else begin
        if(read_en)begin
            data_valid<=1;
            temp_packet<=in_packet;
        end
        if(so)begin
            data_valid<=0;
        end
    end
end
always@(*)begin
    out_packet=temp_packet; read_en=0;
    so=0;
    if(!empty&&!data_valid)begin
        read_en=1;
    end
    if(data_valid&&ro)begin
        so=1;
    end
end

endmodule