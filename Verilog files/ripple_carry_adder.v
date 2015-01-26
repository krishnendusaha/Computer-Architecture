`timescale 1ns / 1ps

module ripple_carry_adder(a,b,cin,s,cout);
input[32:1] a,b;
input cin;
//input cin;
output[32:1] s;
output cout;
wire[32:0] c;
genvar i;
assign cout=c[32];
assign c[0]=cin;
generate 
	for(i=1;i<=32;i=i+1) begin:FADDER
	    (* KEEP_HIERARCHY = "TRUE"*)
		full_adder FA(a[i],b[i],c[i-1],s[i],c[i]);
	end
endgenerate





endmodule
