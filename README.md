## Platform: Modelsim
I run UVM code on ModelSim

## Compiling Testbench Files
Only need to compile `testbench.sv` and `gold_mesh_4x4.sv`.

## Setting Verbosity in ModelSim
You can set verbosity by running: 
 
```sh
vsim -sv_seed random +UVM_VERBOSITY=UVM_LOW -l Mesh_Transcript.log top
```
## Running functional coverage:
```sh
vsim -coverage -c top -sv_seed random
```
## After Open Coverage Simulation, Type 
`run -all` on Modelsim Transcript
## If you want to get coverage report, go to 
`tool >> coverage report >> text >> choose details >> ok`
