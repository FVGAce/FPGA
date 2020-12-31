`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 04:54:40 AM
// Design Name: 
// Module Name: t_problem3_HW5
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


module t_CLA_Adder;
// Inputs
reg [3:0] a;
reg [3:0] b;
reg c_in;
reg mode;

// Outputs
wire [3:0] sum;
wire c_out;

// Instantiate the Unit Under Test (UUT)
CLA_Adder uut (
.a(a),
.b(b),
.mode(mode),
.c_in(c_in),
.sum(sum),
.c_out(c_out)
);

initial begin
// Initialize Inputs
b = 4'b0010; a = 4'b0101;
c_in = 0;
mode = 0;
// Wait 100 ns for global reset to finish
#100;

c_in = 1;
mode = 1;
// Wait 100 ns for global reset to finish
#100;
end
endmodule