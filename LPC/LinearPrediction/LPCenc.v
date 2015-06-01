`timescale 10ns/10ns 

// LPC encode module

module LPCenc(input wire signed [15:0] x,
			  input wire 			   v,
			  input wire 			   clk,
			  input wire 			   d_clk,
			  input wire 			   rst,
			  output reg signed [15:0] A0,
			  output reg signed [15:0] A1,
			  output reg signed [15:0] A2,
			  output reg signed [15:0] A3,
			  output reg signed [15:0] A4,
			  output reg signed [15:0] A5,
			  output reg signed [15:0] A6,
			  output reg signed [15:0] A7,
			  output reg signed [15:0] A8,
			  output reg signed [15:0] A9,
			  output reg signed [15:0] A10,
			  output reg 			   voiced,
			  
			  // Avalon-MM interface
			  input wire [15:0] address,
			  input wire       				read,
			  input wire 		 			write,
			  input wire signed [15:0] writedata,
		      output reg signed [15:0] readdata);
			  
		wire signed [15:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10;
		wire signed [15:0] A0_tmp, A1_tmp, A2_tmp, A3_tmp, A4_tmp, A5_tmp, A6_tmp, A7_tmp, A8_tmp, A9_tmp, A10_tmp;
		wire corr_vout;
		
		reg start, LDR_rst;
		wire done;
		
		reg [15:0] rate, mem_null, count;
			  
		correlation corr(.x(x),
					   .y(x),
					   .v(v),
					   .clk(d_clk),
					   .rst(rst),
					   .R0(R0),
					   .R1(R1),
					   .R2(R2),
					   .R3(R3),
					   .R4(R4),
					   .R5(R5),
					   .R6(R6),
					   .R7(R7),
					   .R8(R8),
					   .R9(R9),
					   .R10(R10),
					   .vout(corr_vout));
					   
		LDR LDR(.R0(R0),
			   .R1(R1),
			   .R2(R2),
			   .R3(R3),
			   .R4(R4),
			   .R5(R5),
			   .R6(R6),
			   .R7(R7),
			   .R8(R8),
			   .R9(R9),
			   .R10(R10),
			   .start(start),
			   .clk(clk),
			   .rst(LDR_rst || rst),
			   .A0(A0_tmp),
			   .A1(A1_tmp),
			   .A2(A2_tmp),
			   .A3(A3_tmp),
			   .A4(A4_tmp),
			   .A5(A5_tmp),
			   .A6(A6_tmp),
			   .A7(A7_tmp),
			   .A8(A8_tmp),
			   .A9(A9_tmp),
			   .A10(A10_tmp),
			   .done(done));
			   
		// LPC rate counter
		always @(posedge d_clk)
		begin
			if (rst)
				count <= 16'b0;
			if (v)
				count <= count + 1;
			if (count == rate)
			begin
				start <= 1'b1;
				count <= 16'b0;
			end else
				start <= 1'b0;
			if (count == rate - 10)
				LDR_rst <= 1'b1;
			else
				LDR_rst <= 1'b0;
				
			A0 <= A0_tmp;
			A1 <= A1_tmp;
			A2 <= A2_tmp;
			A3 <= A3_tmp;
			A4 <= A4_tmp;
			A5 <= A5_tmp;
			A6 <= A6_tmp;
			A7 <= A7_tmp;
			A8 <= A8_tmp;
			A9 <= A9_tmp;
			A10 <= A10_tmp;
		end
		
		// Avalon-MM interface
		always @(posedge clk)
		begin
			if (read)
			begin
				case (address)
					16'h0: readdata <= rate;
					default: readdata <= 16'hbad;
				endcase
			end else
				readdata <= 16'b0;
			if (write)
			begin
				case (address)
					16'h0: rate <= writedata;
					default: mem_null <= writedata;
				endcase
			end
		end
endmodule
				
