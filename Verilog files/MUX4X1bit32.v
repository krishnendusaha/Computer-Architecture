`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:19:55 10/30/2013 
// Design Name: 
// Module Name:    MUX4X1bit32 
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
module MUX4X1bit32(
    input [31:0] port0,
    input [31:0] port1,
    input [31:0] port2,
    input [31:0] port3,
    input [1:0] sel,
    output [31:0] out
    );
reg[31:0]  temp;
always@(*)
begin
    case(sel)
	 2'b00: temp=port0;
	 2'b01: temp=port1;
	 2'b10: temp=port2;
	 2'b11: temp=port3;
	 endcase
end

assign out=temp;

endmodule
