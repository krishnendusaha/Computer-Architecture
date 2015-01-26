`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:01:05 11/06/2013 
// Design Name: 
// Module Name:    Control_Unit1 
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
module Control_Unit1(
    input [5:0] opcode,
    input [5:0] func,
    output [19:0] c_sig,
	 input  clk
    );
reg[19:0]  csig;
always@(opcode or func)
begin
 case(opcode)
     0:  begin
	      csig[19:13]=7'b0010000;
			csig[7:4]=4'b0000;
	      case(func)
			2: begin csig[12:11]=2'b01; csig[10]=0; end
			3: begin csig[12:11]=2'b01; csig[10]=1; end 
			4: begin csig[12:11]=2'b10; csig[10]=0; end
			5: begin csig[12:11]=2'b10; csig[10]=1; end
			0: begin csig[12:11]=2'b00; csig[10]=0; csig[9:8]=2'b00;   end
			8: begin csig[12:11]=2'b00; csig[10]=0; csig[9:8]=2'b01;   end
			1: begin csig[12:11]=2'b00; csig[10]=1; csig[9:8]=2'b00;   end
			9: begin csig[12:11]=2'b00; csig[10]=1; csig[9:8]=2'b01;   end
		  24: begin csig[12:11]=2'b00; csig[10]=0; csig[9:8]=2'b10;   end
		  25: begin csig[12:11]=2'b00; csig[10]=1; csig[9:8]=2'b11;   end	
         7:	begin csig[17]=0;  csig[14]=1; csig[7:4]=4'b0010;    end
         6: begin csig[17]=0;  csig[14]=1; csig[7:4]=4'b0010;   end				
			endcase
			end
	  1:  begin  csig[19:13]=7'b0010001;  csig[7:4]=4'b0000; csig[12:11]=2'b01; csig[10]=0; end
 	  2:  begin  csig[19:13]=7'b0010001;  csig[7:4]=4'b0000; csig[12:11]=2'b01; csig[10]=1; end
	 
  	  9:	begin  csig[19:13]=7'b0110101;  csig[7:4]=4'b1000;  end
	 18:	begin  csig[17]=0;  csig[14:13]=2'b01; csig[7:4]=4'b0100;  end			
	 
	 26:	begin  csig[17]=0;  csig[14]=0; csig[7:4]=4'b0001; csig[3:0]=4'b0000;  end		
	  6:	begin  csig[17]=0;  csig[14]=0; csig[7:4]=4'b0001; csig[3:0]=4'b0001;  end	
	 14:	begin  csig[17]=0;  csig[14]=0; csig[7:4]=4'b0001; csig[3:0]=4'b0010;  end	
	 22:	begin  csig[17]=0;  csig[14]=0; csig[7:4]=4'b0001; csig[3:0]=4'b0011;  end	
	 30:	begin  csig[17]=0;  csig[14]=0; csig[7:4]=4'b0001; csig[3:0]=4'b0100;  end
    38:	begin  csig[17]=0;  csig[14]=0; csig[7:4]=4'b0001; csig[3:0]=4'b0101;  end
    46:	begin  csig[17]=0;  csig[14]=0; csig[7:4]=4'b0001; csig[3:0]=4'b0110;  end
    54:	begin  csig[17]=0;  csig[14]=0; csig[7:4]=4'b0001; csig[3:0]=4'b0111;  end	
    62:	begin  csig[17]=0;  csig[14]=0; csig[7:4]=4'b0001; csig[3:0]=4'b1000;  end	
    51:	begin  csig[19:14]=6'b101100;   csig[7:4]=4'b0001; csig[3:0]=4'b1001;  end	 
    	 
	 
  endcase	
end	
assign  c_sig=csig;  
endmodule
