

module full_adder(a,b,c,sum,carry);

input a;
input b;
input c;
output sum;
output carry;

wire s;
wire ca;
wire d;


half_adder h1(a,b,s,ca);

half_adder h2(c,s,sum,d);

assign carry = ca | d;


endmodule
