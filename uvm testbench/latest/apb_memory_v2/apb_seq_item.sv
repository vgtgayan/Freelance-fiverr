//-------------------------------------------------------------------------
//						apb_seq_item 
//-------------------------------------------------------------------------
import uvm_pkg::*;
`include "uvm_macros.svh"

class apb_seq_item extends uvm_sequence_item;
  //---------------------------------------
  //data and control fields
  //---------------------------------------
    rand bit pwrite;
    //rand bit presetn;
    //rand bit penable;
    //rand bit psel;
    rand bit [31:0] pwdata;
    randc bit [31:0] paddr;

    logic pready;
    logic [31:0] prdata;
  
    //static bit [31:0] previous_address = 0; 
    //static bit b =0;

  //cwcr '1' ->  only continous write or continous read operations;
  //cwcr '0' ->  one write , one read operations;
      
  //  static rand bit cwcr;
  //---------------------------------------
  //constraints
  //--------------------------------------- 
   // constraint adddd{paddr inside { 'h10,'h20,'h30,'h40,'h50};}
        constraint c1{paddr[31:0]>=32'd0; paddr[31:0] <32'd256;};
        constraint c2{pwdata[31:0]>=32'd0; pwdata[31:0] <32'd256;};
        constraint c3{pwrite inside {0,1}; };
    
  //constraint diff_address{ if(!b) paddr != previous_address ; else paddr == previous_address ;}
  /*  constraint diff_address{  if(cwcr)
            {
              if(b)  paddr != previous_address ;
            }
            else if(!cwcr)
            {
              if(!b) paddr != previous_address ; 
              else   paddr == previous_address ;
            }
          }
  */



  //---------------------------------------
  //Utility and Field macros
  //---------------------------------------
  `uvm_object_utils_begin(apb_seq_item)
    `uvm_field_int(pwrite,UVM_ALL_ON)
    //`uvm_field_int(presetn,UVM_ALL_ON)
    //`uvm_field_int(penable,UVM_ALL_ON)
    //`uvm_field_int(psel,UVM_ALL_ON)
    `uvm_field_int(pwdata,UVM_ALL_ON)
    `uvm_field_int(paddr,UVM_ALL_ON)
    `uvm_field_int(pready,UVM_ALL_ON)
    `uvm_field_int(prdata,UVM_ALL_ON)
  `uvm_object_utils_end
  
  //---------------------------------------
  //Constructor
  //---------------------------------------
  function new(string name = "apb_seq_item");
    super.new(name);
  endfunction
  //---------------------------------------
  //Post Randomize
  //---------------------------------------  
  /*
  function void post_randomize();
      previous_address = paddr;
      if(!b)  b++;
      else if(!cwcr) b = ~b;      
  endfunction
  */
    function string convert2string();
        return $psprintf("pwrite=%0h paddr=%0h pwdata=%0h ",pwrite,paddr,pwdata);
    endfunction

endclass
