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
		output wire        status_local_cal_fail                  //                     .local_cal_fail
	);		
		// Stream interface
		wire		vout;
		wire [15:0] data;
	
		LPC_qsys LPC_qsys(// Main clock
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
							.status_local_cal_success(status_local_cal_success),              				//                     .local_cal_success
							.status_local_cal_fail(status_local_cal_fail),                 					//                     .local_cal_fail
							
							// Read master stream interface
							.read_master_stream_d_out(data), 													//  read_master_stream.d_out
							.read_master_stream_d_clk(), 													//                    .d_clk
							.read_master_stream_vout(vout),  													//                    .vout
			
							// Write master stream interface
							.write_master_stream_d_in(data), 													// write_master_stream.d_in
							.write_master_stream_v(vout));     													//                    .v
endmodule
