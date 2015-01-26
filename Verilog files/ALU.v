`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:14:42 10/28/2013 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(
    input [31:0] operand1,
    input [31:0] operand2,
    input [4:0] control_signal,
	 input [4:0] sh_amt,
    output [31:0] aluout,
    output[3:0] flags
    );
wire[31:0] shift_out,arith_out,logic_out;
wire[31:0] m;
wire z_flag,carry_flag,sign_flag,overflow_flag;

ARITHMETIC_ALU AU(operand1,operand2,arith_out,control_signal[2],z_flag,carry_flag,sign_flag,overflow_flag);
LOGIC_ALU LU(operand1,operand2,logic_out,control_signal[2]);
SHIFTER__ALU SU(operand1,sh_amt,operand2[4:0],shift_out,control_signal[1:0],control_signal[2]);


assign m=control_signal[3]?arith_out:shift_out;
assign aluout=control_signal[4]?logic_out:m;

assign flags[3]=z_flag;
assign flags[2]=sign_flag;
assign flags[1]=carry_flag;
assign flags[0]=overflow_flag; 

  

endmodule
