`timescale 1ns/1ns

// Linear feedback shift register

module LFSR(input wire clk,
			input wire rst,
			output reg [15:0] d_out);
			
	always @(posedge clk)
	begin
		if (rst)
		begin
			d_out <= 16'b1011001011001101;
		end else
		begin
			d_out <= {d_out[0] ^ d_out[1], d_out[15:1]};
		end
	end
endmodule
	
