`timescale 1ns/1ns


import uvm_pkg::*;
`include "uvm_macros.svh"

//Include my design module
`include "./design/routing_dir_E.sv"
`include "./design/routing_dir_S.sv"
`include "./design/routing_dir_N.sv"
`include "./design/routing_dir_W.sv"
`include "./design/routing_dir_PE.sv"
`include "./design/routing_dir_E.sv"
`include "./design/arbiter.sv"
`include "./design/FIFO_PE.sv"
`include "./design/FIFO.sv"
`include "./design/in_hand_shaking.sv"
`include "./design/out_hand_shaking.sv"
`include "./design/routing.sv"
`include "./design/router.sv"
`include "./design/gold_router.sv"
//The order of include files is very important
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "Mesh_coverage.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"


module top;

logic clk;
int i;


//Set Interface
Mesh_interface intf0 (.clk(clk));
Mesh_interface intf1 (.clk(clk));
Mesh_interface intf2 (.clk(clk));
Mesh_interface intf3 (.clk(clk));
Mesh_interface intf4 (.clk(clk));
Mesh_interface intf5 (.clk(clk));
Mesh_interface intf6 (.clk(clk));
Mesh_interface intf7 (.clk(clk));
Mesh_interface intf8 (.clk(clk));
Mesh_interface intf9 (.clk(clk));
Mesh_interface intf10(.clk(clk));
Mesh_interface intf11(.clk(clk));
Mesh_interface intf12(.clk(clk));
Mesh_interface intf13(.clk(clk));
Mesh_interface intf14(.clk(clk));
Mesh_interface intf15(.clk(clk));


mesh_4x4 uut(
    .clk(clk),
    .reset(intf0.reset), //We have issue on reset 4/29/2025
    .PE_0_in_packet(intf0.in_packet),
    .PE_1_in_packet(intf1.in_packet),
    .PE_2_in_packet(intf2.in_packet),
    .PE_3_in_packet(intf3.in_packet),
    .PE_4_in_packet(intf4.in_packet),
    .PE_5_in_packet(intf5.in_packet),
    .PE_6_in_packet(intf6.in_packet),
    .PE_7_in_packet(intf7.in_packet),
    .PE_8_in_packet(intf8.in_packet),
    .PE_9_in_packet(intf9.in_packet),
    .PE_10_in_packet(intf10.in_packet),
    .PE_11_in_packet(intf11.in_packet),
    .PE_12_in_packet(intf12.in_packet),
    .PE_13_in_packet(intf13.in_packet),
    .PE_14_in_packet(intf14.in_packet),
    .PE_15_in_packet(intf15.in_packet),

    .si_0_PE(intf0.si),
    .si_1_PE(intf1.si),
    .si_2_PE(intf2.si),
    .si_3_PE(intf3.si),
    .si_4_PE(intf4.si),
    .si_5_PE(intf5.si),
    .si_6_PE(intf6.si),
    .si_7_PE(intf7.si),
    .si_8_PE(intf8.si),
    .si_9_PE(intf9.si),
    .si_10_PE(intf10.si),
    .si_11_PE(intf11.si),
    .si_12_PE(intf12.si),
    .si_13_PE(intf13.si),
    .si_14_PE(intf14.si),
    .si_15_PE(intf15.si),

    .ro_0_PE(intf0.ro),
    .ro_1_PE(intf1.ro),
    .ro_2_PE(intf2.ro),
    .ro_3_PE(intf3.ro),
    .ro_4_PE(intf4.ro),
    .ro_5_PE(intf5.ro),
    .ro_6_PE(intf6.ro),
    .ro_7_PE(intf7.ro),
    .ro_8_PE(intf8.ro),
    .ro_9_PE(intf9.ro),
    .ro_10_PE(intf10.ro),
    .ro_11_PE(intf11.ro),
    .ro_12_PE(intf12.ro),
    .ro_13_PE(intf13.ro),
    .ro_14_PE(intf14.ro),
    .ro_15_PE(intf15.ro),

    .PE_0_out_packet(intf0.out_packet),
    .PE_1_out_packet(intf1.out_packet),
    .PE_2_out_packet(intf2.out_packet),
    .PE_3_out_packet(intf3.out_packet),
    .PE_4_out_packet(intf4.out_packet),
    .PE_5_out_packet(intf5.out_packet),
    .PE_6_out_packet(intf6.out_packet),
    .PE_7_out_packet(intf7.out_packet),
    .PE_8_out_packet(intf8.out_packet),
    .PE_9_out_packet(intf9.out_packet),
    .PE_10_out_packet(intf10.out_packet),
    .PE_11_out_packet(intf11.out_packet),
    .PE_12_out_packet(intf12.out_packet),
    .PE_13_out_packet(intf13.out_packet),
    .PE_14_out_packet(intf14.out_packet),
    .PE_15_out_packet(intf15.out_packet),

    .so_0_PE(intf0.so),
    .so_1_PE(intf1.so),
    .so_2_PE(intf2.so),
    .so_3_PE(intf3.so),
    .so_4_PE(intf4.so),
    .so_5_PE(intf5.so),
    .so_6_PE(intf6.so),
    .so_7_PE(intf7.so),
    .so_8_PE(intf8.so),
    .so_9_PE(intf9.so),
    .so_10_PE(intf10.so),
    .so_11_PE(intf11.so),
    .so_12_PE(intf12.so),
    .so_13_PE(intf13.so),
    .so_14_PE(intf14.so),
    .so_15_PE(intf15.so),

    .ri_0_PE(intf0.ri),
    .ri_1_PE(intf1.ri),
    .ri_2_PE(intf2.ri),
    .ri_3_PE(intf3.ri),
    .ri_4_PE(intf4.ri),
    .ri_5_PE(intf5.ri),
    .ri_6_PE(intf6.ri),
    .ri_7_PE(intf7.ri),
    .ri_8_PE(intf8.ri),
    .ri_9_PE(intf9.ri),
    .ri_10_PE(intf10.ri),
    .ri_11_PE(intf11.ri),
    .ri_12_PE(intf12.ri),
    .ri_13_PE(intf13.ri),
    .ri_14_PE(intf14.ri),
    .ri_15_PE(intf15.ri),

    .polarity_PE_0(intf0.polarity),
    .polarity_PE_1(intf1.polarity),
    .polarity_PE_2(intf2.polarity),
    .polarity_PE_3(intf3.polarity),
    .polarity_PE_4(intf4.polarity),
    .polarity_PE_5(intf5.polarity),
    .polarity_PE_6(intf6.polarity),
    .polarity_PE_7(intf7.polarity),
    .polarity_PE_8(intf8.polarity),
    .polarity_PE_9(intf9.polarity),
    .polarity_PE_10(intf10.polarity),
    .polarity_PE_11(intf11.polarity),
    .polarity_PE_12(intf12.polarity),
    .polarity_PE_13(intf13.polarity),
    .polarity_PE_14(intf14.polarity),
    .polarity_PE_15(intf15.polarity)
);

