`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 04:49:12 AM
// Design Name: 
// Module Name: rc_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rc_adder(
    input [1:0] a,
    input [1:0] b,
    input c_in,
    input mode,
    output [1:0] sum,
    output c_out
    );
           
    wire w;
    
    full_adder fBit(.sum(sum[0]), .c_out(w), .c_in(c_in), .a(a[0]), .b(b[0]^mode));
    full_adder sBit(.sum(sum[1]), .c_out(c_out), .c_in(w), .a(a[1]), .b(b[1]^mode));
endmodule
