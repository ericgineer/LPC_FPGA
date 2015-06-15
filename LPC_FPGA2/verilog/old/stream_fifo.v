`timescale 1ns/1ns

module stream_fifo(input wire 				clk,
				   input wire 				rst,
				   input wire signed [15:0] source_data_in,
				   input wire 				source_v_in,
				   output reg signed [15:0] sink_data_out,
				   input wire 		 		sink_v_in,
				   output reg 				sink_vout);
				   
				   
		reg [7:0] source_ptr, sink_ptr; // 256 entry deep fifo
		wire signed [15:0] to_sink;
		
		
		dualportram #(16, 8) data_ram
					(.data_a(source_data_in), // write port
					 .data_b(),		  // read port
					 .addr_a(source_ptr),
					 .addr_b(sink_ptr-1'b1),
					 .we_a(source_v_in), 
					 .we_b(1'b0), 
					 .clk(clk),
					 .q_a(),
					 .q_b(to_sink));
				   
		always @(posedge clk)
		begin
			if (rst)
			begin
				source_ptr <= 8'b0;
				sink_ptr <= 8'b0;
				sink_data_out <= 32'b0;
				sink_vout <= 1'b0;
			end else
			begin
				sink_data_out <= to_sink;
				if (source_v_in)
					source_ptr <= source_ptr + 1;
				else
					source_ptr <= source_ptr;
				if (sink_v_in)
				begin
					sink_vout <= 1'b1;
					sink_ptr <= sink_ptr + 1;
				end else
				begin
					sink_ptr <= sink_ptr;
					sink_vout <= 1'b0;
				end
			end
		end
endmodule
