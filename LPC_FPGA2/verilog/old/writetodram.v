`timescale 1ns/1ns

module writetodram(//DDR3 Avalon-MM interface
					input wire 			   ddr_waitrequest,
					output reg 		[31:0] ddr_addr,
					output reg 			   ddr_write,
					output reg signed [15:0] ddr_writedata,
					
					//writetodram Avalon-MM interface
					input wire signed [31:0] writedata,
					output reg signed [31:0] readdata,
					input wire 		[1:0]  addr,
					input wire 		  	   read,
					input wire 			   write,
					
					//Streaming input
					input wire signed [15:0] d_in,
					input wire  			 v,
					output reg 		         ddr_wait,
					  
					//Clock and reset
					input wire 				clk,
					input wire 				rst);
					
		reg [31:0] addr_init; 	  // Initial starting address
		reg [31:0] stream_length; // Number of samples to stream
		reg [31:0] addr_step;     // address step
		reg [31:0] tmp;
		
		wire signed [15:0] fifo_out;
		
		reg [31:0] addr_count;
		
		reg [1:0] state;
		
		reg [7:0] fifo_addr;
		
		wire sink_vout;
		
		parameter S0 = 0, S1 = 1, S2 = 2;
		
		
		assign start = ((addr == 2'b11) && (write == 1)) ? 1 : 0;
		
		
		stream_fifo fifo(.clk(clk),
						.rst(rst),
						.source_data_in(d_in),
						.source_v_in(v),
						.sink_data_out(fifo_out),
						.sink_v_in(!ddr_waitrequest && v),
				        .sink_vout(sink_vout));
					
		always @(posedge clk)
		begin
			if (rst)
			begin
				ddr_writedata <= 32'b0;
				addr_init <= 32'b0;
				stream_length <= 32'b0;
				addr_step <= 32'b1;
				ddr_wait <= 1'b0;
				ddr_addr <= 32'b0;
			end else
			begin
				ddr_writedata <= fifo_out;
				ddr_addr <= addr_count;
				// writetodram Avalon-MM interface
				if (read)
				begin
					case (addr)
						0: readdata <= addr_init;
						1: readdata <= stream_length;
						2: readdata <= addr_step;
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
			if (rst)
				state <= S0;
			else
			begin
				case (state)
					0:  if (sink_vout)
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
						addr_count <= addr_init;
						fifo_addr <= 7'b0;
						ddr_write <= 1'b0;
				   end
				1: begin
						if (sink_vout)
						begin
							addr_count <= addr_count + addr_step;
							fifo_addr <= fifo_addr + 1;
							ddr_wait <= 1'b0;
							ddr_write <= 1'b1;
						end else
						begin
							addr_count <= addr_count;
							fifo_addr <= fifo_addr;
							ddr_wait <= 1'b1;
							ddr_write <= 1'b0;
						end
					end
				default: begin
							addr_count <= addr_count;
							fifo_addr <= fifo_addr;
							ddr_wait <= 1'b0;
							ddr_write <= 1'b0;
						 end
			endcase
		end
endmodule
		
