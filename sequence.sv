class Mesh_reset_sequence extends uvm_sequence;

`uvm_object_utils(Mesh_reset_sequence)

//Send items to driver
Mesh_sequence_item reset_pkg;


function new(string name="Mesh_reset_sequence");
    super.new(name);
    `uvm_info("Reset_sequence", "In constructor", UVM_HIGH);
endfunction: new

task body();

    `uvm_info("Reset_sequence", "In body", UVM_HIGH);
    reset_pkg = Mesh_sequence_item::type_id::create("reset_pkg");
    start_item(reset_pkg);
    reset_pkg.reset = 1;
    finish_item(reset_pkg);

endtask: body

endclass: Mesh_reset_sequence


class Mesh_sequence extends Mesh_reset_sequence;

`uvm_object_utils(Mesh_sequence)

Mesh_sequence_item packet_pkg;
logic [3:0]source;
logic [3:0] dst_id;

function new(string name = "Mesh_sequence");
    super.new(name);
    `uvm_info("In Mesh Sequence", "In constructor", UVM_HIGH);
endfunction: new

task body();

`uvm_info("Mesh_sequence", "In body", UVM_HIGH);

// Loop over all destination IDs (0 to 15)
//for (logic [3:0] dst_id = 0; dst_id < 16; dst_id++) begin
    //if (dst_id == source) continue; // Skip sending to self

dst_id = 0;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 1;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 2;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 3;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 4;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 5;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 6;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 7;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 8;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 9;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 10;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 11;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 12;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 13;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 14;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

dst_id = 15;
if (dst_id != source) begin
    packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");
    start_item(packet_pkg);
    packet_pkg.reset = 0;
    packet_pkg.packet = packet_generator(source, dst_id);
    finish_item(packet_pkg);
end

 //   packet_pkg = Mesh_sequence_item::type_id::create("packet_pkg");

    // start_item(packet_pkg);

    // packet_pkg.reset = 0; // Not reset
    // dst_id = 0;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet

    // packet_pkg.reset = 0; // Not reset
    // dst_id = 1;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet

    // packet_pkg.reset = 0; // Not reset
    // dst_id = 2;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet

    // packet_pkg.reset = 0; // Not reset
    // dst_id = 3;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet

    // packet_pkg.reset = 0; // Not reset
    // dst_id = 4;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet
    
    // packet_pkg.reset = 0; // Not reset
    // dst_id = 5;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet
    
    // packet_pkg.reset = 0; // Not reset
    // dst_id = 6;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet
    
    // packet_pkg.reset = 0; // Not reset
    // dst_id = 7;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet

    // packet_pkg.reset = 0; // Not reset
    // dst_id = 8;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet
       
    // packet_pkg.reset = 0; // Not reset
    // dst_id = 9;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet
    
    // packet_pkg.reset = 0; // Not reset
    // dst_id = 10;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet
    
    // packet_pkg.reset = 0; // Not reset
    // dst_id = 11;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet
    
    // packet_pkg.reset = 0; // Not reset
    // dst_id = 12;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet

    // packet_pkg.reset = 0; // Not reset
    // dst_id = 13;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet

    // packet_pkg.reset = 0; // Not reset
    // dst_id = 14;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet

    // packet_pkg.reset = 0; // Not reset
    // dst_id = 15;
    // packet_pkg.packet = packet_generator(source, dst_id); // Build packet
                

    // finish_item(packet_pkg);
//end

endtask: body

// Packet generation function
function logic [63:0] packet_generator(logic [3:0] source_router, logic [3:0] dest_router);
    logic [1:0] src_x, src_y, dst_x, dst_y;
    logic [1:0] hop_x, hop_y;
    logic dir_x, dir_y;
    logic [63:0] packet;

    // (x,y) positions (4x4 mesh)
    src_x = source_router % 4;
    src_y = source_router / 4;
    dst_x = dest_router % 4;
    dst_y = dest_router / 4;

    // Compute hops
    hop_x = (src_x > dst_x) ? (src_x - dst_x) : (dst_x - src_x);
    hop_y = (src_y > dst_y) ? (src_y - dst_y) : (dst_y - src_y);

    // Direction bits
    dir_x = (hop_x == 0) ? 0 : (dst_x > src_x ? 0 : 1);
    dir_y = (hop_y == 0) ? 0 : (dst_y > src_y ? 0 : 1);

    // Build packet
    packet = 0;
    packet |= (0 & 1) << 63; // VC=0
    packet |= (src_x & 2'b11) << 61;
    packet |= (src_y & 2'b11) << 59;
    packet |= (dir_x & 1) << 58;
    packet |= (dir_y & 1) << 57;
    packet |= (hop_x & 2'b11) << 55;
    packet |= (hop_y & 2'b11) << 53;
    packet |= (dest_router & 4'hF); // Put destination PE ID in lowest bits

    return packet;
endfunction: packet_generator
endclass: Mesh_sequence