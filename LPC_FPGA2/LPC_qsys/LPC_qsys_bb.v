
module LPC_qsys (
	clk_clk,
	read_master_stream_d_out,
	read_master_stream_d_clk,
	read_master_stream_vout,
	write_master_stream_d_in,
	write_master_stream_v);	

	input		clk_clk;
	output	[15:0]	read_master_stream_d_out;
	output		read_master_stream_d_clk;
	output		read_master_stream_vout;
	input	[15:0]	write_master_stream_d_in;
	input		write_master_stream_v;
endmodule
