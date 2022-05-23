//----------------------------------
//		  APB INTERFACE
//----------------------------------

	interface apb_if(input bit pclk,presetn);

		 logic pwrite;
		 //logic presetn;
		 logic penable;
		 logic psel;
		 logic [31:0] pwdata;
		 logic [31:0] paddr;

		logic pready;
		logic [31:0] prdata;
		//logic pslverr;

		clocking driver_cb@(posedge pclk);
			default input #1 output #0;
		 	output pwrite;
		 	//output presetn;
		 	output penable;
		 	output psel;
		 	output pwdata;
		 	output paddr;

			input pready;
			input prdata;
			//logic pslverr;
		endclocking

		clocking monitor_cb@(posedge pclk);
			default input #1 output #0;
		 	input pwrite;
		 	//input presetn;
		 	input penable;
		 	input psel;
		 	input pwdata;
		 	input paddr;

			input pready;
			input prdata;
			//logic pslverr;
		endclocking

        //clocking dut_cb@(posedge pclk);
		//	default input #1 output #0;
		// 	input pwrite;
		// 	//input presetn;
		// 	input penable;
		// 	input psel;
		// 	input pwdata;
		// 	input paddr;

		//	output pready;
		//	output prdata;
		//	//logic pslverr;
		//endclocking



        modport DRIVER (clocking driver_cb, input pclk,presetn);
		modport MONITOR (clocking monitor_cb, input pclk,presetn);
		modport DUT (output pready,prdata, input pclk,presetn,pwrite,penable,psel,pwdata,paddr);
          
	endinterface	
