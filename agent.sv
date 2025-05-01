class Mesh_agent extends uvm_agent;

`uvm_component_utils(Mesh_agent);

Mesh_sequencer seqr;
Mesh_driver drv;
Mesh_monitor mon;

function new(string name = "Mesh_agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info("AGNT_CLASS", "In constructor", UVM_HIGH)
endfunction: new

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     `uvm_info("AGNT_CLASS", "In build phase", UVM_HIGH) 

    seqr = Mesh_sequencer::type_id::create("seqr",this);
    mon = Mesh_monitor::type_id::create("mon", this);
    drv = Mesh_driver::type_id::create("drv", this);
endfunction: build_phase

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
     `uvm_info("AGNT_CLASS", "In connect phase", UVM_HIGH)

     //Connect sequencer and driver
    drv.seq_item_port.connect(seqr.seq_item_export);

endfunction: connect_phase

task run_phase(uvm_phase phase);
    super.run_phase(phase); 
     `uvm_info("AGNT_CLASS", "In run phase", UVM_HIGH)

endtask: run_phase
endclass: Mesh_agent