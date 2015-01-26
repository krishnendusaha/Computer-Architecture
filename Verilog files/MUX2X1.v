`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:44:32 10/30/2013 
// Design Name: 
// Module Name:    MUX2X1bit5 
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
module MUX2X1bit5(
    input [4:0] port0,
    input [4:0] port1,
    input sel,
    output [4:0] out
    );

assign out=sel?port1:port0;

endmodule
