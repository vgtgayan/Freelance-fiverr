//-------------------------------------------------------------------------
//						apb_write_read_test 
//-------------------------------------------------------------------------
class apb_wr_rd_test extends apb_model_base_test;

  `uvm_component_utils(apb_wr_rd_test)
  
  //---------------------------------------
  // sequence instance 
  //--------------------------------------- 
  wr_rd_sequence seq;

  //---------------------------------------
  // constructor
  //---------------------------------------
  function new(string name = "apb_wr_rd_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction : new

  //---------------------------------------
  // build_phase
  //---------------------------------------
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Create the sequence
    seq = wr_rd_sequence::type_id::create("seq");
  endfunction : build_phase
  
  //---------------------------------------
  // run_phase - starting the test
  //---------------------------------------
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
      seq.start(env.apb_agnt.sequencer);
    phase.drop_objection(this);
    
    //set a drain-time for the environment if desired
    phase.phase_done.set_drain_time(this, 50);
  endtask : run_phase
  
endclass : apb_wr_rd_test
