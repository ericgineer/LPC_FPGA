`timescale 1ns/1ns

`define frame_rate 16'd240

`define base_address 16'd0

`define num_samples 16'd500

`define step_sise 16'd1

`define sample_rate 16'd6250

`define peak_threshold 16'd2000

module LPC_master_tb;

	reg clk, rst;
	
	wire signed [15:0] source_readdata;
	wire 			   source_readdatavalid;
	wire			   source_waitrequest;
	wire 		[15:0] source_addr;
	wire 			   source_read;
	
	wire signed [15:0] sink_writedata;
	wire			   sink_waitrequest;
	wire 		[15:0] sink_addr;
	wire 			   sink_write;
	
	reg         [15:0] master_read_writedata;
	wire        [15:0] master_read_readdata;
	reg			[2:0]  master_read_addr;
	reg				   master_read_read;
	reg				   master_read_write;
	
	reg signed 	[15:0] master_write_writedata;
	wire signed [15:0] master_write_readdata;
	reg			[2:0]  master_write_addr;
	reg				   master_write_read;
	reg				   master_write_write;
	
	reg signed 	[15:0] lpcenc_writedata;
	wire signed [15:0] lpcenc_readdata;
	reg			[3:0]  lpcenc_address;
	reg				   lpcenc_read;
	reg				   lpcenc_write;
	
	reg signed 	[15:0] lpcdec_writedata;
	wire signed [15:0] lpcdec_readdata;
	reg			[3:0]  lpcdec_address;
	reg				   lpcdec_read;
	reg				   lpcdec_write;
	
	wire signed [15:0] d_out;
	wire 			   d_clk;
	wire 			   vout;
	wire 			   d_rst;
	
	wire ddr_wait;
	
	wire signed [15:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10;
	wire signed [15:0] synth;
	wire 		[15:0] freq_count;
	wire 			   voiced, start_dec, stop_dec, dec_vout;
	
	integer i;
	
	ddr3_mem_sim readfromram(.ddr_readdata(source_readdata),
							 .ddr_readdatavalid(source_readdatavalid),
							 .ddr_waitrequest(source_waitrequest),
							 .ddr_addr(source_addr),
							 .ddr_read(source_read),
							 .ddr_write(1'b0),
							 .ddr_writedata(16'b0),
							 .clk(clk));
	
	      read_master read(//DDR3 Avalon-MM interface
						   .ddr_readdata(source_readdata),
						   .ddr_readdatavalid(source_readdatavalid),
						   .ddr_waitrequest(source_waitrequest || sink_waitrequest),
						   .ddr_addr(source_addr),
						   .ddr_read(source_read),
							  
							// master_read Avalon-MM interface
							.writedata(master_read_writedata),
							.readdata(master_read_readdata),
							.addr(master_read_addr),
							.read(master_read_read),
							.write(master_read_write),
							  
							//Streaming output
							.d_out(d_out),
							.d_clk(d_clk),
							.vout(vout),
							.d_rst(d_rst),
							  
							//Clock and reset
							.clk(clk),
							.rst(rst));
							
	LPCenc LPCenc(.x(d_out),
				  .v(vout),
				  .clk(clk),
				  .clk_rst(1'b0),
				  .d_clk(d_clk),
				  .rst(d_rst),
				  .A0(A0),
				  .A1(A1),
				  .A2(A2),
				  .A3(A3),
				  .A4(A4),
				  .A5(A5),
				  .A6(A6),
				  .A7(A7),
				  .A8(A8),
				  .A9(A9),
				  .A10(A10),
				  .voiced(voiced),
				  .freq_count(freq_count),
				  .start_dec(start_dec),
				  .stop_dec(stop_dec),
				  
				  // Avalon-MM interface
				  .avalon_clk(clk),
				  .address(lpcenc_address),
				  .read(lpcenc_read),
				  .write(lpcenc_write),
				  .writedata(lpcenc_writedata),
				  .readdata(lpcenc_readdata));
		      
	LPCdec LPCdec(.clk(d_clk),
				  .clk_rst(1'b0),
			      .rst(d_rst),
			      .start(start_dec),
			      .stop(stop_dec),
			      .voiced(voiced),
			      .pulserate(freq_count),
			      .A0(A0),
			      .A1(A1),
			      .A2(A2),
			      .A3(A3),
			      .A4(A4),
			      .A5(A5),
			      .A6(A6),
			      .A7(A7),
			      .A8(A8),
			      .A9(A9),
			      .A10(A10),
			      .synth(synth),
			      .vout(dec_vout),
			      
			      // Avalon-MM interface
			      .avalon_clk(clk),
			      .address(lpcdec_address),
				  .read(lpcdec_read),
				  .write(lpcdec_write),
				  .writedata(lpcdec_writedata),
				  .readdata(lpcdec_readdata));
							
	write_master write(//DDR3 Avalon-MM interface
					  .ddr_waitrequest(sink_waitrequest),
					  .ddr_addr(sink_addr),
					  .ddr_write(sink_write),
					  .ddr_writedata(sink_writedata),
					
					  //master_write Avalon-MM interface
					  .writedata(master_write_writedata),
					  .readdata(master_write_readdata),
					  .addr(master_write_addr),
					  .read(master_write_read),
				      .write(master_write_write),
					
					  //Streaming output
					  .d_in(synth),
					  .d_in_clk(d_clk),
					  .v(dec_vout),
					  
					  //Clock and reset
					  .clk(clk),
					  .rst(rst));
							
	ddr3_mem_sim   writetoram(.ddr_readdata(),
							 .ddr_readdatavalid(),
							 .ddr_waitrequest(sink_waitrequest),
							 .ddr_addr(sink_addr),
							 .ddr_read(),
							 .ddr_write(sink_write),
							 .ddr_writedata(sink_writedata),
							 .clk(clk));
					
	always #10 clk = ~clk;
	
	initial
	begin
		clk <= 1'b0;
		rst <= 1'b0;
		master_read_read <= 1'b0;
		master_write_read <= 1'b0;
	end
	
	initial
	begin
		// Load memory
		repeat(3) @(posedge clk);
		rst <= 1'b1;
		@(posedge clk);
		rst <= 1'b0;
		repeat(10) @(posedge clk);
		//Setup ddr master_read
		master_read_avmm_write(3'h0,`base_address);    // Set initial address to 0
		master_read_avmm_write(3'h1,`num_samples);  // Set number of samples
		master_read_avmm_write(3'h2,`step_sise);    // Set step size
		master_read_avmm_write(3'h3,`sample_rate);	   // Set lpc sample rate to 8000 Hz
		
		
		//Setup ddr master_write
		master_write_avmm_write(3'h0,`base_address);  // Set initial address to 0
		master_write_avmm_write(3'h1,`num_samples); // Set number of samples
		master_write_avmm_write(3'h2,`step_sise);    // Set step size
		master_write_avmm_write(3'h3,`sample_rate); // Set lpc sample rate to 8000 hz
		
		// Setup LPC encoder
		lpcenc_avmm_write(3'h0,`frame_rate); // Set LPC frame size (LPC rate)
		lpcenc_avmm_write(3'h1,`peak_threshold);  // Set LPC peak threshold
		
		// Setup LPC decoder
		lpcdec_avmm_write(3'h0,`frame_rate);
		
		// Start streams
		master_write_avmm_write(3'h4,1);   // Start
		master_read_avmm_write(3'h4,1);    // Start
		while (master_write_readdata == 32'b0)
		begin
			master_write_avmm_read(3'h5); // Read master write done address until asserted
		end
		repeat(50) @(posedge clk);
		master_read_avmm_write(3'h6,1);   // Reset read master
		master_write_avmm_write(3'h6,1);  // Reset write master
		repeat(100000) @(posedge clk);
		$stop;
	end

	task master_read_avmm_write;
		input [2:0] address;
		input [31:0] data;
		begin
			master_read_writedata <= data;
			master_read_addr <= address;
			master_read_write <= 1'b1;
			@(posedge clk);
			master_read_write <= 1'b0;
		end
	endtask
	
	task master_read_avmm_read;
		input [2:0] address;
		begin
			master_read_addr <= address;
			master_read_read <= 1'b1;
			@(posedge clk);
			master_read_read <= 1'b0;
		end
	endtask
	
	task master_write_avmm_write;
		input [2:0] address;
		input [31:0] data;
		begin
			master_write_writedata <= data;
			master_write_addr <= address;
			master_write_write <= 1'b1;
			@(posedge clk);
			master_write_write <= 1'b0;
		end
	endtask
	
	task master_write_avmm_read;
		input [2:0] address;
		begin
			master_write_addr <= address;
			master_write_read <= 1'b1;
			@(posedge clk);
			master_write_read <= 1'b0;
		end
	endtask
	
	task lpcenc_avmm_write;
		input [2:0] address;
		input [31:0] data;
		begin
			lpcenc_writedata <= data;
			lpcenc_address <= address;
			lpcenc_write <= 1'b1;
			@(posedge clk);
			lpcenc_write <= 1'b0;
		end
	endtask
	
	task lpcenc_avmm_read;
		input [2:0] address;
		begin
			lpcenc_address <= address;
			lpcenc_read <= 1'b1;
			@(posedge clk);
			lpcenc_read <= 1'b0;
		end
	endtask
	
	task lpcdec_avmm_write;
		input [2:0] address;
		input [31:0] data;
		begin
			lpcdec_writedata <= data;
			lpcdec_address <= address;
			lpcdec_write <= 1'b1;
			@(posedge clk);
			lpcdec_write <= 1'b0;
		end
	endtask
	
	task lpcdec_avmm_read;
		input [2:0] address;
		begin
			lpcdec_address <= address;
			lpcdec_read <= 1'b1;
			@(posedge clk);
			lpcdec_read <= 1'b0;
		end
	endtask
endmodule
