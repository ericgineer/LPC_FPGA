module LinearPrediction (
		input wire         clk_clk                               //                  clk.clk
	);		
		// Stream interface
		wire		vout;
		wire [15:0] data;
	
		LPC_qsys (.clk_clk(clk_clk),                  //                 clk.clk
				  .read_master_stream_d_out(data), //  read_master_stream.d_out
				  .read_master_stream_d_clk(), //                    .d_clk
				  .read_master_stream_vout(vout),  //                    .vout
				  .write_master_stream_d_in(data), // write_master_stream.d_in
				  .write_master_stream_v(vout));     //                    .v
endmodule
