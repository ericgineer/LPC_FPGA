`timescale 1ns/1ns 

// LPC encode module

`define peak_threshold 3000  // If input amplitude is greater than peak_threshold, the LPC frame
						     // is considered voiced speech. Otherwise it is unvoiced.

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
			  output reg 			   voiced,     // 0) Unvoiced speech. 1) Voiced speech
			  output reg 		[15:0] freq_count,
			  
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
		
		reg [15:0] rate, mem_null;
		reg [7:0] count, freq_est_count;
		wire signed [15:0] peak, mem_out;
		reg signed [15:0] threshold;
		wire [15:0] freq_count_tmp;
		
		reg freq_est_v, peak_find_v;
		wire freq_est_vout, peak_find_vout;
		
		reg freq_est_rst, peak_rst, freq_est_start;
		reg voiced_tmp;
		
		reg [2:0] state;
		parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5;
			  
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
			   
		peak_find pk(.x(x),
					  .v(peak_find_v),
					  .clk(d_clk),
					  .rst(peak_rst || rst),
					  .peak(peak),
					  .vout(peak_find_vout));
				  
		dualportram #(16, 8) dualportram(.data_a(x), 
										  .data_b(),
										  .addr_a(count),
										  .addr_b(freq_est_count),
										  .we_a(v), 
										  .we_b(), 
										  .clk_a(d_clk), 
										  .clk_b(clk),
										  .q_a(), 
										  .q_b(mem_out));
					  
		freq_est freq_est(.x(mem_out),
							 .threshold(threshold),
							 .v(freq_est_v),
							 .clk(clk),
							 .rst(freq_est_rst || rst),
							 .count(freq_count_tmp),
							 .vout(freq_est_vout));
			   
		always @(posedge done)
		begin
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
			freq_count <= freq_count_tmp;
			voiced <= (peak >= `peak_threshold) ? 1'b1 : 1'b0;
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
		
		// rate counter
		always @(posedge d_clk)
		begin
			if (rst)
				count <= 16'b0;
			if (v)
			begin
				if (count == rate)
					count <= 16'b0;
				else
					count <= count + 1;
			end
		end
		
		// Frequency estimator counter
		always @(posedge clk)
		begin
			if (freq_est_v)
				freq_est_count <= freq_est_count + 1;
			else
				freq_est_count <= 16'b0;
		end
		
		// LDR sequencer
		always @(posedge d_clk)
		begin	
			case (count)
				rate: begin
						start <= 1'b1;
						peak_find_v <= 1'b0;
						peak_rst <= 1'b1;
						LDR_rst <= 1'b0;
						freq_est_rst <= 1'b0;
					  end
				rate-2: begin
							LDR_rst <= 1'b1;
							freq_est_rst <= 1'b1;
						end
				default: begin
							start <= 1'b0;
							peak_find_v <= 1'b1;
							LDR_rst <= 1'b0;
							freq_est_rst <= 1'b0;
							peak_rst <= 1'b0;
						end
			endcase
		end
		
		// Frequency estimation sequencing state machine
		always @(posedge clk)
		begin
			if (rst)
				state <= S0;
			else
				case (state)
					S0: if (count == rate)
							state <= S1;
						else
							state <= S0;
					S1: if (freq_est_count == rate)
							state <= S2;
						else
							state <= S1;
					S2: if (freq_est_rst)
							state <= S0;
						else
							state <= S2;
					default: state <= S0;
				endcase
		end
		
		always @(posedge clk)
		begin
			case (state)
				S0: freq_est_v <= 1'b0;
				S1: begin
						freq_est_v <= 1'b1;
						threshold <= peak >>> 2;
					end
				S2: freq_est_v <= 1'b0;
			endcase
		end
endmodule
				
