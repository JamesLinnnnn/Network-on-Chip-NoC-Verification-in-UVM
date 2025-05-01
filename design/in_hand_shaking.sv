`timescale 1ns/1ns


module in_hand_shaking(
    input clk,
    input reset,
    input si,
    input full,
    input [63:0]in_packet,
    output reg wr_en, //Write enable to input FIFO
    output reg ri,
    output reg [63:0]output_packet
);

reg data_valid;
reg [63:0]temp_packet;

always@(posedge clk)begin
    if(reset)begin
        data_valid<=0;
        temp_packet<=0;
    end
    else begin
        if(si&&ri)begin
            data_valid<=1;
            temp_packet<=in_packet;
        end
        if(wr_en)begin
            data_valid<=0;
        end

    end
end

always@(*)begin
    output_packet=temp_packet;
    wr_en=0;ri=0;
    if(!data_valid)begin
        ri=1;
    end
    if(data_valid)begin
        if(!full)begin
            wr_en=1;
        end
    end
end
endmodule