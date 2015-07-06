`timescale 1ns/1ns

// LPC decoder

module LPCdec(input wire 			   clk,
			  input wire 			   rst,
			  input wire 			   v,
			  input wire 			   voiced,
			  input wire 		[15:0] pulserate,
			  input wire 		[15:0] lpcrate,
			  input wire signed [15:0] A0,
			  input wire signed [15:0] A1,
			  input wire signed [15:0] A2,
			  input wire signed [15:0] A3,
			  input wire signed [15:0] A4,
			  input wire signed [15:0] A5,
			  input wire signed [15:0] A6,
			  input wire signed [15:0] A7,
			  input wire signed [15:0] A8,
			  input wire signed [15:0] A9,
			  input wire signed [15:0] A10,
			  output reg signed [15:0] synth,
			  output reg 			   vout);
			  
			  
		wire signed [15:0] x, pulseout, d_out, y;
		wire synth_vout, pulsegen_vout;
		
		
		assign x = voiced ? pulseout : d_out;
		
		
		always @(posedge clk)
		begin
			vout <= synth_vout && pulsegen_vout;
			synth <= y;
		end  
			  
	    synthfilt synthfilt(.clk(clk),
						 .rst(rst),
						 .v(v),
						 .x(x),
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
						 .vout(synth_vout));
						 
		pulsegen pulsegen(.clk(clk),
						 .rst(rst),
						 .v(v),
						 .pulserate(pulserate),
						 .lpcrate(lpcrate),
						 .pulseout(pulseout),
						 .vout(pulsegen_vout));
	
		LFSR LFSR(.clk(clk),
				  .rst(rst),
				  .d_out(d_out));
endmodule

				
				
