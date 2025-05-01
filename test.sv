class Mesh_test extends uvm_test;

`uvm_component_utils(Mesh_test);

Mesh_env env;

Mesh_reset_sequence reset_seq[16];
Mesh_sequence test_seq[16];
int i,j;
function new(string name = "Mesh_test", uvm_component parent);
    super.new(name, parent);
     `uvm_info("Test_CLASS", "In test constructor",UVM_HIGH)
endfunction: new

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Test_CLASS", "In Build Phase",UVM_HIGH)

    //Phase with env
     env = Mesh_env::type_id::create("env", this);
endfunction: build_phase

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
     `uvm_info("Test_CLASS", "In connect Phase",UVM_HIGH)

endfunction: connect_phase

task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("Test_CLASS", "In Run Phase",UVM_HIGH)

    phase.raise_objection(this);

    //Start sequence
    fork
    reset_seq[0] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[0]"));
    reset_seq[0].start(env.agnt[0].seqr);

    reset_seq[1] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[1]"));
    reset_seq[1].start(env.agnt[1].seqr);

    reset_seq[2] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[2]"));
    reset_seq[2].start(env.agnt[2].seqr);

    reset_seq[3] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[3]"));
    reset_seq[3].start(env.agnt[3].seqr);

    reset_seq[4] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[4]"));
    reset_seq[4].start(env.agnt[4].seqr);

    reset_seq[5] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[5]"));
    reset_seq[5].start(env.agnt[5].seqr);

    reset_seq[6] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[6]"));
    reset_seq[6].start(env.agnt[6].seqr);

    reset_seq[7] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[7]"));
    reset_seq[7].start(env.agnt[7].seqr);

    reset_seq[8] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[8]"));
    reset_seq[8].start(env.agnt[8].seqr);

    reset_seq[9] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[9]"));
    reset_seq[9].start(env.agnt[9].seqr);

    reset_seq[10] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[10]"));
    reset_seq[10].start(env.agnt[10].seqr);

    reset_seq[11] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[11]"));
    reset_seq[11].start(env.agnt[11].seqr);

    reset_seq[12] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[12]"));
    reset_seq[12].start(env.agnt[12].seqr);

    reset_seq[13] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[13]"));
    reset_seq[13].start(env.agnt[13].seqr);

    reset_seq[14] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[14]"));
    reset_seq[14].start(env.agnt[14].seqr);

    reset_seq[15] =  Mesh_reset_sequence::type_id::create($sformatf("reset_seq[15]"));
    reset_seq[15].start(env.agnt[15].seqr);
    #2;
    join
    #5;
    repeat(4)begin
        fork
            //test_seq = Mesh_sequence::type_id::create("test_seq");
            test_seq[0] = Mesh_sequence::type_id::create($sformatf("test_seq[0]"));
            test_seq[0].source = 0; // Set source router ID here
            test_seq[0].start(env.agnt[0].seqr); // start on corresponding agent's sequencer

            test_seq[1] = Mesh_sequence::type_id::create($sformatf("test_seq[1]"));
            test_seq[1].source = 1; // Set source router ID here
            test_seq[1].start(env.agnt[1].seqr); // start on corresponding agent's sequencer

            test_seq[2] = Mesh_sequence::type_id::create($sformatf("test_seq[2]"));
            test_seq[2].source = 2; // Set source router ID here
            test_seq[2].start(env.agnt[2].seqr); // start on corresponding agent's sequencer

            test_seq[3] = Mesh_sequence::type_id::create($sformatf("test_seq[3]"));
            test_seq[3].source = 3; // Set source router ID here
            test_seq[3].start(env.agnt[3].seqr); // start on corresponding agent's sequencer

            test_seq[4] = Mesh_sequence::type_id::create($sformatf("test_seq[4]"));
            test_seq[4].source = 4; // Set source router ID here
            test_seq[4].start(env.agnt[4].seqr); // start on corresponding agent's sequencer

            test_seq[5] = Mesh_sequence::type_id::create($sformatf("test_seq[5]"));
            test_seq[5].source = 5; // Set source router ID here
            test_seq[5].start(env.agnt[5].seqr); // start on corresponding agent's sequencer

            test_seq[6] = Mesh_sequence::type_id::create($sformatf("test_seq[6]"));
            test_seq[6].source = 6; // Set source router ID here
            test_seq[6].start(env.agnt[6].seqr); // start on corresponding agent's sequencer

            test_seq[7] = Mesh_sequence::type_id::create($sformatf("test_seq[7]"));
            test_seq[7].source = 7; // Set source router ID here
            test_seq[7].start(env.agnt[7].seqr); // start on corresponding agent's sequencer

            test_seq[8] = Mesh_sequence::type_id::create($sformatf("test_seq[8]"));
            test_seq[8].source = 8; // Set source router ID here
            test_seq[8].start(env.agnt[8].seqr); // start on corresponding agent's sequencer

            test_seq[9] = Mesh_sequence::type_id::create($sformatf("test_seq[9]"));
            test_seq[9].source = 9; // Set source router ID here
            test_seq[9].start(env.agnt[9].seqr); // start on corresponding agent's sequencer

            test_seq[10] = Mesh_sequence::type_id::create($sformatf("test_seq[10]"));
            test_seq[10].source = 10; // Set source router ID here
            test_seq[10].start(env.agnt[10].seqr); // start on corresponding agent's sequencer

            test_seq[11] = Mesh_sequence::type_id::create($sformatf("test_seq[11]"));
            test_seq[11].source = 11; // Set source router ID here
            test_seq[11].start(env.agnt[11].seqr); // start on corresponding agent's sequencer

            test_seq[12] = Mesh_sequence::type_id::create($sformatf("test_seq[12]"));
            test_seq[12].source = 12; // Set source router ID here
            test_seq[12].start(env.agnt[12].seqr); // start on corresponding agent's sequencer

            test_seq[13] = Mesh_sequence::type_id::create($sformatf("test_seq[13]"));
            test_seq[13].source = 13; // Set source router ID here
            test_seq[13].start(env.agnt[13].seqr); // start on corresponding agent's sequencer

            test_seq[14] = Mesh_sequence::type_id::create($sformatf("test_seq[14]"));
            test_seq[14].source = 14; // Set source router ID here
            test_seq[14].start(env.agnt[14].seqr); // start on corresponding agent's sequencer

            test_seq[15] = Mesh_sequence::type_id::create($sformatf("test_seq[15]"));
            test_seq[15].source = 15; // Set source router ID here
            test_seq[15].start(env.agnt[15].seqr); // start on corresponding agent's sequencer
            #1;
        join
    end
    #1000;


    phase.drop_objection(this);
endtask: run_phase



endclass: Mesh_test