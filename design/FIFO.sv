`timescale 1ns/1ns

module FIFO(
    input  clk,
    input  rst,
    input  wr_en, rd_en,
    input  [63:0]din,
    output [63:0]dout,
    output  empty, full
);

//wr_en should be controlled by arbiter
//rd_en should control handshaking
localparam ADDR_WIDTH = $clog2(8);

reg [ADDR_WIDTH:0] wptr, rptr; 
reg [63:0]fifo[0:7];

//Write Part
always@(posedge clk)begin
    if(rst)begin
        wptr<=0;
        rptr<=0;
        // for(i=0;i<8;i=+1)begin
        //     fifo[i]<=0;
        // end
    end
    else begin 
        if(wr_en && !full)begin
           fifo[wptr[ADDR_WIDTH-1:0]] <= din;
            wptr<=wptr+1;
        end
        if(rd_en && !empty)begin
            //dout <= fifo[rptr[ADDR_WIDTH-1:0]];
            rptr<=rptr+1;
        end
    end
end

// //Read Part
// always@(posedge clk)begin
//     if(rst)begin
        
//     end
//     else begin
//         if(rd_en && !empty)begin
//             rptr<=rptr+1;
//         end
//     end
// end



assign  empty  = (wptr==rptr);

// FIFO is full when:
// 1. wptr has completed one full cycle (MSB of wptr != MSB of rptr).
// 2. wptr's lower bits match rptr's lower bits (same memory location).
// This ensures one empty slot is reserved to distinguish full vs empty.
 assign full = (wptr[ADDR_WIDTH] != rptr[ADDR_WIDTH]) &&  // Check wrap-around using MSB
              (wptr[ADDR_WIDTH-1:0] == rptr[ADDR_WIDTH-1:0]); // Check address match

//assign dout = fifo[rptr[ADDR_WIDTH-1:0]];
assign dout = fifo[rptr[ADDR_WIDTH-1:0]];
endmodule

//assign full=((wptr-rptr)%8==0&&(wptr[3]!=rptr[3])?1:0;
//asiign depth =(wptr-rptr);
//assign data_out=mem[rptr%8];
