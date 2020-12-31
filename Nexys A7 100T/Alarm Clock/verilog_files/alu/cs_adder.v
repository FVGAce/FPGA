`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2020 12:55:31 AM
// Design Name: 
// Module Name: cs_adder
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


module cs_adder(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    input mode,
    output [3:0] sum,
    input c_out
    );
    
    wire [1:0] sum0;
    wire [1:0] sum1;
    wire [2:0] w;
    
    rc_adder fAdder(.sum(sum[1:0]), .c_out(w[0]), .a(a[1:0]), .b(b[1:0]), .c_in(c_in), .mode(mode)); //front half bits adder
    rc_adder sAdder0(.sum(sum0), .c_out(w[1]), .a(a[3:2]), .b(b[3:2]), .c_in(1'b0), .mode(mode)); //back half bits adder with c_in = 0
    rc_adder sAdder1(.sum(sum1), .c_out(w[2]), .a(a[3:2]), .b(b[3:2]), .c_in(1'b1), .mode(mode)); //back half bits adder with c_in = 1
    
    assign sum[3:2] = w[0] == 0 ? sum0: w[0] == 1 ? sum1: 2'bxx; //if w[0] = 0 set sum[3:2] to sum0, if w[0] = 1 set sum[3:2] to sum1
    assign c_out = w[0] == 0 ? w[1]: w[0] == 1 ? w[2]: 1'bx; //if w[0] = 0 set c_out to w[1], if w[0] = 1 set c_out to w[2]
endmodule
