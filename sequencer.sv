class Mesh_sequencer extends uvm_sequencer #(Mesh_sequence_item);

`uvm_component_utils(Mesh_sequencer)

function new(string name = "Mesh_sequencer", uvm_component parent);
    super.new(name, parent);
     `uvm_info("SEQR_CLASS", "In constructor", UVM_HIGH)
endfunction: new

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     `uvm_info("SEQR_CLASS", "In build phase", UVM_HIGH)
endfunction: build_phase

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SEQR_CLASS", "In connect phase", UVM_HIGH)
endfunction: connect_phase

endclass: Mesh_sequencer 