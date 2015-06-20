`timescale 1ns/1ns

module write_master(//DDR3 Avalon-MM interface
					input wire 			     ddr_waitrequest,
					output reg 		  [15:0] ddr_addr,
					output reg 			     ddr_write,
					output reg signed [15:0] ddr_writedata,
					
					//writetodram Avalon-MM interface
					input wire signed [15:0] writedata,
					output reg signed [15:0] readdata,
					input wire 		  [2:0]  addr,
					input wire 		  	     read,
					input wire 			     write,
					
					//Streaming input
					input wire signed [15:0] d_in,
					input wire  			 v,
					  
					//Clock and reset
					input wire 				clk,
					input wire 				rst);
					
		// Address map
		// 0x0: write base
		// 0x1: write length
		// 0x2: step
		// 0x3: not used
		// 0x4: start
		// 0x5: done
		// 0x6: reset
					
		reg [31:0] addr_init; 	  // Initial starting address
		reg [31:0] stream_length; // Number of samples to stream
		reg [31:0] addr_step;     // address step
		reg [31:0] tmp;
		
		
		parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
		
		reg [2:0] state;
		
		reg done;
		
		assign start = ((addr == 3'h4) && (write == 1)) ? 1 : 0;
		
		assign reset = (((addr == 3'h6) && (write == 1)) || rst) ? 1 : 0;
					
		always @(posedge clk)
		begin
			if (reset)
			begin
				addr_init <= 32'b0;
				stream_length <= 32'b0;
				addr_step <= 32'b1;
				readdata <= 32'b0;
			end else
			begin
				// writetodram Avalon-MM interface
				if (read)
				begin
					case (addr)
						0: readdata <= addr_init;
						1: readdata <= stream_length;
						2: readdata <= addr_step;
						5: readdata <= done;
						default: readdata <= 32'hdeadbeef;
					endcase
				end
				if (write)
				begin
					case (addr)
						0: addr_init <= writedata;
						1: stream_length <= writedata;
						2: addr_step <= writedata;
						default: tmp <= writedata;
					endcase
				end
			end
		end
		
		// DDR3 writer state machine
		always @(posedge clk)
		begin
			if (reset)
				state <= S0;
			else
			begin
				case (state)
					0:  if (start)
							state <= S1;
						else
							state <= S0;
					1:  if (v)
							state <= S2;
						else
							state <= S1;
					2:  if (S2)
							state <= S3;
						else
							state <= S2;
					3: if (ddr_addr < stream_length)
							state <= S1;
					   else
							state <= S4;
					4: if (reset)
							state <= S0;
					   else
							state <= S4;
				endcase
			end
		end
		
		always @(posedge clk)
		begin
			case (state)
				0: begin
						ddr_addr   <= addr_init;
						ddr_write  <= 1'b0;
						done       <= 1'b0;
				   end
				2: begin
						ddr_write 	   <= 1'b1;
						ddr_writedata <= d_in;
				   end 
				3: begin
						ddr_write <= 1'b0;
						ddr_addr  <= ddr_addr + 1;
				   end
				4: done <= 1'b1;
			endcase
		end
endmodule
		
