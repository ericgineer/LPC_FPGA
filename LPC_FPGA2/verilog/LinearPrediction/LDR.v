`timescale 1ns/1ns

module LDR(input wire signed [15:0] R0,
		   input wire signed [15:0] R1,
		   input wire signed [15:0] R2,
		   input wire signed [15:0] R3,
		   input wire signed [15:0] R4,
		   input wire signed [15:0] R5,
		   input wire signed [15:0] R6,
		   input wire signed [15:0] R7,
		   input wire signed [15:0] R8,
		   input wire signed [15:0] R9,
		   input wire signed [15:0] R10,
		   input wire 			  start,
		   input wire 			   clk,
		   input wire 			   rst,
		   output reg signed [15:0] A0,
		   output reg signed [15:0] A1,
		   output reg signed [15:0] A2,
		   output reg signed [15:0] A3,
		   output reg signed [15:0] A4,
		   output reg signed [15:0] A5,
		   output reg signed [15:0] A6,
		   output reg signed [15:0] A7,
		   output reg signed [15:0] A8,
		   output reg signed [15:0] A9,
		   output reg signed [15:0] A10,
		   output reg 				done);
		   
		reg signed [15:0] R0_tmp, R1_tmp, R2_tmp, R3_tmp, R4_tmp, R5_tmp, R6_tmp, R7_tmp, R8_tmp, R9_tmp, R10_tmp;
		
		reg signed [15:0] R0_num, R1_num, R2_num, R3_num, R4_num, R5_num, R6_num, R7_num, R8_num, R9_num, R10_num;
		reg signed [15:0] R0_den, R1_den, R2_den, R3_den, R4_den, R5_den, R6_den, R7_den, R8_den, R9_den, R10_den;
				
		reg signed [15:0] num_tmp0, num_tmp1, num_tmp2, num_tmp3, num_tmp4, num_tmp5, num_tmp6, num_tmp7, num_tmp8;
		reg signed [15:0] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10;
		wire signed [15:0] a_next0, a_next1, a_next2, a_next3, a_next4, a_next5, a_next6, a_next7, a_next8, a_next9, a_next10;
		
		reg signed [31:0] aR_0, aR_1, aR_2, aR_3, aR_4, aR_5, aR_6, aR_7, aR_8, aR_9, aR_10;
		reg signed [31:0] A0_tmp, A1_tmp, A2_tmp, A3_tmp, A4_tmp, A5_tmp, A6_tmp, A7_tmp, A8_tmp, A9_tmp, A10_tmp;
		   
		reg signed [31:0] A, B;
		wire signed [31:0] R, Q;
		wire signed [31:0] Rn, Rd;
		reg signed [31:0] Rd_tmp, k_tmp;
		reg R_update;
		reg div_rst;
		reg div_start;
		wire div_done;
		wire err;
		
		reg rst_numden, v_numden;
		wire vout_numden;
		
		reg rst_rc, v_rc;
		wire vout_rc;
		wire signed [15:0] k, b;
		
		reg rst_cu, v_cu;
		wire vout_cu;
			   
		reg [15:0] state;
		parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5,
				  S6 = 6, S7 = 7, S8 = 8, S9 = 9, S10 = 10, S11 = 11,
				  S12 = 12, S13 = 13, S14 = 14, S15 = 15, S16 = 16,
				  S17 = 17, S18 = 18, S19 = 19, S20 = 20, S21 = 21,
				  S22 = 22, S23 = 23, S24 = 24, S25 = 25, S26 = 26,
				  S27 = 27, S28 = 28, S29 = 29, S30 = 30, S31 = 31,
				  S32 = 32, S33 = 33, S34 = 34, S35 = 35, S36 = 36,
				  S37 = 37, S38 = 38, S39 = 39, S40 = 40, S41 = 41,
				  S42 = 42, S43 = 43, S44 = 44, S45 = 45, S46 = 46,
				  S47 = 47, S48 = 48, S49 = 49, S50 = 50, S51 = 51,
				  S52 = 52, S53 = 53, S54 = 54, S55 = 55, S56 = 56,
				  S57 = 57, S58 = 58, S59 = 59, S60 = 60, S61 = 61,
				  S62 = 62, S63 = 63, S64 = 64, S65 = 65, S66 = 66,
				  S67 = 67, S68 = 68, S69 = 69, S70 = 70, S71 = 71,
				  S72 = 72, S73 = 73, S74 = 74, S75 = 75, S76 = 76,
				  S77 = 77, S78 = 78, S79 = 79, S80 = 80, S81 = 81,
				  S82 = 82, S83 = 83, S84 = 84, S85 = 85, S86 = 86,
				  S87 = 87, S88 = 88, S89 = 89, S90 = 90, S91 = 91,
				  S92 = 92, S93 = 93, S94 = 94, S95 = 95, S96 = 96,
				  S97 = 97, S98 = 98, S99 = 99, S100 = 100, S101 = 101,
				  S102 = 102, S103 = 103, S104 = 104, S105 = 105,
				  S106 = 106, S107 = 107, S108 = 108, S109 = 109,
				  S110 = 110, S111 = 111, S112 = 112, S113 = 113,
				  S114 = 114, S115 = 115, S116 = 116, S117 = 117,
				  S118 = 118, S119 = 119, S120 = 120, S121 = 121,
				  S122 = 122, S123 = 123, S124 = 124, S125 = 125,
				  S126 = 126, S127 = 127, S128 = 128, S129 = 129,
				  S130 = 130, S131 = 131, S132 = 132, S133 = 133,
				  S134 = 134, S135 = 135, S136 = 136, S137 = 137,
				  S138 = 138, S139 = 139, S140 = 140, S141 = 141,
				  S142 = 142, S143 = 143, S144 = 144, S145 = 145,
				  S146 = 146, S147 = 147, S148 = 148, S149 = 149,
				  S150 = 150;
				  
		reg run;
				  			  
		divide div(.A(A),
				   .B(B),
				   .start(div_start),
				   .clk(clk),
				   .rst(rst || div_rst),
				   .Q(Q),
				   .R(R),
				   .err(err),
				   .done(div_done));
				   
		NumDen numden(.R_num0(R0_num),
			  .R_num1(R1_num),
			  .R_num2(R2_num),
			  .R_num3(R3_num),
			  .R_num4(R4_num),
			  .R_num5(R5_num),
			  .R_num6(R6_num),
			  .R_num7(R7_num),
			  .R_num8(R8_num),
			  .R_num9(R9_num),
			  .R_num10(R10_num),
			  .R_den0(R0_den),
			  .R_den1(R1_den),
			  .R_den2(R2_den),
			  .R_den3(R3_den),
			  .R_den4(R4_den),
			  .R_den5(R5_den),
			  .R_den6(R6_den),
			  .R_den7(R7_den),
			  .R_den8(R8_den),
			  .R_den9(R9_den),
			  .R_den10(R10_den),
			  .a0(a0),
			  .a1(a1),
			  .a2(a2),
			  .a3(a3),
			  .a4(a4),
			  .a5(a5),
			  .a6(a6),
			  .a7(a7),
			  .a8(a8),
			  .a9(a9),
			  .a10(a10),
			  .v(v_numden),
			  .clk(clk),
			  .rst(rst || rst_numden),
			  .Rn(Rn),
			  .Rd(Rd),
			  .vout(vout_numden));
			  
		reflect_coeff rc(.k_tmp(k_tmp),
						 .v(v_rc),
					     .clk(clk),
					     .rst(rst || rst_rc),
					     .k(k),
					     .b(b),
					     .vout(vout_rc));
						 
		coeff_update cu(.aL_0(A0_tmp),
						.aL_1(A1_tmp),
						.aL_2(A2_tmp),
						.aL_3(A3_tmp),
						.aL_4(A4_tmp),
						.aL_5(A5_tmp),
						.aL_6(A6_tmp),
						.aL_7(A7_tmp),
						.aL_8(A8_tmp),
						.aL_9(A9_tmp),
						.aL_10(A10_tmp),
						.aR_0(aR_0),
						.aR_1(aR_1),
						.aR_2(aR_2),
						.aR_3(aR_3),
						.aR_4(aR_4),
						.aR_5(aR_5),
						.aR_6(aR_6),
						.aR_7(aR_7),
						.aR_8(aR_8),
						.aR_9(aR_9),
						.aR_10(aR_10),
						.k(k),
						.v(v_cu),
						.clk(clk),
						.rst(rst || rst_cu),
						.a_next0(a_next0),
						.a_next1(a_next1),
						.a_next2(a_next2),
						.a_next3(a_next3),
						.a_next4(a_next4),
						.a_next5(a_next5),
						.a_next6(a_next6),
						.a_next7(a_next7),
						.a_next8(a_next8),
						.a_next9(a_next9),
						.a_next10(a_next10),
						.vout(vout_cu));
			   
		always @(posedge clk)
		begin
			if (run)
			begin
				R0_tmp <= R0_tmp;
				R1_tmp <= R1_tmp;
				R2_tmp <= R2_tmp;
				R3_tmp <= R3_tmp;
				R4_tmp <= R4_tmp;
				R5_tmp <= R5_tmp;
				R6_tmp <= R6_tmp;
				R7_tmp <= R7_tmp;
				R8_tmp <= R8_tmp;
				R9_tmp <= R9_tmp;
				R10_tmp <= R10_tmp;				
			end else
			begin
				R0_tmp <= R0;
				R1_tmp <= R1;
				R2_tmp <= R2;
				R3_tmp <= R3;
				R4_tmp <= R4;
				R5_tmp <= R5;
				R6_tmp <= R6;
				R7_tmp <= R7;
				R8_tmp <= R8;
				R9_tmp <= R9;
				R10_tmp <= R10;
			end
			
		
		
			if (rst)
			begin
				state <= S0;
			end else
			begin
				case (state)
					S0: if (start)
							state <= S1;
						else
							state <= S0;
					S1: if (S1)				// Iteration 1
							state <= S2;
						else
							state <= S1;
					S2: if (S2)
							state <= S3;
						else
							state <= S2;
					S3: if (vout_numden)
							state <= S4;
						else
							state <= S3;
					S4: if (S4)
							state <= S5;
						else
							state <= S4;
					S5: if (S5)
							state <= S6;
						else
							state <= S5;
					S6: if (S6)
							state <= S7;
						else
							state <= S6;
					S7: if (S7)
							state <= S8;
						else
							state <= S7;
					S8: if (div_done)
							state <= S9;
						else
							state <= S8;
					S9: if (S9)
							state <= S10;
						else
							state <= S9;
					S10: if (S10)
							state <= S11;
						 else
							state <= S10;
					S11: if (vout_rc)
							state <= S12;
						 else
							state <= S11;
					S12: if (S12)
							state <= S13;
						 else
							state <= S12;
					S13: if (vout_cu)
							state <= S14;
						 else
							state <= S13;
					S14: if (S14)
							state <= S15;
						 else
							state <= S14;
					S15: if (S15)			// Iteration 2
							state <= S16;
						 else
							state <= S15;
					S16: if (S16)
							state <= S17;
						 else
							state <= S16;
					S17: if(vout_numden)
							state <= S18;
						 else
							state <= S17;
					S18: if (S18)
							state <= S19;
						 else
							state <= S18;
					S19: if (S19)
							state <= S20;
						 else
							state <= S19;
					S20: if (S20)
							state <= S21;
						 else
							state <= S20;
					S21: if (S21)
							state <= S22;
						 else
							state <= S21;
					S22: if (S22)
							state <= S23;
						 else
							state <= S22;
					S23: if (div_done)
							state <= S24;
						 else
							state <= S23;
					S24: if (S24)
							state <= S25;
						 else
							state <= S24;
					S25: if (S25)
							state <= S26;
						 else
							state <= S25;
					S26: if (vout_rc)
							state <= S27;
						 else
							state <= S26;
					S27: if (vout_cu)
							state <= S28;
						 else
							state <= S27;
					S28: if (S28)
							state <= S29;
						 else
							state <= S28;
					S29: if (S29)
							state <= S30;
					     else
							state <= S29;
					S30: if (S30)			// Iteration 3
							state <= S31;
						 else
							state <= S30;
					S31: if (S31)
							state <= S32;
						 else
							state <= S31;
					S32: if (S32)
							state <= S33;
						 else
							state <= S32;
					S33: if (vout_numden)
							state <= S34;
						 else
							state <= S33;
					S34: if (S34)
							state <= S35;
						 else
							state <= S34;
					S35: if (S35)
							state <= S36;
						 else
							state <= S35;
					S36: if (S6)
							state <= S37;
						 else
							state <= S36;
					S37: if (S37)
							state <= S38;
						 else
							state <= S37;
					S38: if (div_done)
							state <= S39;
						 else
							state <= S38;
					S39: if (S39)
							state <= S40;
						 else
							state <= S39;
					S40: if (S40)
							state <= S41;
						 else
							state <= S40;
					S41: if (vout_rc)
							state <= S42;
						 else
							state <= S41;
					S42: if (S42)
							state <= S43;
						 else
							state <= S42;
					S43: if (vout_cu)
							state <= S44;
						 else
							state <= S43;
					S44: if (S44)
							state <= S45;
						 else
							state <= S44;
					S45: if (S45)			// Iteration 4
							state <= S46;
						 else
							state <= S45;
					S46: if (S46)
							state <= S47;
						 else
							state <= S46;
					S47: if (S47)
							state <= S48;
						 else
							state <= S47;
					S48: if (vout_numden)
							state <= S49;
						 else
							state <= S48;
					S49: if (S49)
							state <= S50;
						 else
							state <= S49;
					S50: if (S50)
							state <= S51;
						 else
							state <= S50;
					S51: if (S51)
							state <= S52;
						 else
							state <= S51;
					S52: if (S52)
							state <= S53;
						 else
							state <= S52;
					S53: if (div_done)
							state <= S54;
						 else
							state <= S53;
					S54: if (S54)
							state <= S55;
						 else
							state <= S54;
					S55: if (S55)
							state <= S56;
						 else
							state <= S55;
					S56: if (vout_rc)
							state <= S57;
						 else
							state <= S56;
					S57: if (S57)
							state <= S58;
						 else
							state <= S57;
					S58: if (vout_cu)
							state <= S59;
						 else
							state <= S58;
					S59: if (S59)
							state <= S60;
						 else
							state <= S59;
					S60: if (S60)			// Iteration 5
							state <= S61;
						 else
							state <= S60;
					S61: if (S61)
							state <= S62;
						 else
							state <= S61;
					S62: if (S62)
							state <= S63;
						 else
							state <= S62;
					S63: if (vout_numden)
							state <= S64;
						 else
							state <= S63;
					S64: if (S64)
							state <= S65;
						 else
							state <= S64;
					S65: if (S65)
							state <= S66;
						 else
							state <= S65;
					S66: if (S66)
							state <= S67;
						 else
							state <= S66;
					S67: if (S67)
							state <= S68;
						 else
							state <= S67;
					S68: if (div_done)
							state <= S69;
						 else
							state <= S68;
					S69: if (S69)
							state <= S70;
						 else
							state <= S69;
					S70: if (S70)
							state <= S71;
						 else
							state <= S70;
					S71: if (vout_rc)
							state <= S72;
						 else
							state <= S71;
					S72: if (S72)
							state <= S73;
						 else
							state <= S72;
					S73: if (vout_cu)
							state <= S74;
						 else
							state <= S73;
					S74: if (S74)
							state <= S75;
						 else
							state <= S74;
					S75: if (S75)			// Iteration 6
							state <= S76;
						 else
							state <= S75;
					S76: if (S76)
							state <= S77;
						 else
							state <= S76;
					S77: if (S77)
							state <= S78;
						 else
							state <= S77;
					S78: if (vout_numden)
							state <= S79;
						 else
							state <= S78;
					S79: if (S79)
							state <= S80;
						 else
							state <= S79;
					S80: if (S80)
							state <= S81;
						 else
							state <= S80;
					S81: if (S81)
							state <= S82;
						 else
							state <= S81;
					S82: if (S82)
							state <= S83;
						 else
							state <= S82;
					S83: if (div_done)
							state <= S84;
						 else
							state <= S83;
					S84: if (S84)
							state <= S85;
						 else
							state <= S84;
					S85: if (S85)
							state <= S86;
						 else
							state <= S85;
					S86: if (vout_rc)
							state <= S87;
						 else
							state <= S86;
					S87: if (S87)
							state <= S88;
						 else
							state <= S87;
					S88: if (vout_cu)
							state <= S89;
						 else
							state <= S88;
					S89: if (S89)
							state <= S90;
						 else
							state <= S89;
					S90: if (S90)			// Iteration 7
							state <= S91;
						 else
							state <= S90;
					S91: if (S91)
							state <= S92;
						 else
							state <= S91;
					S92: if (S92)
							state <= S93;
						 else
							state <= S92;
					S93: if (vout_numden)
							state <= S94;
						 else
							state <= S93;
					S94: if (S94)
							state <= S95;
						 else
							state <= S94;
					S95: if (S95)
							state <= S96;
						 else
							state <= S95;
					S96: if (S96)
							state <= S97;
						 else
							state <= S96;
					S97: if (S97)
							state <= S98;
						 else
							state <= S97;
					S98: if (div_done)
							state <= S99;
						 else
							state <= S98;
					S99: if (S99)
							state <= S100;
						 else
							state <= S99;
					S100: if (S100)
							state <= S101;
						  else
							state <= S100;
					S101: if (vout_rc)
							state <= S102;
						  else
							state <= S101;
					S102: if (S102)
							state <= S103;
						  else
							state <= S102;
					S103: if (vout_cu)
							state <= S104;
						  else
							state <= S103;
					S104: if (S104)
							state <= S105;
						  else
							state <= S104;
					S105: if (S105)			// Iteration 8
							state <= S106;
						 else
							state <= S105;
					S106: if (S106)
							state <= S107;
						 else
							state <= S106;
					S107: if (S107)
							state <= S108;
						 else
							state <= S107;
					S108: if (vout_numden)
							state <= S109;
						 else
							state <= S108;
					S109: if (S109)
							state <= S110;
						 else
							state <= S109;
					S110: if (S110)
							state <= S111;
						 else
							state <= S110;
					S111: if (S111)
							state <= S112;
						 else
							state <= S111;
					S112: if (S112)
							state <= S113;
						 else
							state <= S112;
					S113: if (div_done)
							state <= S114;
						 else
							state <= S113;
					S114: if (S114)
							state <= S115;
						 else
							state <= S114;
					S115: if (S115)
							state <= S116;
						  else
							state <= S115;
					S116: if (vout_rc)
							state <= S117;
						  else
							state <= S116;
					S117: if (S117)
							state <= S118;
						  else
							state <= S117;
					S118: if (vout_cu)
							state <= S119;
						  else
							state <= S118;
					S119: if (S119)
							state <= S120;
						  else
							state <= S119;
					S120: if (S120)			// Iteration 9
							state <= S121;
						 else
							state <= S120;
					S121: if (S121)
							state <= S122;
						 else
							state <= S121;
					S122: if (S122)
							state <= S123;
						 else
							state <= S122;
					S123: if (vout_numden)
							state <= S124;
						 else
							state <= S123;
					S124: if (S124)
							state <= S125;
						 else
							state <= S124;
					S125: if (S125)
							state <= S126;
						 else
							state <= S125;
					S126: if (S126)
							state <= S127;
						 else
							state <= S126;
					S127: if (S127)
							state <= S128;
						 else
							state <= S127;
					S128: if (div_done)
							state <= S129;
						 else
							state <= S128;
					S129: if (S129)
							state <= S130;
						 else
							state <= S129;
					S130: if (S130)
							state <= S131;
						  else
							state <= S130;
					S131: if (vout_rc)
							state <= S132;
						  else
							state <= S131;
					S132: if (S132)
							state <= S133;
						  else
							state <= S132;
					S133: if (vout_cu)
							state <= S134;
						  else
							state <= S133;
					S134: if (S134)
							state <= S135;
						  else
							state <= S134;
					S135: if (S135)			// Iteration 10
							state <= S136;
						 else
							state <= S135;
					S136: if (S136)
							state <= S137;
						 else
							state <= S136;
					S137: if (S137)
							state <= S138;
						 else
							state <= S137;
					S138: if (vout_numden)
							state <= S139;
						 else
							state <= S138;
					S139: if (S139)
							state <= S140;
						 else
							state <= S139;
					S140: if (S140)
							state <= S141;
						 else
							state <= S140;
					S141: if (S141)
							state <= S142;
						 else
							state <= S141;
					S142: if (S142)
							state <= S143;
						 else
							state <= S142;
					S143: if (div_done)
							state <= S144;
						 else
							state <= S143;
					S144: if (S144)
							state <= S145;
						 else
							state <= S144;
					S145: if (S145)
							state <= S146;
						  else
							state <= S145;
					S146: if (vout_rc)
							state <= S147;
						  else
							state <= S146;
					S147: if (S147)
							state <= S148;
						  else
							state <= S147;
					S148: if (vout_cu)
							state <= S149;
						  else
							state <= S148;
					S149: if (S149)
							state <= S150;
						  else
							state <= S149;
				endcase
			end
		end
			
		always @(posedge clk)
		begin
			case (state)
				S0: begin
						A0 <= 16'b0;
						A1 <= 16'b0;
						A2 <= 16'b0;
						A3 <= 16'b0;
						A4 <= 16'b0;
						A5 <= 16'b0;
						A6 <= 16'b0;
						A7 <= 16'b0;
						A8 <= 16'b0;
						A9 <= 16'b0;
						A10 <= 16'b0;
						run <= 1'b0;
						done <= 1'b0;
						div_rst <= 1'b0;
						div_start <= 1'b0;
						v_numden <= 1'b0;
						v_rc <= 1'b0;
						v_cu <= 1'b0;
						rst_numden <= 1'b0;
						rst_rc <= 1'b0;
						rst_cu <= 1'b0;
						A <= 1'b0;
						B <= 1'b0;
						R0_num <= 16'b0;
						R1_num <= 16'b0;
						R2_num <= 16'b0;
						R3_num <= 16'b0;
						R4_num <= 16'b0;
						R5_num <= 16'b0;
						R6_num <= 16'b0;
						R7_num <= 16'b0;
						R8_num <= 16'b0;
						R9_num <= 16'b0;
						R10_num <= 16'b0;
						R0_den <= 16'b0;
						R1_den <= 16'b0;
						R2_den <= 16'b0;
						R3_den <= 16'b0;
						R4_den <= 16'b0;
						R5_den <= 16'b0;
						R6_den <= 16'b0;
						R7_den <= 16'b0;
						R8_den <= 16'b0;
						R9_den <= 16'b0;
						R10_den <= 16'b0;
						a0 <= 16'b0;
						a1 <= 16'b0;
						a2 <= 16'b0;
						a3 <= 16'b0;
						a4 <= 16'b0;
						a5 <= 16'b0;
						a6 <= 16'b0;
						a7 <= 16'b0;
						a8 <= 16'b0;
						a9 <= 16'b0;
						a10 <= 32'b0;
						aR_0 <= 32'b0;
						aR_1 <= 32'b0;
						aR_2 <= 32'b0;
						aR_3 <= 32'b0;
						aR_4 <= 32'b0;
						aR_5 <= 32'b0;
						aR_6 <= 32'b0;
						aR_7 <= 32'b0;
						aR_8 <= 32'b0;
						aR_9 <= 32'b0;
						aR_10 <= 32'b0;
						A0_tmp <= 32'b0;
						A1_tmp <= 32'b0;
						A2_tmp <= 32'b0;
						A3_tmp <= 32'b0;
						A4_tmp <= 32'b0;
						A5_tmp <= 32'b0;
						A6_tmp <= 32'b0;
						A7_tmp <= 32'b0;
						A8_tmp <= 32'b0;
						A9_tmp <= 32'b0;
						A10_tmp <= 32'b0;
					end
				S1: begin // Iteration 1
						run <= 1'b1;
					end
				S2: begin
						R0_num   <= R1_tmp;
						R1_num   <= R0_tmp;
						
						R0_den <= R0_tmp;
						R1_den <= R1_tmp;
						a0 <= 16'd8192;
						A0_tmp <= 32'd8192;
						v_numden <= 1'b1;
					end
				S3: begin
						v_numden <= 1'b0;
					end
				S4: Rd_tmp <= Rd + 16'h4000;
				S5: Rd_tmp <= Rd_tmp >>> 15;
				S6: begin
						A <= -Rn;
						B <= Rd_tmp;
					end
				S7: div_start <= 1'b1;
				S8: div_start <= 1'b0;
				S9: begin
						k_tmp <= Q;
						div_rst <= 1'b1;
					end
				S10: begin
						v_rc <= 1'b1;
						div_rst <= 1'b0;
					 end
				S11: v_rc <= 1'b0;
				S12: v_cu <= 1'b1;
				S13: v_cu <= 1'b0;
				S14: begin 
						a0 <= a_next0;
						a1 <= b;
						A0_tmp <= a_next0;
						A1_tmp <= b;
						rst_cu <= 1'b1;
					 end
				S15: begin 		// Iteration 2
						R0_num <= R2_tmp;
						R1_num <= R1_tmp;
						R2_num <= R0_tmp;
						
						R0_den <= R0_tmp;
						R1_den <= R1_tmp;
						R2_den <= R2_tmp;
						rst_cu <= 1'b0;
					 end
				S16: ;
				S17: v_numden <= 1'b1;
				S18: v_numden <= 1'b0;
				S19: Rd_tmp <= Rd + 16'h4000;
				S20: Rd_tmp <= Rd_tmp >>> 15;
				S21: begin
						A <= -Rn;
						B <= Rd_tmp;
					end
				S22: div_start <= 1'b1;
				S23: div_start <= 1'b0;
				S24: begin
						k_tmp <= Q;
						div_rst <= 1'b1;
						aR_1 <= a1;
					 end
				S25: begin
						v_rc <= 1'b1;
						div_rst <= 1'b0;
					 end
				S26: v_rc <= 1'b0;
				S27: v_cu <= 1'b1;
				S28: v_cu <= 1'b0;
				S29: begin 
						a0 <= a_next0;
						a1 <= a_next1;
						a2 <= b;
						A0_tmp <= a_next0;
						A1_tmp <= a_next1;
						A2_tmp <= b;
						rst_cu <= 1'b1;
					 end
				S30: begin 		// Iteration 3
						R0_num <= R3_tmp;
						R1_num <= R2_tmp;
						R2_num <= R1_tmp;
						R3_num <= R0_tmp;
						
						R0_den <= R0_tmp;
						R1_den <= R1_tmp;
						R2_den <= R2_tmp;
						R3_den <= R3_tmp;
						rst_cu <= 1'b0;
					 end
				S31: ;
				S32: v_numden <= 1'b1;
				S33: v_numden <= 1'b0;
				S34: Rd_tmp <= Rd + 16'h4000;
				S35: Rd_tmp <= Rd_tmp >>> 15;
				S36: begin
						A <= -Rn;
						B <= Rd_tmp;
					end
				S37: div_start <= 1'b1;
				S38: div_start <= 1'b0;
				S39: begin
						k_tmp <= Q;
						div_rst <= 1'b1;
						aR_1 <= a2;
						aR_2 <= a1;
					 end
				S40: begin
						v_rc <= 1'b1;
						div_rst <= 1'b0;
					 end
				S41: v_rc <= 1'b0;
				S42: v_cu <= 1'b1;
				S43: v_cu <= 1'b0;
				S44: begin 
						a0 <= a_next0;
						a1 <= a_next1;
						a2 <= a_next2;
						a3 <= b;
						A0_tmp <= a_next0;
						A1_tmp <= a_next1;
						A2_tmp <= a_next2;
						A3_tmp <= b;
						rst_cu <= 1'b1;
					 end
				S45: begin 		// Iteration 4
						R0_num <= R4_tmp;
						R1_num <= R3_tmp;
						R2_num <= R2_tmp;
						R3_num <= R1_tmp;
						R4_num <= R0_tmp;
						
						R0_den <= R0_tmp;
						R1_den <= R1_tmp;
						R2_den <= R2_tmp;
						R3_den <= R3_tmp;
						R4_den <= R4_tmp;
						rst_cu <= 1'b0;
					 end
				S46: ;
				S47: v_numden <= 1'b1;
				S48: v_numden <= 1'b0;
				S49: Rd_tmp <= Rd + 16'h4000;
				S50: Rd_tmp <= Rd_tmp >>> 15;
				S51: begin
						A <= -Rn;
						B <= Rd_tmp;
					end
				S52: div_start <= 1'b1;
				S53: div_start <= 1'b0;
				S54: begin
						k_tmp <= Q;
						div_rst <= 1'b1;
						aR_1 <= a3;
						aR_2 <= a2;
						aR_3 <= a1;
					 end
				S55: begin
						v_rc <= 1'b1;
						div_rst <= 1'b0;
					 end
				S56: v_rc <= 1'b0;
				S57: v_cu <= 1'b1;
				S58: v_cu <= 1'b0;
				S59: begin 
						a0 <= a_next0;
						a1 <= a_next1;
						a2 <= a_next2;
						a3 <= a_next3;
						a4 <= b;
						A0_tmp <= a_next0;
						A1_tmp <= a_next1;
						A2_tmp <= a_next2;
						A3_tmp <= a_next3;
						A4_tmp <= b;
						rst_cu <= 1'b1;
					 end
				S60: begin 		// Iteration 5
						R0_num <= R5_tmp;
						R1_num <= R4_tmp;
						R2_num <= R3_tmp;
						R3_num <= R2_tmp;
						R4_num <= R1_tmp;
						R5_num <= R0_tmp;
						
						R0_den <= R0_tmp;
						R1_den <= R1_tmp;
						R2_den <= R2_tmp;
						R3_den <= R3_tmp;
						R4_den <= R4_tmp;
						R5_den <= R5_tmp;
						rst_cu <= 1'b0;
					 end
				S61: ;
				S62: v_numden <= 1'b1;
				S63: v_numden <= 1'b0;
				S64: Rd_tmp <= Rd + 16'h4000;
				S65: Rd_tmp <= Rd_tmp >>> 15;
				S66: begin
						A <= -Rn;
						B <= Rd_tmp;
					end
				S67: div_start <= 1'b1;
				S68: div_start <= 1'b0;
				S69: begin
						k_tmp <= Q;
						div_rst <= 1'b1;
						aR_1 <= a4;
						aR_2 <= a3;
						aR_3 <= a2;
						aR_4 <= a1;
					 end
				S70: begin
						v_rc <= 1'b1;
						div_rst <= 1'b0;
					 end
				S71: v_rc <= 1'b0;
				S72: v_cu <= 1'b1;
				S73: v_cu <= 1'b0;
				S74: begin 
						a0 <= a_next0;
						a1 <= a_next1;
						a2 <= a_next2;
						a3 <= a_next3;
						a4 <= a_next4;
						a5 <= b;
						A0_tmp <= a_next0;
						A1_tmp <= a_next1;
						A2_tmp <= a_next2;
						A3_tmp <= a_next3;
						A4_tmp <= a_next4;
						A5_tmp <= b;
						rst_cu <= 1'b1;
					 end
				S75: begin 		// Iteration 6
						R0_num <= R6_tmp;
						R1_num <= R5_tmp;
						R2_num <= R4_tmp;
						R3_num <= R3_tmp;
						R4_num <= R2_tmp;
						R5_num <= R1_tmp;
						R6_num <= R0_tmp;
						
						R0_den <= R0_tmp;
						R1_den <= R1_tmp;
						R2_den <= R2_tmp;
						R3_den <= R3_tmp;
						R4_den <= R4_tmp;
						R5_den <= R5_tmp;
						R6_den <= R6_tmp;
						rst_cu <= 1'b0;
					 end
				S76: ;
				S77: v_numden <= 1'b1;
				S78: v_numden <= 1'b0;
				S79: Rd_tmp <= Rd + 16'h4000;
				S80: Rd_tmp <= Rd_tmp >>> 15;
				S81: begin
						A <= -Rn;
						B <= Rd_tmp;
					end
				S82: div_start <= 1'b1;
				S83: div_start <= 1'b0;
				S84: begin
						k_tmp <= Q;
						div_rst <= 1'b1;
						aR_1 <= a5;
						aR_2 <= a4;
						aR_3 <= a3;
						aR_4 <= a2;
						aR_5 <= a1;
					 end
				S85: begin
						v_rc <= 1'b1;
						div_rst <= 1'b0;
					 end
				S86: v_rc <= 1'b0;
				S87: v_cu <= 1'b1;
				S88: v_cu <= 1'b0;
				S89: begin 
						a0 <= a_next0;
						a1 <= a_next1;
						a2 <= a_next2;
						a3 <= a_next3;
						a4 <= a_next4;
						a5 <= a_next5;
						a6 <= b;
						A0_tmp <= a_next0;
						A1_tmp <= a_next1;
						A2_tmp <= a_next2;
						A3_tmp <= a_next3;
						A4_tmp <= a_next4;
						A5_tmp <= a_next5;
						A6_tmp <= b;
						rst_cu <= 1'b1;
					 end
				S90: begin 		// Iteration 7
						R0_num <= R7_tmp;
						R1_num <= R6_tmp;
						R2_num <= R5_tmp;
						R3_num <= R4_tmp;
						R4_num <= R3_tmp;
						R5_num <= R2_tmp;
						R6_num <= R1_tmp;
						R7_num <= R0_tmp;
						
						R0_den <= R0_tmp;
						R1_den <= R1_tmp;
						R2_den <= R2_tmp;
						R3_den <= R3_tmp;
						R4_den <= R4_tmp;
						R5_den <= R5_tmp;
						R6_den <= R6_tmp;
						R7_den <= R7_tmp;
						rst_cu <= 1'b0;
					 end
				S91: ;
				S92: v_numden <= 1'b1;
				S93: v_numden <= 1'b0;
				S94: Rd_tmp <= Rd + 16'h4000;
				S95: Rd_tmp <= Rd_tmp >>> 15;
				S96: begin
						A <= -Rn;
						B <= Rd_tmp;
					end
				S97: div_start <= 1'b1;
				S98: div_start <= 1'b0;
				S99: begin
						k_tmp <= Q;
						div_rst <= 1'b1;
						aR_1 <= a6;
						aR_2 <= a5;
						aR_3 <= a4;
						aR_4 <= a3;
						aR_5 <= a2;
						aR_6 <= a1;
					 end
				S100: begin
						v_rc <= 1'b1;
						div_rst <= 1'b0;
					 end
				S101: v_rc <= 1'b0;
				S102: v_cu <= 1'b1;
				S103: v_cu <= 1'b0;
				S104: begin 
						a0 <= a_next0;
						a1 <= a_next1;
						a2 <= a_next2;
						a3 <= a_next3;
						a4 <= a_next4;
						a5 <= a_next5;
						a6 <= a_next6;
						a7 <= b;
						A0_tmp <= a_next0;
						A1_tmp <= a_next1;
						A2_tmp <= a_next2;
						A3_tmp <= a_next3;
						A4_tmp <= a_next4;
						A5_tmp <= a_next5;
						A6_tmp <= a_next6;
						A7_tmp <= b;
						rst_cu <= 1'b1;
					 end
				S105: begin 		// Iteration 8
						R0_num <= R8_tmp;
						R1_num <= R7_tmp;
						R2_num <= R6_tmp;
						R3_num <= R5_tmp;
						R4_num <= R4_tmp;
						R5_num <= R3_tmp;
						R6_num <= R2_tmp;
						R7_num <= R1_tmp;
						R8_num <= R0_tmp;
						
						R0_den <= R0_tmp;
						R1_den <= R1_tmp;
						R2_den <= R2_tmp;
						R3_den <= R3_tmp;
						R4_den <= R4_tmp;
						R5_den <= R5_tmp;
						R6_den <= R6_tmp;
						R7_den <= R7_tmp;
						R8_den <= R8_tmp;
						rst_cu <= 1'b0;
					 end
				S106: ;
				S107: v_numden <= 1'b1;
				S108: v_numden <= 1'b0;
				S109: Rd_tmp <= Rd + 16'h4000;
				S110: Rd_tmp <= Rd_tmp >>> 15;
				S111: begin
						A <= -Rn;
						B <= Rd_tmp;
					end
				S112: div_start <= 1'b1;
				S113: div_start <= 1'b0;
				S114: begin
						k_tmp <= Q;
						div_rst <= 1'b1;
						aR_1 <= a7;
						aR_2 <= a6;
						aR_3 <= a5;
						aR_4 <= a4;
						aR_5 <= a3;
						aR_6 <= a2;
						aR_7 <= a1;
					 end
				S115: begin
						v_rc <= 1'b1;
						div_rst <= 1'b0;
					 end
				S116: v_rc <= 1'b0;
				S117: v_cu <= 1'b1;
				S118: v_cu <= 1'b0;
				S119: begin 
						a0 <= a_next0;
						a1 <= a_next1;
						a2 <= a_next2;
						a3 <= a_next3;
						a4 <= a_next4;
						a5 <= a_next5;
						a6 <= a_next6;
						a7 <= a_next7;
						a8 <= b;
						A0_tmp <= a_next0;
						A1_tmp <= a_next1;
						A2_tmp <= a_next2;
						A3_tmp <= a_next3;
						A4_tmp <= a_next4;
						A5_tmp <= a_next5;
						A6_tmp <= a_next6;
						A7_tmp <= a_next7;
						A8_tmp <= b;
						rst_cu <= 1'b1;
					 end
				S120: begin 		// Iteration 9
						R0_num <= R9_tmp;
						R1_num <= R8_tmp;
						R2_num <= R7_tmp;
						R3_num <= R6_tmp;
						R4_num <= R5_tmp;
						R5_num <= R4_tmp;
						R6_num <= R3_tmp;
						R7_num <= R2_tmp;
						R8_num <= R1_tmp;
						R9_num <= R0_tmp;
						
						R0_den <= R0_tmp;
						R1_den <= R1_tmp;
						R2_den <= R2_tmp;
						R3_den <= R3_tmp;
						R4_den <= R4_tmp;
						R5_den <= R5_tmp;
						R6_den <= R6_tmp;
						R7_den <= R7_tmp;
						R8_den <= R8_tmp;
						R9_den <= R9_tmp;
						rst_cu <= 1'b0;
					 end
				S121: ;
				S122: v_numden <= 1'b1;
				S123: v_numden <= 1'b0;
				S124: Rd_tmp <= Rd + 16'h4000;
				S125: Rd_tmp <= Rd_tmp >>> 15;
				S126: begin
						A <= -Rn;
						B <= Rd_tmp;
					end
				S127: div_start <= 1'b1;
				S128: div_start <= 1'b0;
				S129: begin
						k_tmp <= Q;
						div_rst <= 1'b1;
						aR_1 <= a8;
						aR_2 <= a7;
						aR_3 <= a6;
						aR_4 <= a5;
						aR_5 <= a4;
						aR_6 <= a3;
						aR_7 <= a2;
						aR_8 <= a1;
					 end
				S130: begin
						v_rc <= 1'b1;
						div_rst <= 1'b0;
					 end
				S131: v_rc <= 1'b0;
				S132: v_cu <= 1'b1;
				S133: v_cu <= 1'b0;
				S134: begin 
						a0 <= a_next0;
						a1 <= a_next1;
						a2 <= a_next2;
						a3 <= a_next3;
						a4 <= a_next4;
						a5 <= a_next5;
						a6 <= a_next6;
						a7 <= a_next7;
						a8 <= a_next8;
						a9 <= b;
						A0_tmp <= a_next0;
						A1_tmp <= a_next1;
						A2_tmp <= a_next2;
						A3_tmp <= a_next3;
						A4_tmp <= a_next4;
						A5_tmp <= a_next5;
						A6_tmp <= a_next6;
						A7_tmp <= a_next7;
						A8_tmp <= a_next8;
						A9_tmp <= b;
						rst_cu <= 1'b1;
					 end
				S135: begin 		// Iteration 10
						R0_num <= R10_tmp;
						R1_num <= R9_tmp;
						R2_num <= R8_tmp;
						R3_num <= R7_tmp;
						R4_num <= R6_tmp;
						R5_num <= R5_tmp;
						R6_num <= R4_tmp;
						R7_num <= R3_tmp;
						R8_num <= R2_tmp;
						R9_num <= R1_tmp;
						R10_num <= R0_tmp;
						
						R0_den <= R0_tmp;
						R1_den <= R1_tmp;
						R2_den <= R2_tmp;
						R3_den <= R3_tmp;
						R4_den <= R4_tmp;
						R5_den <= R5_tmp;
						R6_den <= R6_tmp;
						R7_den <= R7_tmp;
						R8_den <= R8_tmp;
						R9_den <= R9_tmp;
						rst_cu <= 1'b0;
					 end
				S136: ;
				S137: v_numden <= 1'b1;
				S138: v_numden <= 1'b0;
				S139: Rd_tmp <= Rd + 16'h4000;
				S140: Rd_tmp <= Rd_tmp >>> 15;
				S141: begin
						A <= -Rn;
						B <= Rd_tmp;
					end
				S142: div_start <= 1'b1;
				S143: div_start <= 1'b0;
				S144: begin
						k_tmp <= Q;
						div_rst <= 1'b1;
						aR_1 <= a9;
						aR_2 <= a8;
						aR_3 <= a7;
						aR_4 <= a6;
						aR_5 <= a5;
						aR_6 <= a4;
						aR_7 <= a3;
						aR_8 <= a2;
						aR_9 <= a1;
					 end
				S145: begin
						v_rc <= 1'b1;
						div_rst <= 1'b0;
					 end
				S146: v_rc <= 1'b0;
				S147: v_cu <= 1'b1;
				S148: v_cu <= 1'b0;
				S149: begin 
						a0 <= a_next0;
						a1 <= a_next1;
						a2 <= a_next2;
						a3 <= a_next3;
						a4 <= a_next4;
						a5 <= a_next5;
						a6 <= a_next6;
						a7 <= a_next7;
						a8 <= a_next8;
						a9 <= a_next9;
						a10 <= b;
						rst_cu <= 1'b1;
					 end
				S150: begin
						run <= 1'b0;
						done <= 1'b1;
						A0 <= a0;
						A1 <= a1;
						A2 <= a2;
						A3 <= a3;
						A4 <= a4;
						A5 <= a5;
						A6 <= a6;
						A7 <= a7;
						A8 <= a8;
						A9 <= a9;
						A10 <= a10;
						A0_tmp <= a_next0;
						A1_tmp <= a_next1;
						A2_tmp <= a_next2;
						A3_tmp <= a_next3;
						A4_tmp <= a_next4;
						A5_tmp <= a_next5;
						A6_tmp <= a_next6;
						A7_tmp <= a_next7;
						A8_tmp <= a_next8;
						A9_tmp <= a_next9;
						A10_tmp <= a_next10;
					end
				default: begin
							A0 <= 16'b0;
							A1 <= 16'b0;
							A2 <= 16'b0;
							A3 <= 16'b0;
							A4 <= 16'b0;
							A5 <= 16'b0;
							A6 <= 16'b0;
							A7 <= 16'b0;
							A8 <= 16'b0;
							A9 <= 16'b0;
							A10 <= 16'b0;
							run <= 1'b0;
							done <= 1'b0;
							div_rst <= 1'b0;
							div_start <= 1'b0;
							v_numden <= 1'b0;
							v_rc <= 1'b0;
							v_cu <= 1'b0;
							rst_numden <= 1'b0;
							rst_rc <= 1'b0;
							rst_cu <= 1'b0;
							A <= 1'b0;
							B <= 1'b0;
							R0_num <= 16'b0;
							R1_num <= 16'b0;
							R2_num <= 16'b0;
							R3_num <= 16'b0;
							R4_num <= 16'b0;
							R5_num <= 16'b0;
							R6_num <= 16'b0;
							R7_num <= 16'b0;
							R8_num <= 16'b0;
							R9_num <= 16'b0;
							R10_num <= 16'b0;
							R0_den <= 16'b0;
							R1_den <= 16'b0;
							R2_den <= 16'b0;
							R3_den <= 16'b0;
							R4_den <= 16'b0;
							R5_den <= 16'b0;
							R6_den <= 16'b0;
							R7_den <= 16'b0;
							R8_den <= 16'b0;
							R9_den <= 16'b0;
							R10_den <= 16'b0;
							a0 <= 16'b0;
							a1 <= 16'b0;
							a2 <= 16'b0;
							a3 <= 16'b0;
							a4 <= 16'b0;
							a5 <= 16'b0;
							a6 <= 16'b0;
							a7 <= 16'b0;
							a8 <= 16'b0;
							a9 <= 16'b0;
							a10 <= 32'b0;
							aR_0 <= 32'b0;
							aR_1 <= 32'b0;
							aR_2 <= 32'b0;
							aR_3 <= 32'b0;
							aR_4 <= 32'b0;
							aR_5 <= 32'b0;
							aR_6 <= 32'b0;
							aR_7 <= 32'b0;
							aR_8 <= 32'b0;
							aR_9 <= 32'b0;
							aR_10 <= 32'b0;
							A0_tmp <= 32'b0;
							A1_tmp <= 32'b0;
							A2_tmp <= 32'b0;
							A3_tmp <= 32'b0;
							A4_tmp <= 32'b0;
							A5_tmp <= 32'b0;
							A6_tmp <= 32'b0;
							A7_tmp <= 32'b0;
							A8_tmp <= 32'b0;
							A9_tmp <= 32'b0;
							A10_tmp <= 32'b0;
						end
			endcase
		end
endmodule
			
			   
			   