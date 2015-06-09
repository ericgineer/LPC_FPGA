`timescale 1ns/1ns

module pulsegen_tb;
	reg clk, rst;
	reg [15:0] pulserate, lpcrate;
	wire [15:0] pulseout;
	
	wire vout;
	reg v;
	
	initial
	begin
		pulserate <= 16'd4;
		lpcrate   <= 16'd240;
		rst <= 1'b0;
		clk <= 1'b0;
	end
	
	always #10 clk = ~clk;
	
	pulsegen pulsegen(.clk(clk),
					 .rst(rst),
					 .v(v),
					 .pulserate(pulserate),
					 .lpcrate(lpcrate),
					 .pulseout(pulseout),
					 .vout(vout));
		     
	initial
	begin
		repeat(3) @(posedge clk);
		rst <= 1'b1;
		repeat(1) @(posedge clk);
		rst <= 1'b0;
		v <= 1'b1;
		repeat(240) @(posedge clk);
		$stop;
	end
endmodule
