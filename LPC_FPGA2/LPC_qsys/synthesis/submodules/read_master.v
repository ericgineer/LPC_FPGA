`timescale 1ns/1ns

module read_master(//DDR3 Avalon-MM interface
					  input wire signed [15:0] ddr_readdata,
					  input wire 			   ddr_readdatavalid,
					  input wire 			   ddr_waitrequest,
					  output reg 		[31:0] ddr_addr,
					  output reg 			   ddr_read,
					  
					  // Streamfromdram Avalon-MM interface
					  input wire signed [31:0] writedata,
					  output reg signed [31:0] readdata,
					  input wire 		[2:0]  addr,
					  input wire 		  	   read,
					  input wire 			   write,
					  
					  //Streaming interface
					  output reg signed [15:0]  d_out,
					  output reg 				d_clk,
					  output reg 				vout,
					  
					  //Clock and reset
					  input wire 				clk,
					  input wire 				rst);
					  
					  
		// Address map
		// 0x0: read base
		// 0x1: read length
		// 0x2: read step
		// 0x3: read rate
		// 0x4: start
		// 0x5: done
		// 0x6: reset
					  
		
		reg [31:0] addr_init; 	  // Initial starting address
		reg [31:0] stream_length; // Number of samples to stream
		reg [31:0] addr_step;     // address step
		reg [31:0] rate; 		  // Data stream rate (relative to input clock period)
		wire 	   start;		  // start streaming
		reg 	   done;
		
		reg [31:0] null;
		
		reg [2:0] state;
		
		
		reg [31:0] count, d_clk_count;
		
		reg d_clk_enable;
		
		
		parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6;
		
		
		assign start = ((addr == 3'h4) && (write == 1)) ? 1 : 0;
		
		assign reset = (((addr == 3'h6) && (write == 1)) || rst) ? 1 : 0;
					  
		always @(posedge clk)
		begin
			if (reset)
			begin
				readdata   <= 32'b0;
				addr_step  <= 16'b1;
				addr_init <= 32'b0;
				stream_length <= 32'b0;
			end
			else
			begin
				if (read)
				begin
					case (addr)
						3'h0: readdata <= addr_init;
						3'h1: readdata <= stream_length;
						3'h2: readdata <= addr_step;
						3'h3: readdata <= rate;
						3'h5: readdata <= done;
						default: readdata <= 32'hdeadbeef;
					endcase
				end
				if (write)
				begin
					case (addr)
						 3'h0: addr_init <= writedata;
						 3'h1: stream_length <= writedata;
						 3'h2: addr_step <= writedata;
						 3'h3: rate <= writedata;
						 default: null <= writedata;
					endcase
				end
			end
		end
				
		// stream counter state machine
				
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
					1:  if (S1)
							state <= S2;
						else
							state <= S1;
					2:  if (S2)
							state <= S3;
						else
							state <= S2;
					3:	if ((count >= rate - 1) && (ddr_addr <= stream_length))
							state <= S1;
						else if (ddr_addr > stream_length)
							state <= S4;
						else
							state <= S3;
					4:  if (reset)
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
						ddr_addr <= addr_init;
						ddr_read <= 1'b0;
						done     <= 1'b0;
						count    <= 32'b1;
						d_out 	 <= 16'b0;
						d_clk_enable <= 1'b0;
				   end  
				1: begin
						ddr_read <= 1'b1;
						count <= 1'b1;
						vout <= 1'b0;
				   end
				2: begin
						ddr_read <= 1'b0;
						d_out <= ddr_readdata;
						ddr_addr <= ddr_addr + 1;
						count <= count + 1;
						if (ddr_addr >= 32'd1)
						begin
							vout <= 1'b1;
							d_clk_enable <= 1'b1;
						end else
							vout <= 1'b0;
				   end
				3: begin
						count <= count + 1;
						vout <= 1'b0;
				   end
				4: begin
						done  <= 1'b1;
						d_clk_enable <= 1'b0;
				   end
			endcase
		end
		
		// Data clock counter
		always @(posedge clk)
		begin
			if (reset)
			begin
				d_clk_count <= 32'b1;
				d_clk 	 <= 1'b0;
			end else
			begin
				if (d_clk_enable)
				begin
					if (d_clk_count == rate >> 1)
					begin
						d_clk_count <= 32'b1;
						d_clk <= ~d_clk;
					end else
					begin
						d_clk_count <= d_clk_count + 1;
					end
				end
			end
		end
		
endmodule
				
