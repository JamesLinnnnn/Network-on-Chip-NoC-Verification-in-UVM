class Mesh_coverage extends uvm_subscriber#(Mesh_sequence_item);

`uvm_component_utils(Mesh_coverage)

rand bit reset;
rand bit [3:0]dest;

// Define Covergroup
covergroup cg;
    option.per_instance = 1;
    dest_address: coverpoint dest{
        bins router0 = {4'd0};
        bins router1 = {4'd1};
        bins router2 = {4'd2};
        bins router3 = {4'd3};
        bins router4 = {4'd4};
        bins router5 = {4'd5};
        bins router6 = {4'd6};
        bins router7 = {4'd7};
        bins router8 = {4'd8};
        bins router9 = {4'd9};
        bins router10 = {4'd10};
        bins router11 = {4'd11};
        bins router12 = {4'd12};
        bins router13 = {4'd13};
        bins router14 = {4'd14};
        bins router15 = {4'd15};
    } 

endgroup: cg

function new(string name = "Mesh_coverage", uvm_component parent=null);
    super.new(name, parent);
    cg = new();

endfunction: new

 function void write(Mesh_sequence_item t);
    dest = t.packet[3:0];
    reset = t.reset;
`uvm_info("COV", $sformatf("AGENT[%0s]: Packet = %h, dest = %0d, reset = %0b", get_full_name(), t.packet, dest, reset), UVM_LOW)

    cg.sample();

 endfunction:write
endclass: Mesh_coverage