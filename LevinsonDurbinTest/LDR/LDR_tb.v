`timescale 1ns/1ns

module LDR_tb;
	reg 		   start;
	reg signed [15:0]  x;
	reg signed [15:0]  y;
	reg 	           v;
	reg 	           clk;
	reg 	           rst;
	reg signed [15:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10;
	wire signed [15:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10;
	wire 	           vout;
	wire 			   done;
	
	integer x_in, x_read, count;
	
	initial
	begin
		x		<= 16'b0;
		y     	<= 16'b0;
		v    	<= 16'b0;
		clk   	<= 1'b0;
		rst   	<= 16'b0;
		
		R0 <= 16'd32767;
		R1 <= 16'd25742;
		R2 <= 16'd16169;
		R3 <= 16'd9836;
		R4 <= 16'd4569;
		R5 <= -16'd2674;
		R6 <= -16'd11249;
		R7 <= -16'd17338;
		R8 <= -16'd14853;
		R9 <= -16'd6828;
		R10 <= -16'd3174;
		
		
		
		x_read  <= $fopen("x.txt","r");
	end
	
/* 	correlation autocorr(.x(x),
					    .y(x),
						.v(v),
						.clk(clk),
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
						.vout(vout)); */
						
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
			.rst(rst),
			.A0(A0),
			.A1(A1),
			.A2(A2),
			.A3(A3),
			.A4(A4),
			.A5(A5),
			.A6(A6),
			.A7(A7),
			.A8(A8),
			.A9(A9),
			.A10(A10),
			.done(done));
	
	always #10 clk = ~clk;
	
	initial
	begin
		count <= 0;
		repeat(10) @(posedge clk);
		rst <= 1'b1;
		@(posedge clk)
		rst <= 1'b0;
		repeat(10) @(posedge clk);
		while (count <= 5000)
		begin
			v     <= 1'b1;
			x_in  <= $fscanf(x_read,"%d\n",x);
			@(posedge clk);
			count <= count + 1;
		end
		v <= 1'b0;
		repeat(10) @(posedge clk);
		$finish;
	end
	
	always @(posedge clk)
	begin
		if (count == 10)
			start <= 1'b1;
		else
			start <= 1'b0;
	end
endmodule
	