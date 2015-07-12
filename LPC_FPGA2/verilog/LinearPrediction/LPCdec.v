`timescale 1ns/1ns

// LPC decoder

module LPCdec(input wire 			   clk,
			  input wire 			   clk_rst,
			  input wire 			   rst,
			  input wire 			   start,
			  input wire 			   stop,
			  input wire 			   voiced,
			  input wire 		[15:0] pulserate,
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
			  output reg 			   vout,
			  
			  // Avalon-MM interface
			  input wire 			   avalon_clk,
			  input wire 		[3:0]  address,
			  input wire       		   read,
			  input wire 		 	   write,
			  input wire signed [15:0] writedata,
		      output reg signed [15:0] readdata);
			  
			  
		wire signed [15:0] x, pulseout, d_out, y;
		wire synth_vout, pulsegen_vout;
		
		reg v, vout_tmp;
		
		reg [15:0] count, lpcrate, mem_null, num_samples;
		
		reg [1:0] state;
		parameter S0 = 0, S1 = 1, S2 = 2;
		
		
		assign x = voiced ? pulseout : d_out;
		
		
		always @(posedge clk)
		begin
			vout <= synth_vout;
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
				  .rst(rst || clk_rst),
				  .d_out(d_out));
				  
		// Avalon-MM interface
		always @(posedge avalon_clk)
		begin
			if (read)
			begin
				case (address)
					16'h0: readdata <= lpcrate;
					default: readdata <= 16'hbad;
				endcase
			end else
				readdata <= 16'b0;
			if (write)
			begin
				case (address)
					16'h0: lpcrate <= writedata;
					16'h1: num_samples <= writedata;
					default: mem_null <= writedata;
				endcase
			end
		end
				  
				  
		// startup state machine
		
		always @(posedge clk)
		begin
			if (rst)
				state <= S0;
			else
				case (state)
					S0: if (start)
							state <= S1;
						else
							state <= S0;
					S1: if (stop)
							state <= S2;
						else
							state <= S1;
					S2: if (count == lpcrate)
							state <= S0;
						else
							state <= S2;
				endcase
		end
		
		always @(posedge clk)
		begin
			case (state)
				S0: begin
						vout_tmp <= 1'b0;
						v <= 1'b0;
						count <= 16'b0;
					end
				S1: begin
						vout_tmp <= 1'b1;
						v <= 1'b1;
					end
				S2: count <= count + 1;
			endcase
		end
endmodule

				
				
