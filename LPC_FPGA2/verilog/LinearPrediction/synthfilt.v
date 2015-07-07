`timescale 1ns/1ns

// LPC synthesis filter

module synthfilt(input wire clk,
				 input wire rst,
				 input wire 			  v,
				 input wire signed [15:0] x,
				 input wire signed [15:0] A0,
				 input wire signed [15:0] A1,
				 input wire signed [15:0] A2,
				 input wire signed [15:0] A3,
				 input wire signed [15:0] A4,
				 input wire signed [15:0] A5,
				 input wire signed [15:0] A6,
				 input wire signed [15:0] A7,
				 input wire signed [15:0] A8,
				 input wire signed [15:0] A9,
				 input wire signed [15:0] A10,
				 output reg signed [15:0] y,
				 output reg 			  vout);
				 
		reg signed [15:0] y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, x_tmp;
		reg signed [31:0] y1_tmp, y2_tmp, y3_tmp, y4_tmp, y5_tmp, y6_tmp, y7_tmp, y8_tmp, y9_tmp, y10_tmp;
		
		reg v1;
				 
		always @(posedge clk)
		begin
			if (rst)
			begin
				y  <= 16'b0;
				y1 <= 16'b0;
				y2 <= 16'b0;
				y3 <= 16'b0;
				y4 <= 16'b0;
				y5 <= 16'b0;
				y6 <= 16'b0;
				y7 <= 16'b0;
				y8 <= 16'b0;
				y9 <= 16'b0;
				y10 <= 16'b0;
				y1_tmp <= 16'b0;
				y2_tmp <= 16'b0;
				y3_tmp <= 16'b0;
				y4_tmp <= 16'b0;
				y5_tmp <= 16'b0;
				y6_tmp <= 16'b0;
				y7_tmp <= 16'b0;
				y8_tmp <= 16'b0;
				y9_tmp <= 16'b0;
				y10_tmp <= 16'b0;
				vout <= 1'b0;
				v1 <= 1'b0;
				x_tmp <= 1'b0;
				
			end
			if (v)
			begin
				y1_tmp <= y1 * (* multstyle = "dsp" *) A1;
				y2_tmp <= y2 * (* multstyle = "dsp" *) A2;
				y3_tmp <= y3 * (* multstyle = "dsp" *) A3;
				y4_tmp <= y4 * (* multstyle = "dsp" *) A4;
				y5_tmp <= y5 * (* multstyle = "dsp" *) A5;
				y6_tmp <= y6 * (* multstyle = "dsp" *) A6;
				y7_tmp <= y7 * (* multstyle = "dsp" *) A7; 
				y8_tmp <= y8 * (* multstyle = "dsp" *) A8;
				y9_tmp <= y9 * (* multstyle = "dsp" *) A9;
				y10_tmp <= y10 * (* multstyle = "dsp" *) A10;
				x_tmp <= x;
				v1 <= 1'b1;
			end else
				v1 <= 1'b0;
			if (v1)
			begin
				y <= (x_tmp - y1_tmp - y2_tmp - y3_tmp - y4_tmp - y5_tmp
					  - y6_tmp - y7_tmp - y8_tmp - y9_tmp - y10_tmp) >>> 14;
				vout <= 1'b1;
			end else
				vout <= 1'b0;
			if (v || v1 || vout)
			begin
				y1 <= x_tmp;
				y2 <= y1;
				y3 <= y2;
				y4 <= y3;
				y5 <= y4;
				y6 <= y5;
				y7 <= y6;
				y8 <= y7;
				y9 <= y8;
				y10 <= y9;
			end
		end
endmodule
			
				
				 
