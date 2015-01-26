`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:19:15 10/29/2013 
// Design Name: 
// Module Name:    SHIFTER_ALU 
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
module SHIFTER_ALU(
    input [31:0] operand,
    input [5:0] sh_amt,
    input [5:0] v_sh_amt,
    output [31:0] shift_out,
    input [2:0] cont_sig
    );

  reg [31:0] out_reg;
  assign shift_out = out_reg;
  
  always @(v_sh_amt or sh_amt  or operand or cont_sig) begin
    if(cont_sig==2'b000)	out_reg=operand<<sh_amt;   
    else if(cont_sig==2'b010) out_reg=operand>>sh_amt;
	 else if(cont_sig==2'b001)out_reg=operand<<v_sh_amt;
	 else if(cont_sig==2'b011)out_reg=operand>>v_sh_amt;
	 else if(cont_sig==2'b110)out_reg=operand>>>sh_amt;
	 else if(cont_sig==2'b111)out_reg=operand>>>v_sh_amt;
	 else   out_reg=0;

  end
endmodule
