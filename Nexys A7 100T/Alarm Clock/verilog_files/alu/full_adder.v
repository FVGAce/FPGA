`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 04:01:23 AM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input a,
    input b,
    input c_in,
    output sum,
    output c_out
    );
    
    wire w1, w2, w3;
    
    half_adder add1(.sum(w1), .c_out(w2), .a(a), .b(b));
    half_adder add2(.sum(sum), .c_out(w3), .a(c_in), .b(w1));
    
    assign c_out = w2 | w3; 
endmodule
