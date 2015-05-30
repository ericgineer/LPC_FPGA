`timescale 1ns/1ns

// Long divides A by B and returns Remainder R and quotient Q in the form A = B * Q + R

module divide(input wire signed [31:0]  A,
			  input wire signed [31:0]  B,
			  input wire        	 start,
			  input wire        	   clk,
			  input wire        	   rst,
			  output reg signed [31:0] Q,
			  output reg signed [31:0] R,
			  output reg        	   err,
			  output reg        	  done);
		
		reg signed    [31:0] A_tmp, B_tmp, R_tmp, Q_tmp, divideby0check;
		reg signed 		  d, d1, d2, d3, d4;
		reg 			sign, sign1, sign2, sign3, sign4;
	    wire signed   [31:0] A_next, B_next, R_next, Q_next;
		reg           [4:0]  count;
		wire          [4:0] count_next;
		reg         	     run;
		
		divide_stage div(.A(A_tmp), .B(B_tmp), .R(R_tmp), .Q(Q_tmp), .v(run), .count_in(count), .clk(clk), .rst(rst), .A_next(A_next), .B_next(B_next), .R_next(R_next), .Q_next(Q_next), .count_out(count_next), .vout());
		
		always @(posedge clk)
		begin
			d1 <= d;
			d2 <= d1;
			d3 <= d2;
			
			sign1 <= sign;
			sign2 <= sign1;
			sign3 <= sign2;
			if(rst)
			begin
				A_tmp <= 32'b0;
				B_tmp <= 32'b0;
				R_tmp <= 32'b0;
				Q_tmp <= 32'b0;
				count <= 0;
				R 	  <= 0;
				Q 	  <= 0;
				d     <= 0;
				d1	  <= 0;
				d2    <= 0;
				d3    <= 0;
				sign  <= 0;
				sign1 <= 0;
				sign2 <= 0;
				sign3 <= 0;
				done  <= 0;
				run   <= 0;
				divideby0check <= 32'b0;
				err <= 1'b0;
			end
			if(!run)
			begin
				if (A < 0)
					A_tmp <= -A;
				else
					A_tmp <= A;
				if (B < 0)
					B_tmp <= -B;
				else
					B_tmp <= B;
				R_tmp <= 0;
				Q_tmp <= 0;
				count <= 0;
				R <= 16'b0;
				Q <= 16'b0;
				done  <= 0;
				err <= 1'b0;
			end else
			begin
				A_tmp <= A_next;
				B_tmp <= B_next;
				R_tmp <= R_next;
				Q_tmp <= Q_next;
				count <= count_next;
				done  <= 1'b0;
				d 	  <= 1'b0;
				d1 	  <= 1'b0;
				d2 	  <= 1'b0;
				d3 	  <= 1'b0;
			end
			if(start)
			begin
				sign  <= A[31] || B[31];
				run <= 1;
				divideby0check <= B;
			end else
			begin
				sign <= sign;
				divideby0check <= divideby0check;
			end
			if(count == 30)
			begin
				run <= 0;
				d <= 1;
			end
			if(d3)
			begin
				if (sign3)
					Q <= -Q_next;
				else
					Q <= Q_next;
				R <= R_next;
				done <= 1'b1;
				if(divideby0check == 32'b0)
					err <= 1'b1;
				else
					err <= 1'b0;
			end
			else
			begin
				R <= 32'b0;
				Q <= 32'b0;
				done <= 1'b0;
				err  <= 1'b0;
			end
		end
endmodule	