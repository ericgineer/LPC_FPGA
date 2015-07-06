module LinearPrediction (
		input wire         clk_clk                               //                  clk.clk
	);		
		// Stream interface
		wire		vout;
		wire [15:0] data;
		wire 		d_clk, d_rst;
		
		// LPC encode
		wire 		voiced, enc_vout;
		wire signed [15:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10;
		wire 		[15:0] freq_count;
		
		// LPC decode
		wire signed [15:0] synth;
		wire 			   dec_vout;
	
		LPC_qsys LPC(// Clock
					  .clk_clk(clk_clk),                  //                 clk.clk
				 
					 // Read master
					  .read_master_stream_d_out(data), //  read_master_stream.d_out
					  .read_master_stream_d_clk(d_clk), //                    .d_clk
					  .read_master_stream_vout(vout),  //                    .vout
					  .read_master_stream_d_rst(d_rst),
					  
					 // LPC encode
					  .lpcenc_v(vout),                     //              lpcenc.v
					  .lpcenc_voiced(voiced),                //                    .voiced
					  .lpcenc_a0(A0),                    //                    .a0
					  .lpcenc_a1(A1),                    //                    .a1
					  .lpcenc_a2(A2),                    //                    .a2
					  .lpcenc_a3(A3),                    //                    .a3
					  .lpcenc_a4(A4),                    //                    .a4
					  .lpcenc_a5(A5),                    //                    .a5
					  .lpcenc_a6(A6),                    //                    .a6
					  .lpcenc_a7(A7),                    //                    .a7
					  .lpcenc_a8(A8),                    //                    .a8
					  .lpcenc_a9(A9),                    //                    .a9
					  .lpcenc_a10(A10),                   //                    .a10
					  .lpcenc_vout(enc_vout),                  //                    .vout
					  .lpcenc_x(data),                     //                    .x
					  .lpcenc_d_clk(d_clk),                 //                    .d_clk
					  .lpcenc_freq_count(freq_count),
					  
					 // LPC decode
					  .lpcdec_v(enc_vout),                     //              lpcdec.v
					  .lpcdec_voiced(voiced),                //                    .voiced
					  .lpcdec_pulserate(freq_count),             //                    .pulserate
					  .lpcdec_lpcrate(16'd240),               //                    .lpcrate
					  .lpcdec_a0(A0),                    //                    .a0
					  .lpcdec_a1(A1),                    //                    .a1
					  .lpcdec_a2(A2),                    //                    .a2
					  .lpcdec_a3(A3),                    //                    .a3
					  .lpcdec_a4(A4),                    //                    .a4
					  .lpcdec_a5(A5),                    //                    .a5
					  .lpcdec_a6(A6),                    //                    .a6
					  .lpcdec_a7(A7),                    //                    .a7
					  .lpcdec_a8(A8),                    //                    .a8
					  .lpcdec_a9(A9),                    //                    .a9
					  .lpcdec_a10(A10),                   //                    .a10
					  .lpcdec_synth(synth),                 //                    .synth
					  .lpcdec_vout(dec_vout),
					 
					 // Write master 
					  .write_master_stream_d_in(synth), // write_master_stream.d_in
					  .write_master_stream_v(dec_vout),
					  .write_master_stream_d_in_clk(d_clk));     //                    .v
endmodule
