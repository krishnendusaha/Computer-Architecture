`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:35:47 10/28/2013 
// Design Name: 
// Module Name:    Arithmetic_complement 
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
module Arithmetic_complement(
    input [31:0] operand,
    output [31:0] comp_out
    );
integer i=0,flag=0;
reg[31:0] comp2;


always @(*)
begin
for(i=0;i<32;i=i+1)
begin
if(flag==0)
comp2[i]=operand[i];
else
comp2[i]=~operand[i];

if(operand[i]==1) flag=1;
end
flag=0;
end
assign comp_out=comp2;

endmodule
