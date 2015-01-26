`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:44:06 11/02/2013 
// Design Name: 
// Module Name:    Sign_Extension 
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
module Sign_Extension(
    input [15:0] operand,
    output [31:0] SE_val
    );
reg[31:0]  temp;
always@(operand)
begin
  if(operand[15]==0)
  temp={{16{1'b0}},operand};
  else
  temp={{16{1'b1}},operand};
end
assign SE_val=temp;
endmodule
