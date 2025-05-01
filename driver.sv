class Mesh_driver extends uvm_driver #(Mesh_sequence_item);

`uvm_component_utils(Mesh_driver);

//We need interface and item here, please declare them here
virtual Mesh_interface  vif;
Mesh_sequence_item item;


//----------------------------------------
//Contructor
//----------------------------------------  
function new(string name = "Mesh_driver", uvm_component parent);
    super.new(name, parent);
    `uvm_info("DRIVER_CLASS", "In constructor", UVM_HIGH)
endfunction: new

//----------------------------------------
//Build Phase and get interface here ideally
//----------------------------------------  
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER_CLASS", "In build phase", UVM_HIGH)

    //Get Interface
    if (!uvm_config_db#(virtual Mesh_interface)::get(this, "", "vif", vif)) begin
    `uvm_error("DRIVER_CLASS", $sformatf("Cannot get VIF for %s", get_full_name()))
end else begin
    `uvm_info("DRIVER_CLASS", $sformatf("VIF successfully set for %s", get_full_name()), UVM_LOW)
end

    // if(!(uvm_config_db #(virtual Mesh_interface)::get(this, "", "vif", vif)))begin
    // `uvm_error("DRIVER_CLASS", "Cannot get the VIF from config DB!" )
    // end
endfunction: build_phase

//----------------------------------------
//Connect Phase
//----------------------------------------  
function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("DRIVER_CLASS", "In connect phase", UVM_HIGH)
endfunction: connect_phase



//----------------------------------------
//Run Phase
//----------------------------------------  
task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("DRIVER_CLASS", "In run phase", UVM_HIGH)

    forever begin
        item = Mesh_sequence_item::type_id::create("item");
        seq_item_port.get_next_item(item);
        //wait(vif.ro==1);
        drive(item);
        seq_item_port.item_done();
    end
endtask: run_phase


//----------------------------------------
//Drive 
//----------------------------------------
task drive(Mesh_sequence_item item);
    @(posedge vif.clk)
    vif.reset<=item.reset;
   // @(posedge vif.clk)
    vif.in_packet<=item.packet;
    vif.si<=1;
    // @(posedge vif.clk)
    // vif.si<=0;
        @(posedge vif.clk)
    vif.si <= 0;
endtask: drive
endclass: Mesh_driver