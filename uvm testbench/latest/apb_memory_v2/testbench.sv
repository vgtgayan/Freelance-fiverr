//-------------------------------------------------------------------------
//			testbench.sv
//-------------------------------------------------------------------------
//---------------------------------------------------------------

//import uvm_pkg::*;
//`include "uvm_macros.svh"
//including interfcae and testcase files
`include "apb_interface.sv"
`include "apb_base_test.sv"
`include "apb_wr_rd_test.sv"
//---------------------------------------------------------------


module apb_tb_top;

  //---------------------------------------
  //clock and reset signal declaration
  //---------------------------------------
	bit clk;
  	bit resetn;
  
  //---------------------------------------
  //clock generation
  //---------------------------------------
	always #5 clk = ~clk;
  //---------------------------------------
  //reset Generation
  //---------------------------------------
  initial begin
    resetn = 1;
    #5 resetn =0;
  end  
  
  
  //---------------------------------------
  //interface instance
  //---------------------------------------
	apb_if intf(clk,resetn);
  
  //---------------------------------------
  //DUT instance
  //---------------------------------------
  apb_slave dut(.dif(intf));


  //---------------------------------------
  //passing the interface handle to lower heirarchy using set method 
  //and enabling the wave dump
  //---------------------------------------		
	initial begin
		uvm_config_db #(virtual apb_if)::set(uvm_root::get(),"*","vif",intf);
		//enable wave dump  
        $dumpfile("dump.vcd");
        $dumpvars(4,apb_tb_top);
	end
      

  //---------------------------------------
  //calling test
  //---------------------------------------
  initial begin 
    run_test();
  end
  
endmodule
