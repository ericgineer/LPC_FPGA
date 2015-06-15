`timescale 1ns/1ns

module master_tb;
	
	reg clk, rst;
	
	// read master
	
	reg run;
	
	wire v, vout;
	wire [15:0] data;
	
	wire [31:0] rm_address;
	wire 		rm_read, rm_waitrequest;
	wire [3:0] rm_byteenable;
	wire [2:0] rm_burstcount;
	wire [15:0] rm_readdata;
	
	wire        rm_fixed_location;
	wire [31:0] rm_read_base;
	wire [31:0] rm_read_length;
	wire 		rm_start;
	wire 		rm_done;
	
	// write master_readdata
	
	wire wm_v, wm_vout;
	
	wire [31:0] wm_address;
	wire 		wm_write, wm_waitrequest;
	wire [3:0]  wm_byteenable;
	wire [2:0]  wm_burstcount;
	wire [15:0] wm_writedata;
	
	wire        wm_fixed_location;
	wire [31:0] wm_write_base;
	wire [31:0] wm_write_length;
	wire 		wm_start;
	wire 		wm_done;
	
	
	// Avalon control interface
	reg [3:0] avmm_address;
	reg 	   avmm_write;
	reg 	   avmm_read;
	reg [31:0] avmm_writedata;
	wire [31:0] avmm_readdata;
	

	ddr3_mem_sim ddr_read(.ddr_readdata(rm_readdata),
					      .ddr_readdatavalid(rm_readdatavalid),
					      .ddr_waitrequest(rm_waitrequest),
					      .ddr_addr(rm_address),
					      .ddr_read(rm_read),
						  .ddr_write(1'b0),
						  .ddr_writedata(16'b0),
						  .clk(clk));

	burst_read_master read(.clk(clk),
						   .reset(rst),

						   // control inputs and outputs
						   .control_fixed_location(rm_fixed_location),
						   .control_read_base(rm_read_base),
						   .control_read_length(rm_read_length),
						   .control_go(rm_start),
						   .control_done(rm_done),
						   .control_early_done(),
		
						   // user logic inputs and outputs
						   .user_read_buffer(!v && run),
						   .user_buffer_data(data),
						   .user_data_available(vout),
		
						   // master inputs and outputs
						   .master_address(rm_address),
						   .master_read(rm_read),
						   .master_byteenable(rm_byteenable),
						   .master_readdata(rm_readdata),
						   .master_readdatavalid(rm_readdatavalid),
						   .master_burstcount(rm_burstcount),
						   .master_waitrequest(rm_waitrequest));

	burst_write_master write(.clk(clk),
							 .reset(rst),
							
							 // control inputs and outputs
							 .control_fixed_location(wm_fixed_location),
							 .control_write_base(wm_write_base),
							 .control_write_length(wm_write_length),
							 .control_go(wm_start),
							 .control_done(wm_done),
							
							 // user logic inputs and outputs
							 .user_write_buffer(vout && run),
							 .user_buffer_data(data),
							 .user_buffer_full(v),
							
							 // master inputs and outputs
							 .master_address(wm_address),
							 .master_write(wm_write),
							 .master_byteenable(wm_byteenable),
							 .master_writedata(wm_writedata),
							 .master_burstcount(wm_burstcount),
							 .master_waitrequest(wm_waitrequest));
							 
	ddr3_mem_sim ddr_write(.ddr_readdata(),
					       .ddr_readdatavalid(),
					       .ddr_waitrequest(wm_waitrequest),
					       .ddr_addr(wm_address),
					       .ddr_read(1'b0),
						   .ddr_write(wm_write),
						   .ddr_writedata(wm_writedata),
						   .clk(clk));
						   
						   
	master_avalon_interface avmm(// Avalon read master control interface
								 .read_master_fixed_location(rm_fixed_location),
								 .read_master_read_base(rm_read_base),
								 .read_master_read_length(rm_read_length),
								 .read_master_go(rm_start),
								 .read_master_done(rm_done),
							   
								 // Avalon write master control interface
								 .write_master_fixed_location(wm_fixed_location),
								 .write_master_write_base(wm_write_base),
								 .write_master_write_length(wm_write_length),
								 .write_master_go(wm_start),
							     .write_master_done(wm_done),
							   
								 // clock and reset
								 .clk(clk),
								 .rst(rst),
							   
								 // Avalon interface
								 .address(avmm_address),
								 .write(avmm_write),
								 .read(avmm_read),
								 .writedata(avmm_writedata),
								 .readdata(avmm_readdata));
						   
	initial
	begin
		clk <= 1'b0;
		rst <= 1'b0;
		run <= 1'b0;
	end
	
	always #10 clk = ~clk;
	
	initial
	begin
		repeat(3) @(posedge clk);
		rst <= 1'b1;
		@(posedge clk)
		rst <= 1'b0;
		avalon_mm_write(32'h0,32'd0); // read master fixed location
		avalon_mm_write(32'h1,32'd0); // read master read base address
		avalon_mm_write(32'h2,32'd512); // read master read length
		avalon_mm_write(32'h5,32'd0); // write master fixed location
		avalon_mm_write(32'h6,32'd0); // write master write base
		avalon_mm_write(32'h7,32'd512); // write master write length
		@(posedge clk)
		avalon_mm_write(32'h8,32'd1); // write master start;
		repeat(10) @(posedge clk);
		avalon_mm_write(32'h3,32'd1); // read master start;
		repeat(20) @(posedge clk);
		run <= 1'b1;
		repeat(400) @(posedge clk);
		run <= 1'b0;
		$stop;
	end
	
	task avalon_mm_write;
		input [31:0] addr;
		input [31:0] data;
		begin
			avmm_address <= addr;
			avmm_writedata <= data;
			avmm_write <= 1'b1;
			@(posedge clk);
			avmm_write <= 1'b0;
			avmm_address <= 32'b0;
		end
	endtask
	
	task avalon_mm_read;
		input [31:0] addr;
		begin
			avmm_address <= addr;
			avmm_read <= 1'b1;
			@(posedge clk);
			avmm_read <= 1'b0;
		end
	endtask
endmodule
