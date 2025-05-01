class Mesh_sequence_item extends uvm_sequence_item;

`uvm_object_utils(Mesh_sequence_item);

//--------------------------
//Istantiation
//--------------------------
logic reset;
logic [63:0]packet;
logic polarity;

//Constrictor
function new(string name="Mesh_sequence_item");
    super.new(name);
endfunction:new

endclass: Mesh_sequence_item

