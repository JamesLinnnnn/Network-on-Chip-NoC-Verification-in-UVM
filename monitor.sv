class Mesh_monitor extends uvm_monitor;

`uvm_component_utils(Mesh_monitor)

virtual Mesh_interface vif;
Mesh_sequence_item item;
Mesh_coverage cov;

 //Build port for scoreboard
uvm_analysis_port #(Mesh_sequence_item) monitor_port;

//Constructor
function new(string name = "Mesh_monitor", uvm_component parent);
    super.new(name, parent);
    `uvm_info("MONITOR_CLASS", "In constructor", UVM_HIGH)
endfunction: new

//Build Phase
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONITOR_CLASS", "In build phase", UVM_HIGH)


    monitor_port = new("monitor_port", this);
    cov = Mesh_coverage::type_id::create("cov", this); 


    //Get Interface
    if (!uvm_config_db#(virtual Mesh_interface)::get(this, "", "vif", vif)) begin
    `uvm_error("MONITOR_CLASS", $sformatf("Cannot get VIF for %s", get_full_name()))
end else begin
    `uvm_info("MONITOR_CLASS", $sformatf("VIF successfully set for %s", get_full_name()), UVM_LOW)
end

    // if(!(uvm_config_db #(virtual Mesh_interface)::get(this, "", "vif", vif)))begin
    //     `uvm_error("MONITOR_CLASS", "Cannot get the VIF from config DB!" )
    // end
endfunction: build_phase

//Connect Phase
function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MONITOR_CLASS", "In connect phase", UVM_HIGH)
endfunction: connect_phase

//Run Phase
task run_phase(uvm_phase phase);
    super.run_phase(phase);
     `uvm_info("MONITOR_CLASS", "In run phase", UVM_HIGH)


    //Start receive item from interface 
    forever begin
        item = Mesh_sequence_item::type_id::create("item");
        @(posedge vif.clk)
         //`uvm_info("MON", $sformatf("MON sending packet %h", vif.out_packet), UVM_LOW)
        //vif.ro <= 1;
        //if (vif.so && vif.ri) begin
        if (vif.so&&vif.reset==0&&vif.out_packet) begin
            // Always drive ready-in high
            item.packet=vif.out_packet;
            item.reset=vif.reset;
            item.polarity=vif.polarity;

            `uvm_info("MON", $sformatf("MON sending packet %h", vif.out_packet), UVM_LOW)

            cov.write(item);
            monitor_port.write(item);
        end
    end
endtask: run_phase
endclass: Mesh_monitor