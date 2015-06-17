
module LPC_qsys (
	clk_clk,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_dm,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	oct_rzqin,
	read_master_stream_d_out,
	read_master_stream_d_clk,
	read_master_stream_vout,
	status_local_init_done,
	status_local_cal_success,
	status_local_cal_fail,
	write_master_stream_d_in,
	write_master_stream_v);	

	input		clk_clk;
	output	[12:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output	[0:0]	memory_mem_ck;
	output	[0:0]	memory_mem_ck_n;
	output	[0:0]	memory_mem_cke;
	output	[0:0]	memory_mem_cs_n;
	output	[1:0]	memory_mem_dm;
	output	[0:0]	memory_mem_ras_n;
	output	[0:0]	memory_mem_cas_n;
	output	[0:0]	memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[15:0]	memory_mem_dq;
	inout	[1:0]	memory_mem_dqs;
	inout	[1:0]	memory_mem_dqs_n;
	output	[0:0]	memory_mem_odt;
	input		oct_rzqin;
	output	[15:0]	read_master_stream_d_out;
	output		read_master_stream_d_clk;
	output		read_master_stream_vout;
	output		status_local_init_done;
	output		status_local_cal_success;
	output		status_local_cal_fail;
	input	[15:0]	write_master_stream_d_in;
	input		write_master_stream_v;
endmodule
