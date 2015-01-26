`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:28 10/29/2013 
// Design Name: 
// Module Name:    SHIFTER__ALU 
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
module SHIFTER__ALU(
    input [31:0] operand,
    input [4:0] sh_amt,
    input [4:0] v_sh_amt,
    output [31:0] shift_out,
    input [2:1] cont_sig,
	 input  cont_sig1
    );
  reg [31:0] out_reg;
  assign shift_out = out_reg;
  
  always @(v_sh_amt or sh_amt  or operand or cont_sig or cont_sig1) begin
    if     (cont_sig==2'b00 && cont_sig1==0 )	out_reg=operand<<sh_amt;   
    else if(cont_sig==2'b01 && cont_sig1==0) out_reg=operand>>sh_amt;
	 else if(cont_sig==3'b00 && cont_sig1==1) out_reg=operand<<v_sh_amt;
	 else if(cont_sig==3'b01 && cont_sig1==1) out_reg=operand>>v_sh_amt;
	 else if(cont_sig==3'b11 && cont_sig1==0) out_reg=operand>>>sh_amt;
	 else if(cont_sig==3'b11 && cont_sig1==1) out_reg=operand>>>v_sh_amt;
	 else   out_reg=0;

  end

endmodule
