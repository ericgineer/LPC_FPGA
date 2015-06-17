
module top_LPC_FPGA (
	algorithm_run_export,
	avmm_master_control_rm_fixed_location,
	avmm_master_control_rm_read_base,
	avmm_master_control_rm_read_length,
	avmm_master_control_rm_go,
	avmm_master_control_rm_done,
	avmm_master_control_wm_fixed_location,
	avmm_master_control_wm_write_base,
	avmm_master_control_wm_write_length,
	avmm_master_control_wm_go,
	avmm_master_control_wm_done,
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
	read_master_control_fixed_location,
	read_master_control_read_base,
	read_master_control_read_length,
	read_master_control_go,
	read_master_control_done,
	read_master_control_early_done,
	read_master_stream_read_buffer,
	read_master_stream_buffer_output_data,
	read_master_stream_data_available,
	status_local_init_done,
	status_local_cal_success,
	status_local_cal_fail,
	write_master_control_fixed_location,
	write_master_control_write_base,
	write_master_control_write_length,
	write_master_control_go,
	write_master_control_done,
	write_master_stream_write_buffer,
	write_master_stream_buffer_input_data,
	write_master_stream_buffer_full);	

	output		algorithm_run_export;
	output		avmm_master_control_rm_fixed_location;
	output	[31:0]	avmm_master_control_rm_read_base;
	output	[31:0]	avmm_master_control_rm_read_length;
	output		avmm_master_control_rm_go;
	input		avmm_master_control_rm_done;
	output		avmm_master_control_wm_fixed_location;
	output	[31:0]	avmm_master_control_wm_write_base;
	output	[31:0]	avmm_master_control_wm_write_length;
	output		avmm_master_control_wm_go;
	input		avmm_master_control_wm_done;
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
	input		read_master_control_fixed_location;
	input	[31:0]	read_master_control_read_base;
	input	[31:0]	read_master_control_read_length;
	input		read_master_control_go;
	output		read_master_control_done;
	output		read_master_control_early_done;
	input		read_master_stream_read_buffer;
	output	[15:0]	read_master_stream_buffer_output_data;
	output		read_master_stream_data_available;
	output		status_local_init_done;
	output		status_local_cal_success;
	output		status_local_cal_fail;
	input		write_master_control_fixed_location;
	input	[31:0]	write_master_control_write_base;
	input	[31:0]	write_master_control_write_length;
	input		write_master_control_go;
	output		write_master_control_done;
	input		write_master_stream_write_buffer;
	input	[15:0]	write_master_stream_buffer_input_data;
	output		write_master_stream_buffer_full;
endmodule
