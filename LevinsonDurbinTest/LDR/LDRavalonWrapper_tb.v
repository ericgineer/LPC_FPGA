`timescale 1ns/1ns 

module LDRavalonWrapper_tb;
	
	reg clk, rst, read, write;
	reg [15:0] address;
	reg [15:0] writedata;
	wire [15:0] readdata;
	wire [7:0] led;

	LDRavalonWrapper LDR(.clk(clk),
						 .rst(rst),
						 .address(address),
						 .read(read),
						 .write(write),
						 .writedata(writedata),
						 .readdata(readdata),
						 .led(led));
						 
	initial
	begin
		clk <= 1'b0;
		rst <= 1'b0;
		read <= 1'b0;
		write <= 1'b0;
	end
						 
	always #10 clk = ~clk;
	
	initial
	begin
		writestuff(16'h0,  1);  // Reset
		writestuff(16'h0,  0);  // Clear reset
		writestuff(16'h30, 32767); // R0
		writestuff(16'h40, 25742); // R1
		writestuff(16'h50, 16169); // R2
		writestuff(16'h60, 9836);  // R3
		writestuff(16'h70, 4569);  // R4
		writestuff(16'h80, -2674); // R5
		writestuff(16'h90, -11249); // R6
		writestuff(16'hA0, -17338); // R7
		writestuff(16'hB0, -14853); // R8
		writestuff(16'hC0, -6828);  // R9
		writestuff(16'hD0, -3174);  // R10
		writestuff(16'h10, 1);		// Start
		writestuff(16'h10, 0); 		// Clear start
		
		// wait until the done register is asserted
		while (!readdata)
		begin
			readstuff(16'h20); // continuously read the done register
		end
		
		repeat(5) @(posedge clk);
		
		// Read out coefficient values
		
		readstuff(16'hE0); // A0
		readstuff(16'hF0); // A1
		readstuff(16'h110); // A2
		readstuff(16'h120); // A3
		readstuff(16'h130); // A4
		readstuff(16'h140); // A5
		readstuff(16'h150); // A6
		readstuff(16'h160); // A7
		readstuff(16'h170); // A8
		readstuff(16'h180); // A9
		readstuff(16'h190); // A10
		$finish;
	end
	
	task writestuff;
		input [15:0] addr;
		input signed [15:0] stuff;
		begin
			address <= addr;
			writedata <= stuff;
			write <= 1;
			@(posedge clk)
			write <= 0;
		end
	endtask
	
	task readstuff;
		input [15:0] addr;
		begin
			address <= addr;
			read <= 1;
			@(posedge clk)
			read <= 0;
		end
	endtask
endmodule