`timescale 1ns/1ns

module streamfromdram(//DDR3 Avalon-MM interface
					  input wire signed [15:0] ddr_readdata,
					  input wire 			   ddr_readdatavalid,
					  input wire 			   ddr_waitrequest,
					  output reg 		[31:0] ddr_addr,
					  output reg 			   ddr_read,
					  
					  // Streamfromdram Avalon-MM interface
					  input wire signed [31:0] writedata,
					  output reg signed [31:0] readdata,
					  input wire 		[1:0]  addr,
					  input wire 		  	   read,
					  input wire 			   write,
					  
					  //Streaming output
					  output reg signed [15:0] d_out,
					  output reg 				vout,
					  
					  //Clock and reset
					  input wire 				clk,
					  input wire 				rst);
					  
		
		reg [31:0] addr_init; 	  // Initial starting address
		reg [31:0] stream_length; // Number of samples to stream
		reg [31:0] addr_step;     // address step
		wire 	   start;		  // start streaming
		
		reg [31:0] null;
		
		reg [1:0] state;
		
		parameter S0 = 0, S1 = 1, S2 = 2;
		
		reg vout_tmp;
		
		
		assign start = ((addr == 2'b11) && (write == 1)) ? 1 : 0;
					  
		always @(posedge clk)
		begin
			if (rst)
			begin
				readdata   <= 32'b0;
				d_out 	   <= 32'b0;
				vout 	   <= 1'b0; 
				addr_step  <= 16'b1;
				addr_init <= 32'b0;
				stream_length <= 32'b0;
			end
			else
			begin
				d_out <= ddr_readdata;
				vout <= vout_tmp;
				if (read)
				begin
					case (addr)
						2'b00: readdata <= addr_init;
						2'b01: readdata <= stream_length;
						2'b10: readdata <= addr_step;
						default: readdata <= 32'hdeadbeef;
					endcase
				end
				if (write)
				begin
					case (addr)
						 2'b00: addr_init <= writedata;
						 2'b01: stream_length <= writedata;
						 2'b10: addr_step <= writedata;
						 default: null <= writedata;
					endcase
				end
			end
		end
				
		// stream counter state machine
				
		always @(posedge clk)
		begin
			if (rst)
				state <= S0;
			else
			begin
				case (state)
					0:  if (start)
							state <= S1;
						else
							state <= S0;
					1:  if (ddr_addr >= stream_length)
							state <= S2;
						else
							state <= S1;
					2:  if (rst)
							state <= S0;
						else
							state <= S2;
				endcase
			end
		end
		
		always @(posedge clk)
		begin
			case (state)
				0: begin
						ddr_addr <= addr_init;
						ddr_read <= 1'b0;
				   end
				1: begin
						if (ddr_readdatavalid && !ddr_waitrequest)
						begin
							ddr_addr <= ddr_addr + addr_step;
							vout_tmp <= 1'b1;
						end else
						begin
							ddr_addr <= ddr_addr;
							vout_tmp <= 1'b0;
						end
						ddr_read <= 1'b1;
					end
				default: begin
							ddr_addr <= ddr_addr;
							ddr_read <= 1'b0;
						 end
			endcase
		end
endmodule
				
