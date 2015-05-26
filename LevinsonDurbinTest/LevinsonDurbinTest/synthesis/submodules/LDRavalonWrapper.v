`timescale 1ns/1ns

module LDRavalonWrapper(input wire clk,
						input wire rst,
						input wire signed [15:0] address,
					    input wire       read,
						input wire 		 write,
						input wire signed [15:0] writedata,
						output reg signed [15:0] readdata,
						output reg [7:0] led);
						
		wire [15:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10;
		wire done_out;
		
		reg reset, start, done;
		
		reg signed [15:0] mem[0:24];
		
		reg [15:0] mem_null;
		
		reg [1:0] state;
		parameter S0 = 0, S1 = 1, S2 = 2;
						
		LDR LDR(.R0(mem[3]),
			   .R1(mem[4]),
			   .R2(mem[5]),
			   .R3(mem[6]),
			   .R4(mem[7]),
			   .R5(mem[8]),
			   .R6(mem[9]),
			   .R7(mem[10]),
			   .R8(mem[11]),
			   .R9(mem[12]),
			   .R10(mem[13]),
			   .start(mem[1]),
			   .clk(clk),
			   .rst(mem[0]),
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
			   .done(done_out));
			   
			   
		// Address map:
		// 0x0: reset
		// 0x10: start
		// 0x20: done (read only)
		// 0x30: R0
		// 0x40: R1
		// 0x50: R2
		// 0x60: R3
		// 0x70: R4
		// 0x80: R5
		// 0x90: R6
		// 0xA0: R7
		// 0xB0: R8
		// 0xC0: R9
		// 0xD0: R10
		// 0xE0: A0 (read only)
		// 0xF0: A1 (read only)
		// 0x110: A2 (read only)
		// 0x120: A3 (read only)
		// 0x130: A4 (read only)
		// 0x140: A5 (read only)
		// 0x150: A6 (read only)
		// 0x160: A7 (read only)
		// 0x170: A8 (read only)
		// 0x180: A9 (read only)
		// 0x190: A10 (read only)
		
		always @(posedge clk)
		begin
			if (read)
			begin
				case (address)
					16'h0: readdata <= mem[0];
					16'h10: readdata <= mem[1];
					16'h20: readdata <= mem[2];
					16'h30: readdata <= mem[3];
					16'h40: readdata <= mem[4];
					16'h50: readdata <= mem[5];
					16'h60: readdata <= mem[6];
					16'h70: readdata <= mem[7];
					16'h80: readdata <= mem[8];
					16'h90: readdata <= mem[9];
					16'hA0: readdata <= mem[10];
					16'hB0: readdata <= mem[11];
					16'hC0: readdata <= mem[12];
					16'hD0: readdata <= mem[13];
					16'hE0: readdata <= mem[14];
					16'hF0: readdata <= mem[15];
					16'h100: readdata <= mem[16];
					16'h110: readdata <= mem[17];
					16'h120: readdata <= mem[18];
					16'h130: readdata <= mem[19];
					16'h140: readdata <= mem[20];
					16'h150: readdata <= mem[21];
					16'h160: readdata <= mem[22];
					16'h170: readdata <= mem[23];
					16'h180: readdata <= mem[24];
					default: readdata <= 16'hbad;
				endcase
			end
			if (write)
			begin
				case (address)
					16'h0: mem[0] <= writedata;
					16'h10: mem[1] <= writedata;
					16'h30: mem[3] <= writedata;
					16'h40: mem[4] <= writedata;
					16'h50: mem[5] <= writedata;
					16'h60: mem[6] <= writedata;
					16'h70: mem[7] <= writedata;
					16'h80: mem[8] <= writedata;
					16'h90: mem[9] <= writedata;
					16'hA0: mem[10] <= writedata;
					16'hB0: mem[11] <= writedata;
					16'hC0: mem[12] <= writedata;
					16'hD0: mem[13] <= writedata;
					default: mem_null <= writedata;
				endcase
			end
		end
		
		always @(posedge clk)
		begin
			mem[14] <= A0;
			mem[15] <= A1;
			mem[16] <= A2;
			mem[17] <= A3;
			mem[18] <= A4;
			mem[19] <= A5;
			mem[20] <= A6;
			mem[21] <= A7;
			mem[22] <= A8;
			mem[23] <= A9;
			mem[24] <= A10;
			
			mem[2] <= done_out;
			
			reset <= mem[0];
			start <= mem[1];
			done <= mem[2];
		end
		
			   
		always @(posedge clk)
		begin
			if (mem[0] || rst)
			begin
				state <= S0;
			end else
			begin
				case (state)
					S0: if (mem[1]) // start
							state <= S1;
						else
							state <= S0;
					S1: if (mem[2]) // done
							state <= S2;
						else
							state <= S1;
					S2: state <= S2;
					default: state <= S0;
				endcase
			end
		end
				
		// led[0]: run, led[1]: done
		always @(posedge clk)
		begin
			case (state)
				S0: led <= 8'b11111111; // Initial state
				S1: led[0] <= 1'b0; // run
				S2: begin				// done
						led[0] <= 1'b1; 
						led[1] <= 1'b0;
					end
				default: state <= S0;
			endcase	
		end
endmodule