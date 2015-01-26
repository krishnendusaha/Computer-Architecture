`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:41:37 10/28/2013 
// Design Name: 
// Module Name:    Arithmetic_adder 
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
module Arithmetic_adder(
    input [31:0] operand1,
    input [31:0] operand2,
    output [31:0] adder_out,
    output carry_flag,
    output overflow_flag
    );
wire[32:0] c;
genvar i;
assign carry_flag=c[32];
assign c[0]=0;
generate 
	for(i=0;i<=31;i=i+1) begin:FADDER
	    (* KEEP_HIERARCHY = "TRUE"*)
		full_adder FA(operand1[i],operand2[i],c[i],adder_out[i],c[i+1]);
	end

endgenerate

xor(overflow_flag,c[32],c[31]);
endmodule
