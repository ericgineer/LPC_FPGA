`timescale 10ns/10ns

module peak_find(input wire signed [15:0] x,
				 input wire 	   v,
				 input wire 	   clk,
				 input wire 	   rst,
				 output reg signed [15:0] peak,
				 output reg 	   vout);
				 
		always @(posedge clk)
		begin
			if (rst)
			begin
				vout <= 1'b0;
				peak <= 16'b0;
			end
			if (v)
			begin
				if (x > peak)
					peak <= x;
				else
					peak <= peak;
				vout <= 1'b1;
			end else
				vout <= 1'b0;
		end
endmodule
			
