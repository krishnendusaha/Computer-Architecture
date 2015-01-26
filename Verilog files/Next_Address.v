`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:05:07 10/30/2013 
// Design Name: 
// Module Name:    Next_Address 
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
module Next_Address(
    input [9:0] PC,
    input [9:0] jta,
    input [9:0] reg_val,
    input [1:0] sel,
	 input [3:0] brc,
	 input [3:0] flags,
    output [31:0] Incr_PC,
    output [9:0] Next_PC,
	 input clk
    );

reg[9:0] temp; 
reg[9:0] temp1;
reg   sel2;

always@ (negedge clk)
begin
   sel2=0;
   casex({flags,brc})
	8'bxxxx0000: sel2=1;  
	8'b1xxx0001: sel2=1; 
	8'b0xxx0010: sel2=1;
	8'bx1xx0011: sel2=1;
	8'bx0xx0100: sel2=1;
	8'bxx1x0101: sel2=1;
	8'bxx0x0110: sel2=1;
	8'bxxx10111: sel2=1;
	8'bxxx01000: sel2=1;
	endcase
       
   case(sel)
    2'b00: begin   temp=PC+1;  temp1=PC+1; end
    2'b01: begin   temp1=PC+1; temp=(sel2)?jta:temp1;  end
    2'b10:  temp=reg_val;
    2'b11:  temp=0;
    default: begin   temp=PC+1; temp1=PC+1; end
	 endcase
    

end
assign  Next_PC=temp;
assign  Incr_PC={{21{1'b0}},temp1};


endmodule
