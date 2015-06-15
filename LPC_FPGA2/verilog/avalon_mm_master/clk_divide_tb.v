`timescale 1ns/1ns

module clk_divide_tb;
	reg clk;
	reg clk_rst;
	wire clk_out;
	wire clk_rst_out;
	
	clk_divide clk_divide(.clk(clk),
				          .clk_rst(clk_rst),
			              .clk_out(clk_out),
			              .clk_rst_out(clk_rst_out));
			   
	initial
	begin
		clk <= 1'b0;
		clk_rst <= 1'b0;
	end
	
	always #10 clk = ~clk;
	
	initial
	begin
		repeat(3) @(posedge clk);
		clk_rst <= 1'b1;
		@(posedge clk);
		clk_rst <= 1'b0;
		repeat(12500) @(posedge clk);
		$stop;
	end
endmodule
