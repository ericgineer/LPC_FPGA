	LPC_qsys u0 (
		.clk_clk                  (<connected-to-clk_clk>),                  //                 clk.clk
		.memory_mem_a             (<connected-to-memory_mem_a>),             //              memory.mem_a
		.memory_mem_ba            (<connected-to-memory_mem_ba>),            //                    .mem_ba
		.memory_mem_ck            (<connected-to-memory_mem_ck>),            //                    .mem_ck
		.memory_mem_ck_n          (<connected-to-memory_mem_ck_n>),          //                    .mem_ck_n
		.memory_mem_cke           (<connected-to-memory_mem_cke>),           //                    .mem_cke
		.memory_mem_cs_n          (<connected-to-memory_mem_cs_n>),          //                    .mem_cs_n
		.memory_mem_dm            (<connected-to-memory_mem_dm>),            //                    .mem_dm
		.memory_mem_ras_n         (<connected-to-memory_mem_ras_n>),         //                    .mem_ras_n
		.memory_mem_cas_n         (<connected-to-memory_mem_cas_n>),         //                    .mem_cas_n
		.memory_mem_we_n          (<connected-to-memory_mem_we_n>),          //                    .mem_we_n
		.memory_mem_reset_n       (<connected-to-memory_mem_reset_n>),       //                    .mem_reset_n
		.memory_mem_dq            (<connected-to-memory_mem_dq>),            //                    .mem_dq
		.memory_mem_dqs           (<connected-to-memory_mem_dqs>),           //                    .mem_dqs
		.memory_mem_dqs_n         (<connected-to-memory_mem_dqs_n>),         //                    .mem_dqs_n
		.memory_mem_odt           (<connected-to-memory_mem_odt>),           //                    .mem_odt
		.oct_rzqin                (<connected-to-oct_rzqin>),                //                 oct.rzqin
		.read_master_stream_d_out (<connected-to-read_master_stream_d_out>), //  read_master_stream.d_out
		.read_master_stream_d_clk (<connected-to-read_master_stream_d_clk>), //                    .d_clk
		.read_master_stream_vout  (<connected-to-read_master_stream_vout>),  //                    .vout
		.status_local_init_done   (<connected-to-status_local_init_done>),   //              status.local_init_done
		.status_local_cal_success (<connected-to-status_local_cal_success>), //                    .local_cal_success
		.status_local_cal_fail    (<connected-to-status_local_cal_fail>),    //                    .local_cal_fail
		.write_master_stream_d_in (<connected-to-write_master_stream_d_in>), // write_master_stream.d_in
		.write_master_stream_v    (<connected-to-write_master_stream_v>)     //                    .v
	);

