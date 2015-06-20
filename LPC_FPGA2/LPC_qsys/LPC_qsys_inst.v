	LPC_qsys u0 (
		.clk_clk                  (<connected-to-clk_clk>),                  //                 clk.clk
		.read_master_stream_d_out (<connected-to-read_master_stream_d_out>), //  read_master_stream.d_out
		.read_master_stream_d_clk (<connected-to-read_master_stream_d_clk>), //                    .d_clk
		.read_master_stream_vout  (<connected-to-read_master_stream_vout>),  //                    .vout
		.write_master_stream_d_in (<connected-to-write_master_stream_d_in>), // write_master_stream.d_in
		.write_master_stream_v    (<connected-to-write_master_stream_v>)     //                    .v
	);

