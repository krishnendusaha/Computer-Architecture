`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:26:53 10/28/2013 
// Design Name: 
// Module Name:    ARITHMETIC_ALU 
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
module ARITHMETIC_ALU(
    input [31:0] operand1,
    input [31:0] operand2,
    output [31:0] alu_out,
    input sel,
    output zflag,
    output carryflag,
    output signflag ,
    output overflowflag
    );
wire[31:0]  adder_out,comp_out;
wire  carry_flag1,overflow_flag1;  
reg z_flg,sign_flag1;
integer i;
Arithmetic_complement A1(operand2,comp_out);
Arithmetic_adder A2(operand1,operand2,adder_out,carry_flag1,overflow_flag1);

initial
begin
 z_flg=0;
end
always@(*)
begin
for(i=0;i<32;i=i+1)
z_flg=z_flg|adder_out[i];

sign_flag1=adder_out[31];
end

assign zflag=~z_flg;
assign signflag=sign_flag1;
assign carryflag=carry_flag1;
assign overflowflag=overflow_flag1; 
assign alu_out=sel?comp_out:adder_out;
        
endmodule
