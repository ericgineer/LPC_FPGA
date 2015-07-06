`timescale 1ns/1ns

module freq_est(input wire signed [15:0] x,
				input wire signed [15:0] threshold,
				input wire 		  v,
				input wire 		  clk,
				input wire 		  rst,
				output reg [15:0] count,
				output reg 		  vout);
				
		reg signed [15:0] x0, x1, x2;
		reg v0, v1, v2;
		
		always @(posedge clk)
		begin
			if (rst)
			begin
				x0 <= 16'b0;
				x1 <= 16'b0;
				x2 <= 16'b0;
				count <= 16'b0;
				vout <= 1'b0;
			end
			if (v)
			begin
				x0 <= x;
				v0 <= v;
			end else
				v0 <= 1'b0;
			if (v0)
			begin
				x1 <= x0;
				v1 <= 1'b1;
			end else
				v1 <= 1'b0;
			if (v1)
			begin
				x2 <= x1;
				v2 <= 1'b1;
			end else
				v2 <= 1'b0;
			if (v2)
			begin
				if ((x2 < -threshold) && (x0 > threshold))
					count <= count + 1;
				else
					count <= count;
				vout <= v2;
			end else
				vout <= 1'b0;
		end
endmodule
