`timescale 1ns/1ns

module correlation(input wire signed [15:0] x,
				   input wire signed [15:0] y,
				   input wire 		        v,
				   input wire 			  clk,
				   input wire 			  rst,
				   output reg signed [15:0] R0,
				   output reg signed [15:0] R1,
				   output reg signed [15:0] R2,
				   output reg signed [15:0] R3,
				   output reg signed [15:0] R4,
				   output reg signed [15:0] R5,
				   output reg signed [15:0] R6,
				   output reg signed [15:0] R7,
				   output reg signed [15:0] R8,
				   output reg signed [15:0] R9,
				   output reg signed [15:0] R10,
				   output reg 		       vout);
				   
		reg signed [15:0] d1, d2, d3, d4, d5, d6, d7, d8, d9, d10;
		reg signed [31:0] m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10;
		reg               v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12;
		reg signed  [47:0] add0, add1, add2, add3, add4, add5, add6, add7, add8, add9, add10;
		
		always @(posedge clk)
		begin
			if (rst)
			begin
				d1 <= 16'b0;
				d2 <= 16'b0;
				d3 <= 16'b0;
				d4 <= 16'b0;
				d5 <= 16'b0;
				d6 <= 16'b0;
				d7 <= 16'b0;
				d8 <= 16'b0;
				d9 <= 16'b0;
				d10 <= 16'b0;
				
				m0 <= 32'b0;
				m1 <= 32'b0;
				m2 <= 32'b0;
				m3 <= 32'b0;
				m4 <= 32'b0;
				m5 <= 32'b0;
				m6 <= 32'b0;
				m7 <= 32'b0;
				m8 <= 32'b0;
				m9 <= 32'b0;
				m10 <= 32'b0;
				
				add0 <= 48'b0;
				add1 <= 48'b0;
				add2 <= 48'b0;
				add3 <= 48'b0;
				add4 <= 48'b0;
				add5 <= 48'b0;
				add6 <= 48'b0;
				add7 <= 48'b0;
				add8 <= 48'b0;
				add9 <= 48'b0;
				add10 <= 48'b0;
				
				R0 <= 16'b0;
				R1 <= 16'b0;
				R2 <= 16'b0;
				R3 <= 16'b0;
				R4 <= 16'b0;
				R5 <= 16'b0;
				R6 <= 16'b0;
				R7 <= 16'b0;
				R8 <= 16'b0;
				R9 <= 16'b0;
				R10 <= 16'b0;
			end
			if (v)
			begin
				d1 <= y;
				d2 <= d1;
				d3 <= d2;
				d4 <= d3;
				d5 <= d4;
				d6 <= d5;
				d7 <= d6;
				d8 <= d7;
				d9 <= d8;
				d10 <= d9;
				
				m0 <= x * y;
				m1 <= x * d1;
				m2 <= x * d2;
				m3 <= x * d3;
				m4 <= x * d4;
				m5 <= x * d5;
				m6 <= x * d6;
				m7 <= x * d7;
				m8 <= x * d8;
				m9 <= x * d9;
				m10 <= x * d10;
				
				add0 <= add0 + m0;
				add1 <= add1 + m1;
				add2 <= add2 + m2;
				add3 <= add3 + m3;
				add4 <= add4 + m4;
				add5 <= add5 + m5;
				add6 <= add6 + m6;
				add7 <= add7 + m7;
				add8 <= add8 + m8;
				add9 <= add9 + m9;
				add10 <= add10 + m10;
				
				R0 <= add0 >>> 32;
				R1 <= add1 >>> 32;
				R2 <= add2 >>> 32;
				R3 <= add3 >>> 32;
				R4 <= add4 >>> 32;
				R5 <= add5 >>> 32;
				R6 <= add6 >>> 32;
				R7 <= add7 >>> 32;
				R8 <= add8 >>> 32;
				R9 <= add9 >>> 32;
				R10 <= add10 >>> 32;
				
				v0 <= v;
				v1 <= v0;
				v2 <= v1;
				v3 <= v2;
				v4 <= v3;
				v5 <= v4;
				v6 <= v5;
				v7 <= v6;
				v8 <= v7;
				v9 <= v8;
				v10 <= v9;
				v11 <= v10;
				vout <= v11;
			end else
			begin
				vout <= 16'b0;
			end
		end
endmodule
				
				
			
		