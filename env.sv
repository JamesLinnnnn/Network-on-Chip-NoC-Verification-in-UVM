class Mesh_env extends uvm_env;

`uvm_component_utils(Mesh_env);

//Both in the same hierachy
// 16 agents, 16 scoreboards
Mesh_agent agnt[16];
Mesh_scoreboard scb[16];

function new(string name  = "Mesh_env", uvm_component parent);
    super.new(name, parent);
     `uvm_info("ENV_CLASS", "In constructor", UVM_HIGH)
endfunction: new

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     `uvm_info("ENVC_CLASS", "IN Build Phase", UVM_HIGH)

        agnt[0] = Mesh_agent::type_id::create($sformatf("agnt[0]"), this);
        scb[0]  = Mesh_scoreboard::type_id::create($sformatf("scb[0]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[0].source = 0;

        agnt[1] = Mesh_agent::type_id::create($sformatf("agnt[1]"), this);
        scb[1]  = Mesh_scoreboard::type_id::create($sformatf("scb[1]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[1].source = 1;


        agnt[2] = Mesh_agent::type_id::create($sformatf("agnt[2]"), this);
        scb[2]  = Mesh_scoreboard::type_id::create($sformatf("scb[2]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[2].source = 2;

        agnt[3] = Mesh_agent::type_id::create($sformatf("agnt[3]"), this);
        scb[3]  = Mesh_scoreboard::type_id::create($sformatf("scb[3]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[3].source = 3;

        agnt[4] = Mesh_agent::type_id::create($sformatf("agnt[4]"), this);
        scb[4]  = Mesh_scoreboard::type_id::create($sformatf("scb[4]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[4].source = 4;

        agnt[5] = Mesh_agent::type_id::create($sformatf("agnt[5]"), this);
        scb[5]  = Mesh_scoreboard::type_id::create($sformatf("scb[5]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[5].source = 5;

        agnt[6] = Mesh_agent::type_id::create($sformatf("agnt[6]"), this);
        scb[6]  = Mesh_scoreboard::type_id::create($sformatf("scb[6]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[6].source = 6;

        agnt[7] = Mesh_agent::type_id::create($sformatf("agnt[7]"), this);
        scb[7]  = Mesh_scoreboard::type_id::create($sformatf("scb[7]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[7].source = 7;

        agnt[8] = Mesh_agent::type_id::create($sformatf("agnt[8]"), this);
        scb[8]  = Mesh_scoreboard::type_id::create($sformatf("scb[8]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[8].source = 8;

        agnt[9] = Mesh_agent::type_id::create($sformatf("agnt[9]"), this);
        scb[9]  = Mesh_scoreboard::type_id::create($sformatf("scb[9]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[9].source = 9;

        agnt[10] = Mesh_agent::type_id::create($sformatf("agnt[10]"), this);
        scb[10]  = Mesh_scoreboard::type_id::create($sformatf("scb[10]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[10].source = 10;

        agnt[11] = Mesh_agent::type_id::create($sformatf("agnt[11]"), this);
        scb[11]  = Mesh_scoreboard::type_id::create($sformatf("scb[11]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[11].source = 11;

        agnt[12] = Mesh_agent::type_id::create($sformatf("agnt[12]"), this);
        scb[12]  = Mesh_scoreboard::type_id::create($sformatf("scb[12]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[12].source = 12;

        agnt[13] = Mesh_agent::type_id::create($sformatf("agnt[13]"), this);
        scb[13]  = Mesh_scoreboard::type_id::create($sformatf("scb[13]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[13].source = 13;

        agnt[14] = Mesh_agent::type_id::create($sformatf("agnt[14]"), this);
        scb[14]  = Mesh_scoreboard::type_id::create($sformatf("scb[14]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[14].source = 14;

        agnt[15] = Mesh_agent::type_id::create($sformatf("agnt[15]"), this);
        scb[15]  = Mesh_scoreboard::type_id::create($sformatf("scb[15]"), this);
        // Assign source value (logic [3:0] type inside class)
        scb[15].source = 15;

    //  foreach(agnt[i])begin
    //     agnt[i] = Mesh_agent::type_id::create($sformatf("agnt[%0d]", i), this);
    //     scb[i]  = Mesh_scoreboard::type_id::create($sformatf("scb[%0d]", i), this);

    //     // Assign source value (logic [3:0] type inside class)
    //     scb[i].source = i;
    //  end

endfunction: build_phase

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV_CLASS", "In connect phase", UVM_HIGH)
    
    //agnt.mon.monitor_port.connect(scb.scoreboard_port);
    foreach (agnt[i]) begin
        agnt[i].mon.monitor_port.connect(scb[i].scoreboard_port);
    end
endfunction: connect_phase


task run_phase(uvm_phase phase);
    super.run_phase(phase);
endtask: run_phase


endclass: Mesh_env