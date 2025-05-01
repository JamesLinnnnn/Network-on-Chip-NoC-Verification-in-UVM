module arbiter(
    input clk,
    input reset,
    input fifo_full,
    input [63:0]in_packet_one,
    input one_req,
    output reg full_one,
    input [63:0]in_packet_two,
    input two_req,
    output reg full_two,
    input [63:0]in_packet_three,
    input three_req,
    output reg full_three,
    input [63:0]in_packet_four,
    input four_req,
    output reg full_four,
    output reg [63:0]out_packet,
    output reg wr_en
);

reg [63:0]temp_packet_one, temp_packet_two, temp_packet_three,temp_packet_four;
reg temp_req_one, temp_req_two,temp_req_three, temp_req_four;
reg [1:0]last_granted;

always@(posedge clk)begin
    if(reset)begin
        temp_packet_one<=0;
        temp_packet_two<=0;
        temp_packet_three<=0;
        temp_packet_four<=0;

        temp_req_one<=0;
        temp_req_two<=0;
        temp_req_three<=0;
        temp_req_four<=0;

        full_one <= 0;
        full_two <= 0;
        full_three <= 0;
        full_four <= 0;
    end

    else begin
        if(one_req&&!full_one)begin temp_packet_one<=in_packet_one;temp_req_one<=one_req; full_one<=1;end
        if(two_req&&!full_two)begin temp_packet_two<=in_packet_two; temp_req_two<=two_req; full_two<=1;end
        if(three_req&&!full_three)begin temp_packet_three<=in_packet_three;temp_req_three<=three_req;full_three<=1;end
        if(four_req&&!full_four)begin temp_packet_four<=in_packet_four; temp_req_four<=four_req; full_four<=1;end
    end
    case(last_granted)
       2'b00: if(temp_req_one&&wr_en) begin full_one <= 0; temp_req_one<=0;end
        2'b01:if(temp_req_two&&wr_en) begin full_two <= 0;  temp_req_two<=0;end
        2'b10:if(temp_req_three&&wr_en) begin full_three <= 0;  temp_req_three<=0;end
        2'b11:if(temp_req_four&&wr_en) begin  full_four <= 0; temp_req_four<=0;end
        endcase
end
always@(*)begin
        wr_en=0;
        out_packet=0;
        last_granted=0;
        if((temp_req_one||temp_req_two||temp_req_three||temp_req_four)&&!fifo_full)begin
             case (last_granted)
                2'd0: if (temp_req_two&&!fifo_full) begin
                  out_packet = temp_packet_two; last_granted = 1; 
                end else if (temp_req_three&&!fifo_full) begin
                  out_packet = temp_packet_three; last_granted =2;
                end else if (temp_req_four&&!fifo_full) begin
                   out_packet = temp_packet_four; last_granted = 3;
                end else if (temp_req_one&&!fifo_full) begin
                   out_packet = temp_packet_one; last_granted = 0;
                end

                2'd1: if (temp_req_three&&!fifo_full) begin
                    out_packet =  temp_packet_three; last_granted = 2; 
                end else if (temp_req_four&&!fifo_full) begin
                 out_packet = temp_packet_four; last_granted = 3; 
                end else if (temp_req_one&&!fifo_full) begin
                    out_packet = temp_packet_one; last_granted = 0; 
                end else if (temp_req_two&&!fifo_full) begin
                     out_packet = temp_packet_two; last_granted = 1; 
                end

                2'd2: if (temp_req_four&&!fifo_full) begin
                     out_packet = temp_packet_four; last_granted = 3;
                end else if (temp_req_one&&!fifo_full) begin
                     out_packet = temp_packet_one; last_granted = 0; 
                end else if (temp_req_two&&!fifo_full) begin
                    out_packet = temp_packet_two; last_granted = 1;
                end else if (temp_req_three&&!fifo_full) begin
                     out_packet = temp_packet_three; last_granted = 2; 
                end

                2'd3: if (temp_req_one&&!fifo_full) begin
                     out_packet = temp_packet_one; last_granted = 0;
                end else if (temp_req_two&&!fifo_full) begin
                     out_packet = temp_packet_two; last_granted = 1; 
                end else if (temp_req_three&&!fifo_full) begin
                     out_packet =temp_packet_three; last_granted = 2;
                end else if (temp_req_four&&!fifo_full) begin
                     out_packet = temp_packet_four; last_granted = 3; 
                end
            endcase
            wr_en=1;
        end
        else begin
          wr_en=0;
        end
    end
endmodule