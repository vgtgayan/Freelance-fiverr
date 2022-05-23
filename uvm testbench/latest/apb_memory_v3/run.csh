
#Compile
#vcs -ntb_opts uvm-1.1 -full64
vcs testbench.sv apb_slave.sv -sverilog -debug_access+all -lca -ntb_opts uvm-1.1 -full64 -timescale=1ns/1ns +vcs+flush+all +warn=all

#Simulation
simv +UVM_TESTNAME=apb_wr_rd_test