initial begin                   
    // The first parameter(null) plus the second parameter(*, every component) specify the path wherethis handle will be available
    //so those path are able to access the interface
    //the third argument means, totlaly four arguments here
    //Driver and monitor need virtual interface
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[0].drv", "vif", intf0);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[0].mon", "vif", intf0);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[1].drv", "vif", intf1);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[1].mon", "vif", intf1);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[2].drv", "vif", intf2);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[2].mon", "vif", intf2);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[3].drv", "vif", intf3);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[3].mon", "vif", intf3);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[4].drv", "vif", intf4);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[4].mon", "vif", intf4);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[5].drv", "vif", intf5);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[5].mon", "vif", intf5);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[6].drv", "vif", intf6);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[6].mon", "vif", intf6);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[7].drv", "vif", intf7);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[7].mon", "vif", intf7);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[8].drv", "vif", intf8);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[8].mon", "vif", intf8);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[9].drv", "vif", intf9);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[9].mon", "vif", intf9);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[10].drv", "vif", intf10);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[10].mon", "vif", intf10);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[11].drv", "vif", intf11);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[11].mon", "vif", intf11);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[12].drv", "vif", intf12);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[12].mon", "vif", intf12);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[13].drv", "vif", intf13);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[13].mon", "vif", intf13);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[14].drv", "vif", intf14);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[14].mon", "vif", intf14);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[15].drv", "vif", intf15);
    uvm_config_db#(virtual Mesh_interface)::set(null, "uvm_test_top.env.agnt[15].mon", "vif", intf15);

end


//--------------------------------------
// Start the test
//--------------------------------------
initial begin
    run_test("Mesh_test");
end

initial begin
    clk = 0;
    #5;
    forever begin
        clk = ~clk;
        #5;
    end
end

initial begin
    #100000000;
    $display("Finish due to too many clock cycles, please check design!\n");
    $finish;
end


endmodule: top
