`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:44:58 10/30/2013 
// Design Name: 
// Module Name:    PC_Reg 
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
module PC_Reg(
    input [9:0] Next_PC,
    output [9:0] Iaddr
    );
reg[9:0] next_instr;
reg[9:0]  temp;

initial 
begin
   next_instr=0;
end

//always@(negedge clk )
//begin
  //   next_instr=Next_PC;
	//  #5;   temp=next_instr;

//end

//always@(posedge clk)
//begin
   //(rst) next_instr=0;
  //   temp=next_instr;
//end


always@(Next_PC)
begin
    next_instr=Next_PC;
end

always@(next_instr)
begin
    temp=next_instr;
end

assign  Iaddr=temp;
endmodule
