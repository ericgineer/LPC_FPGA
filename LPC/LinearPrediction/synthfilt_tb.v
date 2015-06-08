`timescale 1ns/1ns

module synthfilt_tb;
	reg 			   clk, rst, v;
	reg signed [15:0]  A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10;
	wire signed [15:0] x, x1, y;
	wire 			   vout;

	synthfilt synthfilt(.clk(clk),
						 .rst(rst),
						 .v(v),
						 .x(x1),
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
						 .y(y),
						 .vout(vout));
						 
	pulsegen pulsegen(.clk(clk),
					 .rst(rst),
					 .pulserate(16'd4),
					 .lpcrate(16'd240),
					 .pulseout(x));
	
	LFSR LFSR(.clk(clk),
			  .rst(rst),
			  .d_out(x1));
	
	initial
	begin
		clk <= 1'b0;
		rst <= 1'b0;
		A0 <= 16'd8192;
		A1 <= -16'd13493;
		A2 <= -16'd6443;
		A3 <= 16'd2996;
		A4 <= -16'd789;
		A5 <= -16'd3255;
		A6 <= 16'd2701;
		A7 <= -16'd2226;
		A8 <= 16'd2985;
		A9 <= -16'd1412;
		A10 <= -16'd239;
	end
	
	always #10 clk = ~clk;
	
	initial
	begin
		repeat(3) @(posedge clk);
		rst <= 1'b1;
		@(posedge clk);
		rst <= 1'b0;
		repeat(2) @(posedge clk);
		v <= 1'b1;
		repeat(240) @(posedge clk);
		v <= 1'b0;
		repeat(3) @(posedge clk);
		$stop;
	end
endmodule
		
