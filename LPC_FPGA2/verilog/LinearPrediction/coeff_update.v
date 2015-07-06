`timescale 1ns/1ns 

module coeff_update(input wire signed [31:0] aL_0,
					input wire signed [31:0] aL_1,
					input wire signed [31:0] aL_2,
					input wire signed [31:0] aL_3,
					input wire signed [31:0] aL_4,
					input wire signed [31:0] aL_5,
					input wire signed [31:0] aL_6,
					input wire signed [31:0] aL_7,
					input wire signed [31:0] aL_8,
					input wire signed [31:0] aL_9,
					input wire signed [31:0] aL_10,
					input wire signed [31:0] aR_0,
					input wire signed [31:0] aR_1,
					input wire signed [31:0] aR_2,
					input wire signed [31:0] aR_3,
					input wire signed [31:0] aR_4,
					input wire signed [31:0] aR_5,
					input wire signed [31:0] aR_6,
					input wire signed [31:0] aR_7,
					input wire signed [31:0] aR_8,
					input wire signed [31:0] aR_9,
					input wire signed [31:0] aR_10,
					input wire signed [15:0] k,
					input wire 				 v,
					input wire 				clk,
					input wire 				rst,
					output reg signed [15:0] a_next0,
					output reg signed [15:0] a_next1,
					output reg signed [15:0] a_next2,
					output reg signed [15:0] a_next3,
					output reg signed [15:0] a_next4,
					output reg signed [15:0] a_next5,
					output reg signed [15:0] a_next6,
					output reg signed [15:0] a_next7,
					output reg signed [15:0] a_next8,
					output reg signed [15:0] a_next9,
					output reg signed [15:0] a_next10,
					output reg 				 vout);
		
		reg signed [31:0] aL_0_tmp1, aL_0_tmp2;		
		reg signed [31:0] aL_1_tmp1, aL_1_tmp2;
		reg signed [31:0] aL_2_tmp1, aL_2_tmp2;
		reg signed [31:0] aL_3_tmp1, aL_3_tmp2;
		reg signed [31:0] aL_4_tmp1, aL_4_tmp2;
		reg signed [31:0] aL_5_tmp1, aL_5_tmp2;
		reg signed [31:0] aL_6_tmp1, aL_6_tmp2;
		reg signed [31:0] aL_7_tmp1, aL_7_tmp2;
		reg signed [31:0] aL_8_tmp1, aL_8_tmp2;
		reg signed [31:0] aL_9_tmp1, aL_9_tmp2;
		reg signed [31:0] aL_10_tmp1, aL_10_tmp2;
		
		reg signed [31:0] aR_0_tmp1, aR_0_tmp2;
		reg signed [31:0] aR_1_tmp1, aR_1_tmp2;
		reg signed [31:0] aR_2_tmp1, aR_2_tmp2;
		reg signed [31:0] aR_3_tmp1, aR_3_tmp2;
		reg signed [31:0] aR_4_tmp1, aR_4_tmp2;
		reg signed [31:0] aR_5_tmp1, aR_5_tmp2;
		reg signed [31:0] aR_6_tmp1, aR_6_tmp2;
		reg signed [31:0] aR_7_tmp1, aR_7_tmp2;
		reg signed [31:0] aR_8_tmp1, aR_8_tmp2;
		reg signed [31:0] aR_9_tmp1, aR_9_tmp2;
		reg signed [31:0] aR_10_tmp1, aR_10_tmp2;
		
		reg v1, v2;
		
		always @(posedge clk)
		begin
			if (rst)
			begin
				aL_0_tmp1 <= 0;
				aL_0_tmp2 <= 0;
				
				aL_1_tmp1 <= 0;
				aL_1_tmp2 <= 0;
				
				aL_2_tmp1 <= 0;
				aL_2_tmp2 <= 0;
				
				aL_3_tmp1 <= 0;
				aL_3_tmp2 <= 0;
				
				aL_4_tmp1 <= 0;
				aL_4_tmp2 <= 0;
				
				aL_5_tmp1 <= 0;
				aL_5_tmp2 <= 0;
				
				aL_6_tmp1 <= 0;
				aL_6_tmp2 <= 0;
				
				aL_7_tmp1 <= 0;
				aL_7_tmp2 <= 0;
				
				aL_8_tmp1 <= 0;
				aL_8_tmp2 <= 0;
				
				aL_9_tmp1 <= 0;
				aL_9_tmp2 <= 0;
				
				aL_10_tmp1 <= 0;
				aL_10_tmp2 <= 0;
				
				aR_0_tmp1 <= 0;
				aR_0_tmp2 <= 0;
				
				aR_1_tmp1 <= 0;
				aR_1_tmp2 <= 0;
				
				aR_2_tmp1 <= 0;
				aR_2_tmp2 <= 0;
				
				aR_3_tmp1 <= 0;
				aR_3_tmp2 <= 0;
				
				aR_4_tmp1 <= 0;
				aR_4_tmp2 <= 0;
				
				aR_5_tmp1 <= 0;
				aR_5_tmp2 <= 0;
				
				aR_6_tmp1 <= 0;
				aR_6_tmp2 <= 0;
				
				aR_7_tmp1 <= 0;
				aR_7_tmp2 <= 0;
				
				aR_8_tmp1 <= 0;
				aR_8_tmp2 <= 0;
				
				aR_9_tmp1 <= 0;
				aR_9_tmp2 <= 0;
				
				aR_10_tmp1 <= 0;
				aR_10_tmp2 <= 0;
				
				a_next0 <= 0;
				a_next1 <= 0;
				a_next2 <= 0;
				a_next3 <= 0;
				a_next4 <= 0;
				a_next5 <= 0;
				a_next6 <= 0;
				a_next7 <= 0;
				a_next8 <= 0;
				a_next9 <= 0;
				a_next10 <= 0;
				
				v1 <= 0;
				v2 <= 0;
				vout <= 0;
			end else
			begin
				if (v)
				begin
					aL_0_tmp1 <= aL_0 <<< 15;
					aL_1_tmp1 <= aL_1 <<< 15;
					aL_2_tmp1 <= aL_2 <<< 15;
					aL_3_tmp1 <= aL_3 <<< 15;
					aL_4_tmp1 <= aL_4 <<< 15;
					aL_5_tmp1 <= aL_5 <<< 15;
					aL_6_tmp1 <= aL_6 <<< 15;
					aL_7_tmp1 <= aL_7 <<< 15;
					aL_8_tmp1 <= aL_8 <<< 15;
					aL_9_tmp1 <= aL_9 <<< 15;
					aL_10_tmp1 <= aL_10 <<< 15;
					
					aR_0_tmp1 <= aR_0 * k;
					aR_1_tmp1 <= aR_1 * k;
					aR_2_tmp1 <= aR_2 * k;
					aR_3_tmp1 <= aR_3 * k;
					aR_4_tmp1 <= aR_4 * k;
					aR_5_tmp1 <= aR_5 * k;
					aR_6_tmp1 <= aR_6 * k;
					aR_7_tmp1 <= aR_7 * k;
					aR_8_tmp1 <= aR_8 * k;
					aR_9_tmp1 <= aR_9 * k;
					aR_10_tmp1 <= aR_10 * k;
					
					v1 <= v;
				end
				if (v1)
				begin
					aL_0_tmp2 <= aL_0_tmp1;
					aL_1_tmp2 <= aL_1_tmp1;
					aL_2_tmp2 <= aL_2_tmp1;
					aL_3_tmp2 <= aL_3_tmp1;
					aL_4_tmp2 <= aL_4_tmp1;
					aL_5_tmp2 <= aL_5_tmp1;
					aL_6_tmp2 <= aL_6_tmp1;
					aL_7_tmp2 <= aL_7_tmp1;
					aL_8_tmp2 <= aL_8_tmp1;
					aL_9_tmp2 <= aL_9_tmp1;
					aL_10_tmp2 <= aL_10_tmp1;
					
					aR_0_tmp2 <= aR_0_tmp1 + 16'h4000;
					aR_1_tmp2 <= aR_1_tmp1 + 16'h4000;
					aR_2_tmp2 <= aR_2_tmp1 + 16'h4000;
					aR_3_tmp2 <= aR_3_tmp1 + 16'h4000;
					aR_4_tmp2 <= aR_4_tmp1 + 16'h4000;
					aR_5_tmp2 <= aR_5_tmp1 + 16'h4000;
					aR_6_tmp2 <= aR_6_tmp1 + 16'h4000;
					aR_7_tmp2 <= aR_7_tmp1 + 16'h4000;
					aR_8_tmp2 <= aR_8_tmp1 + 16'h4000;
					aR_9_tmp2 <= aR_9_tmp1 + 16'h4000;
					aR_10_tmp2 <= aR_10_tmp1 + 16'h4000;
					
					v2 <= v1;
				end
				if (v2)
				begin
					a_next0 <= (aL_0_tmp2 + aR_0_tmp2) >>> 15;
					a_next1 <= (aL_1_tmp2 + aR_1_tmp2) >>> 15;
					a_next2 <= (aL_2_tmp2 + aR_2_tmp2) >>> 15;
					a_next3 <= (aL_3_tmp2 + aR_3_tmp2) >>> 15;
					a_next4 <= (aL_4_tmp2 + aR_4_tmp2) >>> 15;
					a_next5 <= (aL_5_tmp2 + aR_5_tmp2) >>> 15;
					a_next6 <= (aL_6_tmp2 + aR_6_tmp2) >>> 15;
					a_next7 <= (aL_7_tmp2 + aR_7_tmp2) >>> 15;
					a_next8 <= (aL_8_tmp2 + aR_8_tmp2) >>> 15;
					a_next9 <= (aL_9_tmp2 + aR_9_tmp2) >>> 15;
					a_next10 <= (aL_10_tmp2 + aR_10_tmp2) >>> 15;
					vout <= v2;
				end else
				begin
					vout <= 1'b0;
				end
			end
		end
endmodule