
module LPC_qsys (
	clk_clk,
	lpcdec_v,
	lpcdec_voiced,
	lpcdec_pulserate,
	lpcdec_lpcrate,
	lpcdec_a0,
	lpcdec_a1,
	lpcdec_a2,
	lpcdec_a3,
	lpcdec_a4,
	lpcdec_a5,
	lpcdec_a6,
	lpcdec_a7,
	lpcdec_a8,
	lpcdec_a9,
	lpcdec_a10,
	lpcdec_synth,
	lpcdec_vout,
	lpcenc_v,
	lpcenc_voiced,
	lpcenc_a0,
	lpcenc_a1,
	lpcenc_a2,
	lpcenc_a3,
	lpcenc_a4,
	lpcenc_a5,
	lpcenc_a6,
	lpcenc_a7,
	lpcenc_a8,
	lpcenc_a9,
	lpcenc_a10,
	lpcenc_vout,
	lpcenc_x,
	lpcenc_d_clk,
	lpcenc_readdata,
	read_master_stream_d_out,
	read_master_stream_d_clk,
	read_master_stream_vout,
	write_master_stream_d_in,
	write_master_stream_v);	

	input		clk_clk;
	input		lpcdec_v;
	input		lpcdec_voiced;
	input	[15:0]	lpcdec_pulserate;
	input	[15:0]	lpcdec_lpcrate;
	input	[15:0]	lpcdec_a0;
	input	[15:0]	lpcdec_a1;
	input	[15:0]	lpcdec_a2;
	input	[15:0]	lpcdec_a3;
	input	[15:0]	lpcdec_a4;
	input	[15:0]	lpcdec_a5;
	input	[15:0]	lpcdec_a6;
	input	[15:0]	lpcdec_a7;
	input	[15:0]	lpcdec_a8;
	input	[15:0]	lpcdec_a9;
	input	[15:0]	lpcdec_a10;
	output	[15:0]	lpcdec_synth;
	output		lpcdec_vout;
	input		lpcenc_v;
	output		lpcenc_voiced;
	output	[15:0]	lpcenc_a0;
	output	[15:0]	lpcenc_a1;
	output	[15:0]	lpcenc_a2;
	output	[15:0]	lpcenc_a3;
	output	[15:0]	lpcenc_a4;
	output	[15:0]	lpcenc_a5;
	output	[15:0]	lpcenc_a6;
	output	[15:0]	lpcenc_a7;
	output	[15:0]	lpcenc_a8;
	output	[15:0]	lpcenc_a9;
	output	[15:0]	lpcenc_a10;
	output		lpcenc_vout;
	input	[15:0]	lpcenc_x;
	input		lpcenc_d_clk;
	output	[15:0]	lpcenc_readdata;
	output	[15:0]	read_master_stream_d_out;
	output		read_master_stream_d_clk;
	output		read_master_stream_vout;
	input	[15:0]	write_master_stream_d_in;
	input		write_master_stream_v;
endmodule
