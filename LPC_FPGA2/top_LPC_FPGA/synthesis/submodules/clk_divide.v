`timescale 1ns/1ns

module clk_divide(input wire clk,
				  input wire clk_rst,
				  output reg clk_out,
				  output reg clk_rst_out);
				  
	   reg [11:0] count;
	   
	   always @(posedge clk)
	   begin
			if (clk_rst)
			begin
				count <= 12'b0;
				clk_out <= 1'b0;
				clk_rst_out <= 1'b1;
			end else
			begin
				if (count == 12'd3125)
				begin
					count <= 12'd0;
					clk_out <= ~clk_out;
					if (clk_rst_out == 1'b1)
						clk_rst_out <= 1'b0;
				end	else
					count <= count + 1;
			end
		end
endmodule
				
