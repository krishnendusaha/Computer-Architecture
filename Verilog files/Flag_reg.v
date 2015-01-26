`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:08:16 11/06/2013 
// Design Name: 
// Module Name:    Flag_reg 
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
module Flag_reg(
    input [3:0] in,
    output [3:0] out,
    input clk
    );
reg[3:0]  flags;
reg[3:0]  temp;
always@(posedge clk)
begin
  flags=in;
  #5 temp=flags;
end


assign  out=temp;

endmodule
