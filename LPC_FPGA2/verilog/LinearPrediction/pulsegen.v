`timescale 1ns/1ns

module pulsegen(input wire 				 clk,
				input wire 				 rst,
				input wire 				 v,
				input wire 		  [15:0] pulserate,
				input wire 		  [15:0] lpcrate,
				output reg signed [15:0] pulseout,
				output reg               vout);
				
		reg [15:0] count;
				
		always @(posedge clk)
		begin
			if (rst)
			begin
				pulseout <= 16'b0;
				count <= 16'b0;
			end
			if (v)
			begin
				if (count >= lpcrate)
				begin
					pulseout <= 16'b111111111111111;
					count <= 16'b0;
				end else
				begin
					pulseout <= 16'b0;
					count <= count + pulserate;
				end
				vout <= 1'b1;
			end else
			begin
				vout <= 1'b0;
				count <= 16'b0;
			end
		end
endmodule
			
