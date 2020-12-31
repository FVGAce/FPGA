`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2020 08:51:33 PM
// Design Name: 
// Module Name: HW6Q5_48
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


module CLA_Adder(
    input[3:0] a,b,
    input mode,
    input c_in,
    output [3:0] sum,
    output c_out
);

wire [3:0] nb = b^{mode, mode, mode, mode};
wire [3:0] p, g;
wire [4:0] c;

assign p = a ^ nb;

assign g = a & nb;

assign c[0]=c_in,
c[1]=g[0]|(p[0]&c_in),
c[2]=g[1]|(p[1]&g[0])|(p[1]&p[0]&c_in),
c[3]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[1]&p[1]&p[0]&c_in),
c[4]=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&c_in);

assign sum = p ^c;
assign c_out=c[3];

endmodule