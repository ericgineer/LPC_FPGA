module LinearPrediction (
		input wire         clk_clk,                               //                  clk.clk
		output wire [12:0] memory_mem_a,                          //               memory.mem_a
		output wire [2:0]  memory_mem_ba,                         //                     .mem_ba
		output wire [0:0]  memory_mem_ck,                         //                     .mem_ck
		output wire [0:0]  memory_mem_ck_n,                       //                     .mem_ck_n
		output wire [0:0]  memory_mem_cke,                        //                     .mem_cke
		output wire [0:0]  memory_mem_cs_n,                       //                     .mem_cs_n
		output wire [1:0]  memory_mem_dm,                         //                     .mem_dm
		output wire [0:0]  memory_mem_ras_n,                      //                     .mem_ras_n
		output wire [0:0]  memory_mem_cas_n,                      //                     .mem_cas_n
		output wire [0:0]  memory_mem_we_n,                       //                     .mem_we_n
		output wire        memory_mem_reset_n,                    //                     .mem_reset_n
		inout  wire [15:0] memory_mem_dq,                         //                     .mem_dq
		inout  wire [1:0]  memory_mem_dqs,                        //                     .mem_dqs
		inout  wire [1:0]  memory_mem_dqs_n,                      //                     .mem_dqs_n
		output wire [0:0]  memory_mem_odt,                        //                     .mem_odt
		input wire 		   oct_rzqin,                             //                  oct.rzqin
		output wire        status_local_init_done,                //               status.local_init_done
		output wire        status_local_cal_success,              //                     .local_cal_success
		output wire        status_local_cal_fail,                 //                     .local_cal_fail
	);
	
		// Avalon master control interface
		wire        avmm_master_control_rm_fixed_location, //  avmm_master_control.rm_fixed_location
		wire [31:0] avmm_master_control_rm_read_base,      //                     .rm_read_base
		wire [31:0] avmm_master_control_rm_read_length,    //                     .rm_read_length
		wire        avmm_master_control_rm_go,             //                     .rm_go
		wire        avmm_master_control_rm_done,           //                     .rm_done
		wire        avmm_master_control_wm_fixed_location, //                     .wm_fixed_location
		wire [31:0] avmm_master_control_wm_write_base,     //                     .wm_write_base
		wire [31:0] avmm_master_control_wm_write_length,   //                     .wm_write_length
		wire        avmm_master_control_wm_go,             //                     .wm_go
		wire        avmm_master_control_wm_done,           //                     .wm_done
		
		// Main clock
		wire        clk_clk,                               //                  clk.clk
		
		// Read master control
		wire        read_master_control_fixed_location,    //  read_master_control.fixed_location
		wire [31:0] read_master_control_read_base,         //                     .read_base
		wire [31:0] read_master_control_read_length,       //                     .read_length
		wire        read_master_control_go,                //                     .go
		wire        read_master_control_done,              //                     .done
		wire        read_master_control_early_done,        //                     .early_done

		// Write master control
		wire        write_master_control_fixed_location,   // write_master_control.fixed_location
		wire [31:0] write_master_control_write_base,       //                     .write_base
		wire [31:0] write_master_control_write_length,     //                     .write_length
		wire        write_master_control_go,               //                     .go
		wire        write_master_control_done,             //                     .done
		
		// Stream interface
		wire 		v;
		wire		vout;
		wire [15:0] data;
		
	
	
		top_LPC_FPGA LPC_FPGA(
		
			// Avalon master control interface
			.avmm_master_control_rm_fixed_location(avmm_master_control_rm_fixed_location), 	//  avmm_master_control.rm_fixed_location
			.avmm_master_control_rm_read_base(avmm_master_control_rm_read_base),      		//                     .rm_read_base
			.avmm_master_control_rm_read_length(avmm_master_control_rm_read_length),    	//                     .rm_read_length
			.avmm_master_control_rm_go(avmm_master_rm_go),            						//                     .rm_go
			.avmm_master_control_rm_done(avmm_master_control_rm_done),           			//                     .rm_done
			.avmm_master_control_wm_fixed_location(avmm_master_control_wm_fixed_location), 	//                     .wm_fixed_location
			.avmm_master_control_wm_write_base(avmm_master_control_wm_write_base),     		//                     .wm_write_base
			.avmm_master_control_wm_write_length(avmm_master_control_wm_write_length),   	//                     .wm_write_length
			.avmm_master_control_wm_go(avmm_master_control_wm_go),             				//                     .wm_go
			.avmm_master_control_wm_done(avmm_master_control_wm_done),          			//                     .wm_done
			
			// Main clock
			.clk_clk(clk_clk),                               								//                  clk.clk
			
			// DDR3 memory interface
			.memory_mem_a(memory_mem_a),                          							//               memory.mem_a
			.memory_mem_ba(memory_mem_ba),                         							//                     .mem_ba
			.memory_mem_ck(memory_mem_ck),                         							//                     .mem_ck
			.memory_mem_ck_n(memory_mem_ck_n),                       						//                     .mem_ck_n
			.memory_mem_cke(memory_mem_cke),                        						//                     .mem_cke
			.memory_mem_cs_n(memory_mem_cs_n),                       						//                     .mem_cs_n
			.memory_mem_dm(memory_mem_dm),                         							//                     .mem_dm
			.memory_mem_ras_n(memory_mem_ras_n),                     					    //                     .mem_ras_n
			.memory_mem_cas_n(memory_mem_cas_n),                      						//                     .mem_cas_n
			.memory_mem_we_n(memory_mem_we_n),                       						//                     .mem_we_n
			.memory_mem_reset_n(memory_mem_reset_n),                    					//                     .mem_reset_n
			.memory_mem_dq(memory_mem_dq),                         							//                     .mem_dq
			.memory_mem_dqs(memory_mem_dqs),                        						//                     .mem_dqs
			.memory_mem_dqs_n(memory_mem_dqs_n),                      						//                     .mem_dqs_n
			.memory_mem_odt(memory_mem_odt),                        						//                     .mem_odt
			.oct_rzqin(oct_rzqin),                             								//                  oct.rzqin
			.status_local_init_done(status_local_init_done),                				//               status.local_init_done
			.status_local_cal_success(tatus_local_cal_success),              				//                     .local_cal_success
			.status_local_cal_fail(status_local_cal_fail),                 					//                     .local_cal_fail
			
			// Read master control
			.read_master_control_fixed_location(avmm_master_control_rm_fixed_location),    	//  read_master_control.fixed_location
			.read_master_control_read_base(avmm_master_control_rm_read_base),         		//                     .read_base
			.read_master_control_read_length(avmm_master_control_rm_read_length),       	//                     .read_length
			.read_master_control_go(avmm_master_control_rm_go),                				//                     .go
			.read_master_control_done(avmm_master_control_rm_done),              			//                     .done
			.read_master_control_early_done(),        										//                     .early_done
			
			// Read master stream interface
			.read_master_stream_read_buffer(!v),        										//   read_master_stream.read_buffer
			.read_master_stream_buffer_output_data(data), 									//                     .buffer_output_data
			.read_master_stream_data_available(vout),     										//                     .data_available

			// Write master control
			.write_master_control_fixed_location(avmm_master_control_rm_fixed_location),   // write_master_control.fixed_location
			.write_master_control_write_base(avmm_master_control_wm_write_base),       	   //                     .write_base
			.write_master_control_write_length(avmm_master_control_wm_write_length),       //                     .write_length
			.write_master_control_go(avmm_master_control_wm_go),               			   //                     .go
			.write_master_control_done(avmm_master_control_done),             			   //                     .done
			
			// Write master stream interface
			.write_master_stream_write_buffer(vout),      									   //  write_master_stream.write_buffer
			.write_master_stream_buffer_input_data(data), 									   //                     .buffer_input_data
			.write_master_stream_buffer_full(v)        									   //                     .buffer_full
		);
endmodule
