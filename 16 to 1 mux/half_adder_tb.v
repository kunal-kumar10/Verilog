`timescale 1ns/1ps
`include "16_to_1.v";

module mux_16to1_tb;

reg [15:0]I;
reg [3:0]S;
wire Y;

mux_16to1 DUT(I,S,Y);

initial begin
    $dumpfile("16_to_1.vcd");
    $dumpvars(0,mux_16to1_tb);
    
    $monitor($time," I=%b , S=%b, Y=%b", I,S,Y);
    #5 I = 16'h 3f0a;
    #5 S = 4'b 0110;
    #5 S = 4'b 0001;
    #5 S = 4'b 1111;
    #5 S = 4'b 1011;
    #5 S = 4'b 1110;
end
endmodule