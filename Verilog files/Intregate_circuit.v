`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:38 10/30/2013 
// Design Name: 
// Module Name:    Intregate_circuit 
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
module Intregate_circuit(
  input start,
 // input rst,
  output[31:0] instr,
  output[19:0] sig,
  output[9:0] PC_2_Icache1,
  output[31:0]  rdata1,
  output[31:0]  rdata2,
  output[31:0]  alu,
  output[4:0]  waddr,
  output[31:0] wdata,
  output Clk
    );

wire[9:0] PC_2_Icache;
wire[9:0] Next_addr_2_PCreg;
wire[31:0] Instr;
wire[31:0] Incr_PC;
wire[19:0] cont_sig;
reg    clk;
wire[4:0]  RAddr1;  
wire[4:0]  Waddr;
wire[4:0]  brc;
wire[31:0] Wdata;
wire[31:0] Rdata1;
wire[31:0] Rdata2;
wire[31:0] Rdata_2;
wire[31:0] SE_imm;
wire[31:0] Alu_out;
wire[3:0]  flag_s;
wire[3:0]  flag_out;
wire[31:0] DCache_out;
reg[4:0] THIRTY_ONE=31;
reg[4:0] ZERO5=0;
reg[31:0] ZERO32=0;

 parameter PERIOD = 20;

   always begin
      clk = 1'b0;
      #(PERIOD/2) clk = 1'b1;
      #(PERIOD/2);
   end  
assign Clk=clk;	


PC_Reg U1(Next_addr_2_PCreg,PC_2_Icache);

ICache U2(clk,PC_2_Icache,Instr);

Control_Unit1  U3(Instr[31:26],Instr[5:0],cont_sig,clk);

MUX2X1bit5  U4(Instr[25:21],THIRTY_ONE,cont_sig[14],RAddr1);

MUX4X1bit5  U5(Instr[25:21],Instr[20:16],THIRTY_ONE,ZERO5,cont_sig[19:18],Waddr);

Register_File  U6(RAddr1,Instr[20:16],Waddr,Wdata,Rdata1,Rdata2,cont_sig[17],clk);

Sign_Extension U7(Instr[15:0],SE_imm);

MUX2X1bit32  U8(Rdata2,SE_imm,cont_sig[13],Rdata_2);

ALU  U9(Rdata1,Rdata_2,cont_sig[12:8],Instr[10:6],Alu_out,flag_s);

Flag_reg U10(flag_s,flag_out);

DCache  U11(clk,cont_sig[6],Alu_out,Rdata2,DCache_out);

MUX4X1bit32 U12(Alu_out,DCache_out,Incr_PC,ZERO5,cont_sig[16:15],Wdata);

Next_Address U13(PC_2_Icache,Instr[9:0],Rdata1[9:0],cont_sig[2:1],cont_sig[3:0],flag_out,Incr_PC,Next_addr_2_PCreg,clk);

assign instr=Instr;
assign PC_2_Icache1=PC_2_Icache; 
assign sig=cont_sig;
assign rdata2=Rdata2;
assign rdata1=Rdata1;
assign alu=Alu_out;
assign waddr=Waddr;
assign wdata=Wdata;

always@(posedge clk)
begin
 $display("***Instr - %b Control Signal -%b *** ",Instr,cont_sig); 
end
endmodule
