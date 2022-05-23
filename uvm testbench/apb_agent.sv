//-------------------------------------------------------------------------
//						apb_agent 
//-------------------------------------------------------------------------

`include "apb_seq_item.sv"
`include "apb_sequencer.sv"
`include "apb_sequence.sv"
`include "apb_driver.sv"
`include "apb_monitor.sv"

class apb_agent extends uvm_agent;

  //---------------------------------------
  // component instances
  //---------------------------------------
  apb_driver    driver;
  apb_sequencer sequencer;
  apb_monitor   monitor;

  `uvm_component_utils(apb_agent)
  
  //---------------------------------------
  // constructor
  //---------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  //---------------------------------------
  // build_phase
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    monitor = apb_monitor::type_id::create("monitor", this);

    //creating driver and sequencer only for ACTIVE agent
    if(get_is_active() == UVM_ACTIVE) begin
      driver    = apb_driver::type_id::create("driver", this);
      sequencer = apb_sequencer::type_id::create("sequencer", this);
    end
  endfunction : build_phase
  
  //---------------------------------------  
  // connect_phase - connecting the driver and sequencer port
  //---------------------------------------
  function void connect_phase(uvm_phase phase);
    if(get_is_active() == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
  endfunction : connect_phase

endclass : apb_agent