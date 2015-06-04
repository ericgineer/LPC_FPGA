`timescale 1ns/1ns

module LPCenc_tb;
	reg 		   start;
	reg signed [15:0]  x;
	wire 	   [15:0] freq_count;
	reg 	           clk, d_clk;
	reg 	           rst;
	reg v;
	
	reg [15:0] address;
	reg [15:0] writedata;
	wire [15:0] readdata;
	reg read, write;
	
	integer x_in, x_read, count;
	
	wire signed [15:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10;
	
	initial
	begin
		x		<= 16'b0;
		v    	<= 16'b0;
		clk   	<= 1'b0;
		d_clk   <= 1'b0;
		rst   	<= 16'b0;	
		x_read  <= $fopen("cross_seg.txt","r");
	end
	
	LPCenc LPC(.x(x),
			  .v(v),
			  .clk(clk),
			  .d_clk(d_clk),
			  .rst(rst),
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
			  .voiced(),
			  .freq_count(freq_count),
			  .address(address),
			  .read(read),
			  .write(write),
			  .writedata(writedata),
		      .readdata(readdata));
	
	
	always #10 clk = ~clk;  // 50 MHz clock
	
	always #62500 d_clk = ~d_clk; // data clock running at 8 kHz
	
	initial
	begin
		count <= 0;
		repeat(10) @(posedge clk);
		rst <= 1'b1;
		@(posedge d_clk)
		rst <= 1'b0;
		repeat(3) @(posedge clk);
		writestuff(16'h0,16'd240);
		repeat(10) @(posedge clk);
		while (count <= 240)
		begin
			v    <= 1'b1;
			x_in <= $fscanf(x_read,"%d\n",x);
			@(posedge d_clk)
			count <= count + 1;
		end
		x_in <= $rewind(x_read);
		while (count <= 486)
		begin
			v    <= 1'b1;
			x_in <= $fscanf(x_read,"%d\n",x);
			@(posedge d_clk)
			count <= count + 1;
		end
		v <= 1'b0;
		repeat(5) @(posedge d_clk);
		$stop;
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
