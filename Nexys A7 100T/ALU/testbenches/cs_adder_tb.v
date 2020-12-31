`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2020 01:06:31 AM
// Design Name: 
// Module Name: cs_adder_tb
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


module cs_adder_tb();

//inputs
reg [3:0] a, b; 
reg mode;
reg c_in;
//outputs
wire [3:0] sum;
wire c_out;

cs_adder adder(.sum(sum), .c_out(c_out), .c_in(c_in), .a(a), .b(b), .mode(mode));

initial begin
#100 $finish;
end

initial begin
a = 4'b1100; b = 4'b0101; c_in = 1; mode = 1'b1;
#10 c_in = 0; mode = 1'b0;
end
endmodule
