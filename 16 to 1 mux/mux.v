`timescale 1ns/1ps


module mux_2to_1(t,S,Y);
input [1:0]t;
input S;
output Y;

assign Y = t[S];
endmodule

module mux_4to_1(I,S,S1,Y);
input [3:0]I;
input [1:0]S;
output Y;

wire [1:0]t;
mux_4to_1 M0(I[1:0],S[0],t[0]);
mux_4to_1 M1(I[3:2],S[0],t[1]);
mux_2to_1 M2(t1,t2,S[1],Y);
endmodule

module mux_8to_1(I,S,Y);
input [7:0]I;
input [2:0]S;
output Y;

wire [1:0]t;
mux_4to_1 M0(I[3:0],S[1:0],t[0]);
mux_4to_1 M1(I[7:4],S[1:0],t[1]);
mux_2to_1 M2(t1,t2,S[2],Y);
endmodule


module mux_16to_1(I,S,Y);
input [15:0]I;
input [3:0]S;
output Y;

wire [1:0]t;
mux_8to_1 M0(I[7:0],S[2:0],t[0]);
mux_8to_1 M1(I[15:8],S[2:0],t[1]);
mux_2to_1 M2(t1,t2,S[3],Y);
endmodule