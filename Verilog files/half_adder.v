`timescale 1ns / 1ps

module half_adder(a,b,out,carry);
input a;
input b;
output out;
output carry;

assign out = a^b;
assign carry = a&b;

endmodule
