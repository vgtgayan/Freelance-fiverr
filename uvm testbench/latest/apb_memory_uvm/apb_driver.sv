//-------------------------------------------------------------------------
//						apb_driver
//-------------------------------------------------------------------------

`define DRIV_IF vif.DRIVER.driver_cb

class apb_driver extends uvm_driver #(apb_seq_item);

  //--------------------------------------- 
  // Virtual Interface
  //--------------------------------------- 
  virtual apb_if vif;
  `uvm_component_utils(apb_driver)
    
  //--------------------------------------- 
  // Constructor
  //--------------------------------------- 
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  //--------------------------------------- 
  // build phase
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif);

     //if(!uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif))
     //  `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase


function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    if (vif == null) begin
      `uvm_fatal("CFGERR", "Interface for Driver not set");
    end
endfunction: end_of_elaboration_phase


  //---------------------------------------  
  // run phase
  //---------------------------------------  
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive();
      seq_item_port.item_done();
    end
  endtask : run_phase
  
  //---------------------------------------
  // drive - transaction level to signal level
  // drives the value's from seq_item to interface signals
  //---------------------------------------
  virtual task drive();
    `DRIV_IF.pwrite <= 0;
    //`DRIV_IF.rd_en <= 0;
    @(posedge vif.pclk);
    
    `DRIV_IF.paddr <= req.paddr;
    
    if(req.pwrite) begin // write operation
      `DRIV_IF.pwrite <= req.pwrite;
      `DRIV_IF.pwdata <= req.pwdata;
      @(posedge vif.pclk);
    end
    else if(!(req.pwrite)) begin //read operation
      `DRIV_IF.pwrite <= req.pwrite;
      @(posedge vif.pclk);
      //`DRIV_IF.rd_en <= 0;
      @(posedge vif.pclk);
      req.prdata = `DRIV_IF.prdata;
    end
    
  endtask : drive
endclass : apb_driver
