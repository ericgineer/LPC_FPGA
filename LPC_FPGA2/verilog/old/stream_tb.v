`timescale 1ns/1ns

module stream_tb;

	reg clk, rst;
	
	wire signed [15:0] source_readdata;
	wire 			   source_readdatavalid;
	wire			   source_waitrequest;
	wire 		[31:0] source_addr;
	wire 			   source_read;
	
	wire signed [15:0] sink_writedata;
	wire			   sink_waitrequest;
	wire 		[31:0] sink_addr;
	wire 			   sink_write;
	
	reg signed  [31:0] streamfromdram_writedata;
	wire signed [31:0] streamfromdram_readdata;
	reg			[1:0]  streamfromdram_addr;
	reg				   streamfromdram_read;
	reg				   streamfromdram_write;
	
	reg signed 	[31:0] writetodram_writedata;
	wire signed [31:0] writetodram_readdata;
	reg			[1:0]  writetodram_addr;
	reg				   writetodram_read;
	reg				   writetodram_write;
	
	wire signed [15:0] d_out;
	wire 			   vout;
	
	wire ddr_wait;
	
	integer i;
	
	ddr3_mem_sim readfromram(.ddr_readdata(source_readdata),
							 .ddr_readdatavalid(source_readdatavalid),
							 .ddr_waitrequest(source_waitrequest),
							 .ddr_addr(source_addr),
							 .ddr_read(source_read),
							 .ddr_write(1'b0),
							 .ddr_writedata(16'b0),
							 .clk(clk));
	
	streamfromdram read(//DDR3 Avalon-MM interface
						   .ddr_readdata(source_readdata),
						   .ddr_readdatavalid(source_readdatavalid),
						   .ddr_waitrequest(source_waitrequest || sink_waitrequest),
						   .ddr_addr(source_addr),
						   .ddr_read(source_read),
							  
							// Streamfromdram Avalon-MM interface
							.writedata(streamfromdram_writedata),
							.readdata(streamfromdram_readdata),
							.addr(streamfromdram_addr),
							.read(streamfromdram_read),
							.write(streamfromdram_write),
							  
							//Streaming output
							.d_out(d_out),
							.vout(vout),
							  
							//Clock and reset
							.clk(clk),
							.rst(rst));
							
	writetodram write(//DDR3 Avalon-MM interface
					  .ddr_waitrequest(sink_waitrequest),
					  .ddr_addr(sink_addr),
					  .ddr_write(sink_write),
					  .ddr_writedata(sink_writedata),
					
					  //writetodram Avalon-MM interface
					  .writedata(writetodram_writedata),
					  .readdata(writetodram_readdata),
					  .addr(writetodram_addr),
					  .read(writetodram_read),
				      .write(writetodram_write),
					
					  //Streaming output
					  .d_in(d_out),
					  .v(vout),
					  .ddr_wait(ddr_wait),
					  
					  //Clock and reset
					  .clk,
					  .rst);
							
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
	end
	
	initial
	begin
		// Load memory
		repeat(3) @(posedge clk);
		rst <= 1'b1;
		@(posedge clk);
		rst <= 1'b0;
		repeat(10) @(posedge clk);
		//Setup ddr streamfromdram
		streamfromdram_avmm_write(2'b00,0);  // Set initial address to 100
		streamfromdram_avmm_write(2'b01,256); // Set number of samples
		streamfromdram_avmm_write(2'b10,1);    // Set step size
		
		
		//Setup ddr writetodram
		writetodram_avmm_write(2'b00,0);  // Set initial address to 100
		writetodram_avmm_write(2'b01,256); // Set number of samples
		writetodram_avmm_write(2'b10,1);    // Set step size
		
		// Start streams
		writetodram_avmm_write(2'b11,1);    // Start
		streamfromdram_avmm_write(2'b11,1);    // Start
		
		repeat(400) @(posedge clk);
		$stop;
	end

	task streamfromdram_avmm_write;
		input [1:0] address;
		input [31:0] data;
		begin
			streamfromdram_writedata <= data;
			streamfromdram_addr <= address;
			streamfromdram_write <= 1'b1;
			@(posedge clk);
			streamfromdram_write <= 1'b0;
		end
	endtask
	
	task streamfromdram_avmm_read;
		input [1:0] address;
		begin
			streamfromdram_addr <= address;
			streamfromdram_read <= 1'b1;
			@(posedge clk);
			streamfromdram_read <= 1'b0;
		end
	endtask
	
	task writetodram_avmm_write;
		input [1:0] address;
		input [31:0] data;
		begin
			writetodram_writedata <= data;
			writetodram_addr <= address;
			writetodram_write <= 1'b1;
			@(posedge clk);
			streamfromdram_write <= 1'b0;
		end
	endtask
	
	task streamtodram_avmm_read;
		input [1:0] address;
		begin
			writetodram_addr <= address;
			writetodram_read <= 1'b1;
			@(posedge clk);
			writetodram_read <= 1'b0;
		end
	endtask
endmodule
