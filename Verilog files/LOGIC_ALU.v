`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:45:18 10/28/2013 
// Design Name: 
// Module Name:    LOGIC_ALU 
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
module LOGIC_ALU(
    input [31:0] operand1,
    input [31:0] operand2,
    output [31:0] logic_out,
    input sel
    );

wire[31:0]  and_out;
wire[31:0]  xor_out;

Logic_AND L1(operand1,operand2,and_out);
Logic_XOR L2(operand1,operand2,xor_out);


assign logic_out=sel?xor_out:and_out; 

endmodule
