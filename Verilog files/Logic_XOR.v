`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:14:05 10/28/2013 
// Design Name: 
// Module Name:    Logic_XOR 
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
module Logic_XOR(
    input [31:0] operand1,
    input [31:0] operand2,
    output [31:0] xor_out
    );

assign xor_out=operand1^operand2;

endmodule
