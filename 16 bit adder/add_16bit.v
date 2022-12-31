`timescale 1ns/1ps

module full_adder(a,b,cin,s,cout);
input a,b,cin;
output s,cout;
wire t1,t2,t3;
xor(s,a,b,cin);
and(t1,a,b);
and(t2,a,cin);
and(t3,cin,b);
or(cout,t1,t2,t3);
endmodule


module add_4bit(a,b,cin,s,cout);
input [3:0]a,b;
input cin;
output [3:0]s;
output cout;

wire [3:0]c;

full_adder f0(a[0],b[0],cin,s[0],c[0]);
full_adder f1(a[1],b[1],c[0],s[1],c[1]);
full_adder f2(a[2],b[2],c[1],s[2],c[2]);
full_adder f3(a[3],b[3],c[2],s[3],c[3]);
assign cout = c[3];
endmodule


module add_16bit(a,b,sum,carry,parity,overflow,sign,zero);
	input [15:0]a,b;
	output [15:0]sum;
	output carry,parity,overflow,sign, zero;
	wire [3:0]c;

	add_4bit M0(a[3:0],b[3:0],1'b0,sum[3:0],c[0]);
	add_4bit M1(a[7:4],b[7:4],c[0],sum[7:4],c[1]);
	add_4bit M2(a[11:8],b[11:8],c[1],sum[11:8],c[2]);
	add_4bit M3(a[15:12],b[15:12],c[2],sum[15:12],c[3]);

	assign carry = c[3];
	assign sign = sum[15];
	assign parity = ^sum;        // Odd parity
	assign zero = ~|sum;
	assign overflow = (sum[15]&(~a[15])&(~b[15])) + (~sum[15]&(a[15])&(b[15])); 

endmodule