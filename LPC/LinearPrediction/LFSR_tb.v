`timescale 1ns/1ns

module LFSR_tb;
	reg clk;
	reg rst;
	
	wire [15:0] d_out;
	
	initial
	begin
		clk <= 1'b0;
		rst <= 1'b0;
	end
	
	always #10 clk <= ~clk;
	
    LFSR LFSR(.clk(clk),
			  .rst(rst),
			  .d_out(d_out));	
	
	initial
	begin
		repeat(3) @(posedge clk);
		rst <= 1'b1;
		@(posedge clk);
		rst <= 1'b0;
		repeat(1000) @(posedge clk);
		$stop;
	end
endmodule
