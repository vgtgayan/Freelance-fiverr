//-------------------------------------------------------------------------
//						apb_monitor
//-------------------------------------------------------------------------

class apb_monitor extends uvm_monitor;

  //---------------------------------------
  // Virtual Interface
  //---------------------------------------
  virtual apb_if vif;

  //---------------------------------------
  // analysis port, to send the transaction to scoreboard
  //---------------------------------------
  uvm_analysis_port #(apb_seq_item) item_collected_port;
  
  //---------------------------------------
  // The following property holds the transaction information currently
  // begin captured (by the collect_address_phase and data_phase methods).
  //---------------------------------------
  apb_seq_item trans_collected;

  `uvm_component_utils(apb_monitor)

  //---------------------------------------
  // new - constructor
  //---------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
    trans_collected = new();
    item_collected_port = new("item_collected_port", this);
  endfunction : new

  //---------------------------------------
  // build_phase - getting the interface handle
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif);
    if(!uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase
 
//function void end_of_elaboration_phase(uvm_phase phase);
//    super.end_of_elaboration_phase(phase);
//    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
//
// 
//
//    if (vif == null) begin
//      `uvm_fatal("CFGERR", "Interface for Driver not set");
//    end
//endfunction: end_of_elaboration_phase


  //---------------------------------------
  // run_phase - convert the signal level activity to transaction level.
  // i.e, sample the values on interface signal ans assigns to transaction class fields
  //---------------------------------------
  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.pclk);
      wait(vif.monitor_cb.pwrite);
        trans_collected.paddr = vif.monitor_cb.paddr;
      if(vif.monitor_cb.pwrite) begin
        trans_collected.pwrite = vif.monitor_cb.pwrite;
        trans_collected.pwdata = vif.monitor_cb.pwdata;
        @(posedge vif.pclk);
      end
      else begin
        trans_collected.pwrite = vif.monitor_cb.pwrite;
        @(posedge vif.pclk);
        @(posedge vif.pclk);
        trans_collected.prdata = vif.monitor_cb.prdata;
      end
	  item_collected_port.write(trans_collected);
      end 
  endtask : run_phase

endclass : apb_monitor

