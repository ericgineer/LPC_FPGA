`timescale 1ns/1ns

module master_avalon_interface(// Avalon read master control interface
							   output reg 		 read_master_fixed_location,
							   output reg [31:0] read_master_read_base,
							   output reg [31:0] read_master_read_length,
							   output wire		 read_master_go,
							   input wire 		 read_master_done,
							   
							   // Avalon write master control interface
							   output reg 		 write_master_fixed_location,
							   output reg [31:0] write_master_write_base,
							   output reg [31:0] write_master_write_length,
							   output wire 		 write_master_go,
							   input wire 		 write_master_done,
							   
							   // clock and reset
							   input wire 		 clk,
							   input wire 		 rst,
							   
							   // Avalon interface
							   input wire [3:0]  address,
							   input wire 		 write,
							   input wire 		 read,
							   input wire [31:0] writedata,
							   output reg [31:0] readdata);
		
		// Address map
		// 0x0: read master fixed location
		// 0x1: read master read base address
		// 0x2: read master read length
		// 0x3: read master start
		// 0x4: read master done
		// 0x5: write master fixed location
		// 0x6: write master read base
		// 0x7: write master read length
		// 0x8: write master start					   
		// 0x9: write master done
		
		reg [31:0] tmp;
						
		assign read_master_go = (address == 32'h3) ? 1 : 0;
		assign write_master_go = (address == 32'h8) ? 1 : 0;	   
							   
		always @(posedge clk)
		begin
			if (rst)
			begin
				read_master_fixed_location <= 1'b0;
				read_master_read_base 	   <= 32'b0;
				read_master_read_length    <= 32'b0;
				
				write_master_fixed_location <= 1'b0;
				write_master_write_base 	    <= 32'b0;
				write_master_write_length    <= 32'b0;
			
				readdata				    <= 32'b0;
			end else
				if (read)
					case (address)
						0: readdata <= read_master_fixed_location;
						1: readdata <= read_master_read_base;
						2: readdata <= read_master_read_length;
						3: readdata <= read_master_go;
						4: readdata <= read_master_done;
						5: readdata <= write_master_fixed_location;
						6: readdata <= write_master_write_base;
						7: readdata <= write_master_write_length;
						8: readdata <= write_master_go;
						9: readdata <= write_master_done;
						default: readdata <= 32'hdeadbeef;
					endcase
				if (write)
					case (address)
						0: read_master_fixed_location  <= writedata;
						1: read_master_read_base 	   <= writedata;
						2: read_master_read_length	   <= writedata;
						5: write_master_fixed_location <= writedata;
						6: write_master_write_base 	   <= writedata;
						7: write_master_write_length   <= writedata;
						default: tmp <= writedata;
					endcase
		end
endmodule
					
						
						
						
						
						
						
