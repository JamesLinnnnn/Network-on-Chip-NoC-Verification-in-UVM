//Interface is not dynamic, not like class
interface Mesh_interface(input logic clk);

logic reset;

// For sending packet into the mesh (Driver)
logic [63:0] in_packet;   // send input packet
logic        si;          // send request
logic        ro;          // ready from DUT

// For receiving packet from the mesh (Monitor)
logic [63:0] out_packet;  // receive output packet
logic        so;          // send-out valid signal from DUT
logic        ri;          // ready-in signal to DUT (for monitor handshake)

// Optional: if you use polarity checking
logic        polarity;

assign ro = 1'b1;

endinterface: Mesh_interface