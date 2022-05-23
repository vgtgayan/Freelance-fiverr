//-------------------------------------------------------------------------
//						apb_scoreboard
//-------------------------------------------------------------------------

class apb_scoreboard extends uvm_scoreboard;
  
  //---------------------------------------
  // declaring pkt_qu to store the pkt's recived from monitor
  //---------------------------------------
  apb_seq_item pkt_qu[$];
  
  //---------------------------------------
  // sc_apb 
  //---------------------------------------
  bit [31:0] sc_apb [0:255];

  //---------------------------------------
  //port to recive packets from monitor
  //---------------------------------------
  uvm_analysis_imp#(apb_seq_item, apb_scoreboard) item_collected_export;
  `uvm_component_utils(apb_scoreboard)

  //---------------------------------------
  // new - constructor
  //---------------------------------------
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
  //---------------------------------------
  // build_phase - create port and initialize local memory
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      item_collected_export = new("item_collected_export", this);
      foreach(sc_apb[i]) sc_apb[i] = i;
  endfunction: build_phase
  
  //---------------------------------------
  // write task - recives the pkt from monitor and pushes into queue
  //---------------------------------------
  virtual function void write(apb_seq_item pkt);
    //pkt.print();
    pkt_qu.push_back(pkt);
  endfunction : write

  //---------------------------------------
  // run_phase - compare's the read data with the expected data(stored in local memory)
  // local memory will be updated on the write operation.
  //---------------------------------------
  virtual task run_phase(uvm_phase phase);
    apb_seq_item apb_pkt;
    
    forever begin
      wait(pkt_qu.size() > 0);
      apb_pkt = pkt_qu.pop_front();
      
      if(apb_pkt.pwrite) begin
        sc_apb[apb_pkt.paddr] = apb_pkt.pwdata;
        `uvm_info(get_type_name(),$sformatf("------ :: WRITE DATA       :: ------"),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("Addr: %0h",apb_pkt.paddr),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("Data: %0h",apb_pkt.pwdata),UVM_LOW)
        `uvm_info(get_type_name(),"------------------------------------",UVM_LOW)        
      end
      //else if(apb_pkt.pwrite == 0) begin
     else begin
        if(sc_apb[apb_pkt.paddr] == apb_pkt.prdata) begin
          `uvm_info(get_type_name(),$sformatf("------ :: READ DATA Match :: ------"),UVM_LOW)
          `uvm_info(get_type_name(),$sformatf("Addr: %0h",apb_pkt.paddr),UVM_LOW)
          `uvm_info(get_type_name(),$sformatf("Expected Data: %0h Actual Data: %0h",sc_apb[apb_pkt.paddr],apb_pkt.prdata),UVM_LOW)
          `uvm_info(get_type_name(),"------------------------------------",UVM_LOW)
        end
        else begin
          `uvm_error(get_type_name(),"------ :: READ DATA MisMatch :: ------")
          `uvm_info(get_type_name(),$sformatf("Addr: %0h",apb_pkt.paddr),UVM_LOW)
          `uvm_info(get_type_name(),$sformatf("Expected Data: %0h Actual Data: %0h",sc_apb[apb_pkt.paddr],apb_pkt.prdata),UVM_LOW)
          `uvm_info(get_type_name(),"------------------------------------",UVM_LOW)
        end
      end
    end
  endtask : run_phase
  
endclass : apb_scoreboard
