`timescale 1ns/1ns

module master_tb;

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
	
	reg signed  [15:0] master_read_writedata;
	wire signed [15:0] master_read_readdata;
	reg			[2:0]  master_read_addr;
	reg				   master_read_read;
	reg				   master_read_write;
	
	reg signed 	[15:0] master_write_writedata;
	wire signed [15:0] master_write_readdata;
	reg			[2:0]  master_write_addr;
	reg				   master_write_read;
	reg				   master_write_write;
	
	wire signed [15:0] d_out;
	wire 			   d_clk;
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
							  
							//Clock and reset
							.clk(clk),
							.rst(rst));
							
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
					  .d_in(d_out),
					  .v(vout),
					  
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
		master_read_avmm_write(3'h0,0);    // Set initial address to 0
		master_read_avmm_write(3'h1,256);  // Set number of samples
		master_read_avmm_write(3'h2,1);    // Set step size
		master_read_avmm_write(3'h3,4);	   // Set rate
		
		
		//Setup ddr master_write
		master_write_avmm_write(3'h0,0);  // Set initial address to 0
		master_write_avmm_write(3'h1,256); // Set number of samples
		master_write_avmm_write(3'h2,1);    // Set step size
		
		// Start streams
		master_write_avmm_write(3'h4,1);   // Start
		master_read_avmm_write(3'h4,1);    // Start
		while (master_read_readdata == 32'b0)
		begin
			master_read_avmm_read(3'h5); // Read master read done address untill asserted
		end
		repeat(50) @(posedge clk);
		master_read_avmm_write(3'h6,1);   // Reset read master
		master_write_avmm_write(3'h6,1);  // Reset write master
		repeat(50) @(posedge clk);
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
endmodule
