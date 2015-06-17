`timescale 1ns/1ns

module streamfromdram_tb;

	reg clk, rst;
	
	reg signed [15:0] ddr_readdata;
	reg 			   ddr_readdatavalid;
	reg 			   ddr_waitrequest;
	wire 		[31:0] ddr_addr;
	wire 			   ddr_read;
	
	reg signed [31:0] writedata;
	wire signed [31:0] readdata;
	reg			[1:0]  addr;
	reg				   read;
	reg				   write;
	
	wire signed [31:0] d_out;
	wire 			   vout;
	
	reg [31:0] mem[0:32767];
	
	integer i;
	
	streamfromdram stream(//DDR3 Avalon-MM interface
						   .ddr_readdata(ddr_readdata),
						   .ddr_readdatavalid(ddr_readdatavalid),
						   .ddr_waitrequest(ddr_waitrequest),
						   .ddr_addr(ddr_addr),
						   .ddr_read(ddr_read),
							  
							// Streamfromdram Avalon-MM interface
							.writedata(writedata),
							.readdata(readdata),
							.addr(addr),
							.read(read),
							.write(write),
							  
							//Streaming output
							.d_out(d_out),
							.vout(vout),
							  
							//Clock and reset
							.clk(clk),
							.rst(rst));
					
	always #10 clk = ~clk;
	
	initial
	begin
		clk <= 1'b0;
		rst <= 1'b0;
		ddr_waitrequest <= 1'b0;
		ddr_readdata <= 16'b0;
		ddr_readdatavalid <= 1'b0;
		ddr_waitrequest <= 1'b0;
	end
	
	initial
	begin
		// Load memory
		repeat(3) @(posedge clk);
		rst <= 1'b1;
		@(posedge clk);
		rst <= 1'b0;
		repeat(3) @(posedge clk);
		for(i = 100; i < 3000; i = i + 1)
		begin
			mem[i] <= i;
			@(posedge clk);
		end
		repeat(10) @(posedge clk);
		//Setup ddr stream reader
		avmm_write(2'b00,100);  // Set initial address to 100
		avmm_write(2'b01,2900); // Set number of samples
		avmm_write(2'b10,1);    // Set step size
		avmm_write(2'b11,1);    // Start stream_length
		repeat(5000) @(posedge clk);
		$stop;
	end
	
	always @(posedge clk)
	begin
		if (ddr_read)
		begin
			ddr_readdata <= mem[ddr_addr];
			ddr_readdatavalid <= 1'b1;
		end
	end
		

	task avmm_write;
		input [1:0] address;
		input [31:0] data;
		begin
			writedata <= data;
			addr <= address;
			write <= 1'b1;
			@(posedge clk);
			write <= 1'b0;
		end
	endtask
	
	task avmm_read;
		input [1:0] address;
		begin
			addr <= address;
			read <= 1'b1;
			@(posedge clk);
			read <= 1'b0;
		end
	endtask
endmodule
