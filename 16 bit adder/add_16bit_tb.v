`timescale 1ns/1ps
`include "add_16bit.v"


module add_test;
reg [15:0]a,b;
wire [15:0]s;
wire cout;
wire carry,parity,overflow,sign,zero;


add_16bit DUT(a,b,s,carry,parity,overflow,sign,zero);

initial begin
    $dumpfile("add_16bit.vcd");
    $dumpvars(0,add_test);
    $monitor($time, " a = %d || Y = %d || S = %d || Cout = %d",a,b,s,carry);
    
    #5 a = 16'h ffff;
    b = 16'h 0001;

    #5 a = 16'h 30f2;
    b = 16'h 62d0;

    #5 a = 16'h 3dfe;
    b = 16'h abde;

    #5 a = 16'h 35a2;
    b = 16'h c254;
end
endmodule