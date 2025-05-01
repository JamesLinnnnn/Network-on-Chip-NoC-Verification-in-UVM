class Mesh_scoreboard extends uvm_scoreboard;

`uvm_component_utils(Mesh_scoreboard)

logic [3:0]source;
int counter;
//Received port with monitor
uvm_analysis_imp #(Mesh_sequence_item, Mesh_scoreboard) scoreboard_port;
Mesh_sequence_item transactions[$];


//Constructor
function new(string name = "Mesh_scoreboard", uvm_component parent);
    super.new(name, parent);
     `uvm_info("SCOREBOARD_CLASS", "In constructor", UVM_HIGH)
     counter = 0;
endfunction: new


//Build Phase
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     `uvm_info("SCOREBOARD_CLASS", "In build phase", UVM_HIGH)

    scoreboard_port = new("scoreboard_port", this);
endfunction: build_phase

//Connect Phase
function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
     `uvm_info("SCOREBOARD_CLASS", "In connect phase", UVM_HIGH)

endfunction: connect_phase


//-------------------------
//Write Method to determine what is happen when monitor sends item to scoreboard
//-------------------------
function void write(Mesh_sequence_item item);
    //Save all packets
    transactions.push_back(item);

endfunction:write


//Run Phase
task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SCOREBOARD_CLASS", "In run phase", UVM_HIGH)

    forever begin
        //get the packet
        //generate the expected value and compare with actual value
    // score the transactions accordingly
        Mesh_sequence_item current_trans;
        wait((transactions.size()!=0));
        //Like FIFO, first in first out
        current_trans = transactions.pop_front();
        compare(current_trans);
    end
endtask: run_phase



function void compare(Mesh_sequence_item item);
    logic [3:0]expected_value = item.packet[3:0];
    if(expected_value != this.source)begin
        `uvm_error("COMPARE", $sformatf("Receive wrong packet!!! Actual = %d, Expected = %d", item.packet[3:0], this.source))
    end
    else begin
       counter = counter+1;
       if(counter == 32'd60)begin
            `uvm_info("COMPARE", $sformatf("Router %0d: No Errors after receiving 60 packets", this.source), UVM_LOW)
        end
    end
endfunction: compare

endclass: Mesh_scoreboard