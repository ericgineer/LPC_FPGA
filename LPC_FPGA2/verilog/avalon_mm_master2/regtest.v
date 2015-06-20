`timescale 1ns/1ns

module regtest(input wire signed [31:0] writedata,
			   output reg signed [31:0] readdata,
			   input wire 		[2:0]  addr,
			   input wire 		  	   read,
			   input wire 			   write,
			   input wire 			   clk,
			   input wire 			   reset);
			   
		always @(posedge clk)
		begin
			if (read)
				readdata <= 32'hdeadbeef;
		end
endmodule
