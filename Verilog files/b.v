`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:15:14 11/07/2013
// Design Name:   Intregate_circuit
// Module Name:   G:/LABISA8/b.v
// Project Name:  LABISA8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Intregate_circuit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module b;

	// Inputs
	reg start;

	// Outputs
	wire [31:0] instr;
	wire [19:0] sig;
	wire [9:0] PC_2_Icache1;
	wire [31:0] rdata1;
	wire [31:0] rdata2;
	wire [31:0] alu;
	wire [4:0] waddr;
	wire [31:0] wdata;
	wire Clk;

	// Instantiate the Unit Under Test (UUT)
	Intregate_circuit uut (
		.start(start), 
		.instr(instr), 
		.sig(sig), 
		.PC_2_Icache1(PC_2_Icache1), 
		.rdata1(rdata1), 
		.rdata2(rdata2), 
		.alu(alu), 
		.waddr(waddr), 
		.wdata(wdata), 
		.Clk(Clk)
	);

	initial begin
		// Initialize Inputs
		start = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

