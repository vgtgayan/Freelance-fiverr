//-------------------------------------------------------------------------
//						mem_agent - www.verificationguide.com 
//-------------------------------------------------------------------------

`include "mem_seq_item.sv"
`include "mem_sequencer.sv"
`include "mem_sequence.sv"
`include "mem_driver.sv"
`include "mem_monitor.sv"

class mem_agent extends uvm_agent;

  mem_driver    driver;
  mem_sequencer sequencer;
  mem_monitor   monitor;

  `uvm_component_utils(mem_agent)
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    monitor = mem_monitor::type_id::create("monitor", this);

    //creating driver and sequencer only for ACTIVE agent
    if(get_is_active() == UVM_ACTIVE) begin
      driver    = mem_driver::type_id::create("driver", this);
      sequencer = mem_sequencer::type_id::create("sequencer", this);
    end
  endfunction : build_phase
  function void connect_phase(uvm_phase phase);
    if(get_is_active() == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
  endfunction : connect_phase

endclass : mem_agent