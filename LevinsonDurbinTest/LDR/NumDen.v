`timescale 1ns/1ns

module NumDen(input wire signed [15:0] R_num0,
			  input wire signed [15:0] R_num1,
			  input wire signed [15:0] R_num2,
			  input wire signed [15:0] R_num3,
			  input wire signed [15:0] R_num4,
			  input wire signed [15:0] R_num5,
			  input wire signed [15:0] R_num6,
			  input wire signed [15:0] R_num7,
			  input wire signed [15:0] R_num8,
			  input wire signed [15:0] R_num9,
			  input wire signed [15:0] R_num10,
			  input wire signed [15:0] R_den0,
			  input wire signed [15:0] R_den1,
			  input wire signed [15:0] R_den2,
			  input wire signed [15:0] R_den3,
			  input wire signed [15:0] R_den4,
			  input wire signed [15:0] R_den5,
			  input wire signed [15:0] R_den6,
			  input wire signed [15:0] R_den7,
			  input wire signed [15:0] R_den8,
			  input wire signed [15:0] R_den9,
			  input wire signed [15:0] R_den10,
			  input wire signed [15:0] a0,
			  input wire signed [15:0] a1,
			  input wire signed [15:0] a2,
			  input wire signed [15:0] a3,
			  input wire signed [15:0] a4,
			  input wire signed [15:0] a5,
			  input wire signed [15:0] a6,
			  input wire signed [15:0] a7,
			  input wire signed [15:0] a8,
			  input wire signed [15:0] a9,
			  input wire signed [15:0] a10,
			  input wire 			 v,
			  input wire			 clk,
			  input wire			 rst,
			  output reg signed[31:0] Rn /* synthesis multstyle = "logic" */,
			  output reg signed[31:0] Rd /* synthesis multstyle = "logic" */,
			  output reg 			vout);
			  
	  always @(posedge clk)
	  begin
		if (rst)
		begin
			Rn <= 16'b0;
			Rd <= 16'b0;
			vout <= 1'b0;
		end else
		begin
			Rn <= R_num0 * a0 + R_num1 * a1 + R_num2 * a2 + R_num3 * a3 + R_num4 * a4 + R_num5 * a5 + R_num6 * a6 + R_num7 * a7 + R_num8 * a8 + R_num9 * a9 + R_num10 * a10;
			Rd <= R_den0 * a0 + R_den1 * a1 + R_den2 * a2 + R_den3 * a3 + R_den4 * a4 + R_den5 * a5 + R_den6 * a6 + R_den7 * a7 + R_den8 * a8 + R_den9 * a9 + R_den10 * a10;
			vout <= v;
		end
	end
endmodule
				