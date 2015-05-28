`timescale 1ns/1ns

module LDRavalonWrapper(input wire clk,
						input wire rst,
						input wire [15:0] address,
					    input wire       read,
						input wire 		 write,
						input wire signed [15:0] writedata,
						output reg signed [15:0] readdata,
						output reg [7:0] led);
						
		wire signed [15:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10;
		reg signed [15:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10;
		
		reg reset, start;
		wire done;
		
		reg [15:0] mem_null, counter;
		
		reg [1:0] state;
		parameter S0 = 0, S1 = 1, S2 = 2;
						
		LDR LDR(.R0(R0),
			   .R1(R1),
			   .R2(R2),
			   .R3(R3),
			   .R4(R4),
			   .R5(R5),
			   .R6(R6),
			   .R7(R7),
			   .R8(R8),
			   .R9(R9),
			   .R10(R10),
			   .start(start),
			   .clk(clk),
			   .rst(reset),
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
			   .done(done));
			   
			   
		// Address map:
		// 0x0: 0x0: reset
		// 0x2: 0x1: start
		// 0x4: 0x2: done (read only)
		// 0x6: 0x3: R0
		// 0x8: x4: R1
		// 0xA: 0x5: R2
		// 0xC: 0x6: R3
		// 0xE: 0x7: R4
		// 0x10: 0x8: R5
		// 0x12: 0x9: R6
		// 0x14: 0xA: R7
		// 0x16: 0xB: R8
		// 0x18: 0xC: R9
		// 0x1A: 0xD: R10
		// 0x1C: 0xE: A0 (read only)
		// 0x1E: 0xF: A1 (read only)
		// 0x20: 0x10: A2 (read only)
		// 0x22: 0x11: A3 (read only)
		// 0x24: 0x12: A4 (read only)
		// 0x26: 0x13: A5 (read only)
		// 0x28: 0x14: A6 (read only)
		// 0x2A: 0x15: A7 (read only)
		// 0x2C: 0x16: A8 (read only)
		// 0x3E: 0x17: A9 (read only)
		// 0x30: 0x18: A10 (read only)
		// 0x32: 0x19: clock counter
		
		always @(posedge clk)
		begin
			if (state == S1)
				counter <= counter + 1;
			else if (reset)
				counter <= 16'b0;
			else
				counter <= counter;
		end
		
		always @(posedge clk)
		begin
			if (read)
			begin
				case (address)
					16'h0: readdata <= 16'b0;
					16'h1: readdata <= 16'b0;
					16'h2: readdata <= done;
					16'h3: readdata <= R0;
					16'h4: readdata <= R1;
					16'h5: readdata <= R2;
					16'h6: readdata <= R3;
					16'h7: readdata <= R4;
					16'h8: readdata <= R5;
					16'h9: readdata <= R6;
					16'hA: readdata <= R7;
					16'hB: readdata <= R8;
					16'hC: readdata <= R9;
					16'hD: readdata <= R10;
					16'hE: readdata <= A0;
					16'hF: readdata <= A1;
					16'h10: readdata <= A2;
					16'h11: readdata <= A3;
					16'h12: readdata <= A4;
					16'h13: readdata <= A5;
					16'h14: readdata <= A6;
					16'h15: readdata <= A7;
					16'h16: readdata <= A8;
					16'h17: readdata <= A9;
					16'h18: readdata <= A10;
					16'h19: readdata <= counter;
					default: readdata <= 16'hbad;
				endcase
			end else
				readdata <= 16'b0;
			if (write)
			begin
				case (address)
					16'h0: reset <= writedata[0];
					16'h1: start <= writedata[0];
					16'h3: R0 <= writedata;
					16'h4: R1 <= writedata;
					16'h5: R2 <= writedata;
					16'h6: R3 <= writedata;
					16'h7: R4 <= writedata;
					16'h8: R5 <= writedata;
					16'h9: R6 <= writedata;
					16'hA: R7 <= writedata;
					16'hB: R8 <= writedata;
					16'hC: R9 <= writedata;
					16'hD: R10 <= writedata;
					default: mem_null <= writedata;
				endcase
			end
		end
			   
		always @(posedge clk)
		begin
			if (reset || rst)
			begin
				state <= S0;
			end else
			begin
				case (state)
					S0: if (start) // start
							state <= S1;
						else
							state <= S0;
					S1: if (done) // done
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