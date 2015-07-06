`timescale 1ns/1ns

module freq_est_tb;
	reg signed [15:0] x, threshold;
	reg 			  freq_est_v, peak_find_v;
	reg 		      clk;
	reg 			  rst;
	wire 	   [15:0] count;
	wire signed [15:0] peak;
	wire			  freq_est_vout, peak_find_vout;
	
	integer x_in, x_read;
	
	initial
	begin
		x		<= 16'b0;
		threshold <= 16'd0;
		freq_est_v <= 16'b0;
		peak_find_v <= 16'b0;
		clk   	<= 1'b0;
		rst   	<= 16'b0;	
		x_read  <= $fopen("cross_seg2.txt","r");
	end
	
	always #1 clk = ~clk;
	
	peak_find peak_find(.x(x),
						.v(peak_find_v),
						.clk(clk),
						.rst(rst),
						.peak(peak),
						.vout(peak_find_vout));


	freq_est freq_est(.x(x),
					 .threshold(threshold),
					 .v(freq_est_v),
					 .clk(clk),
					 .rst(rst),
					 .count(count),
					 .vout(freq_est_vout));
			 
	initial
	begin
		repeat(5) @(posedge clk);
		rst <= 1'b1;
		@(posedge clk);
		rst <= 1'b0;
		repeat(5) @(posedge clk);
		while (!$feof(x_read))
		begin
			peak_find_v    <= 1'b1;
			x_in <= $fscanf(x_read,"%d\n",x);
			@(posedge clk);
		end
		peak_find_v <= 1'b0;
		x_in <= $rewind(x_read);
		@(posedge clk);
		threshold <= peak >>> 2;
		while (!$feof(x_read))
		begin
			freq_est_v    <= 1'b1;
			x_in <= $fscanf(x_read,"%d\n",x);
			@(posedge clk);
		end
		freq_est_v <= 1'b0;
		repeat(5) @(posedge clk);
		$stop;
	end
endmodule
