`timescale 1ns/1ns


module divide_stage(  input wire signed  [31:0]      A,
					  input wire signed  [31:0]      B,
					  input wire signed  [31:0]      R,
					  input wire signed  [31:0] 	  Q,
					  input wire         [4:0] count_in,
					  input wire        			  v,
					  input wire        		    clk,
					  input wire        			rst,
					  output reg signed  [31:0] A_next,
					  output reg signed  [31:0] B_next,
					  output reg signed  [31:0] R_next,
					  output reg signed  [31:0] Q_next,
					  output reg         [4:0] count_out,
					  output reg        		   vout);
			  
		reg signed [31:0] A_tmp1, A_tmp2, A_tmp3;
		reg signed [31:0] A_out1, A_out2, A_out3;
		reg signed [31:0] B_tmp1, B_tmp2, B_tmp3;
		reg signed [31:0] R_tmp1, R_tmp2, R_tmp3;
		reg signed [31:0] Q_tmp1, Q_tmp2, Q_tmp3;
		reg signed [4:0]  count1, count2, count3;
		reg signed [1:0] q_i;
		reg               v1, v2, v3, v4;
		
		always @(posedge clk)
		begin
			if (rst)
			begin
				A_tmp1 <= 32'b0;
				A_tmp2 <= 32'b0;
				A_tmp3 <= 32'b0;
				A_next <= 32'b0;
				
				B_tmp1 <= 32'b0;
				B_tmp2 <= 32'b0;
				B_tmp3 <= 32'b0;
				B_next <= 32'b0;
				
				R_tmp1 <= 32'b0;
				R_tmp2 <= 32'b0;
				R_tmp3 <= 32'b0;
				R_next <= 32'b0;
				
				Q_tmp1 <= 32'b0;
				Q_tmp2 <= 32'b0;
				Q_tmp3 <= 32'b0;
				Q_next <= 32'b0;
				
				v1 	   <= 1'b0;
				v2 	   <= 1'b0;
				v3 	   <= 1'b0;
				vout   <= 1'b0;
				
				count1 <= 5'b0;
				count2 <= 5'b0;
				count3 <= 5'b0;
				count_out <= 5'b0;
			end else
			begin
				if (v)
				begin
					A_tmp1 <= A <<< 1;
				    R_tmp1 <= R <<< 1;
					B_tmp1 <= B;					
					Q_tmp1 <= Q <<< 1;
					v1 	   <= v;
					count1 <= count_in;
				end else
				begin
					v1 <= 1'b0;
				end

				if (v1)
				begin
					A_tmp2 <= A_tmp1;
					R_tmp2 <= R_tmp1 + A_tmp1[31];
					B_tmp2 <= B_tmp1;
					Q_tmp2 <= Q_tmp1;
					v2 	   <= v1;
					count2 <= count1;
				end else
				begin
					v2 <= 1'b0;
				end
				
				if (v2)
				begin
					A_tmp3 <= A_tmp2;
					B_tmp3 <= B_tmp2;
					
					if (R_tmp2 >= B_tmp2)
					begin
						q_i    <= 1;
						R_tmp3 <= R_tmp2 - B_tmp2; 
					end else
					begin
						R_tmp3 <= R_tmp2;
						q_i    <= 0;
					end
					Q_tmp3 <= Q_tmp2;
					v3     <= v2;
					count3 <= count2;
				end else
				begin
					v3 <= 1'b0;
				end
				
				if (v3)
				begin
					A_next <= A_tmp3;
					B_next <= B_tmp3;
					R_next <= R_tmp3;
					Q_next <= Q_tmp3 + q_i;
					vout   <= v4;
					count_out <= count3 + 1;
				end else
				begin
					vout <= 1'b0;
				end
			end
		end
endmodule
			
			
				