`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2020 09:22:53 PM
// Design Name: 
// Module Name: rc_adder_tb
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


module rc_adder_tb();

//inputs
reg [1:0] a, b; 
reg mode;
reg c_in;
//outputs
wire [1:0] sum;
wire c_out;

rc_adder bit3(.sum(sum), .c_out(c_out), .c_in(c_in), .a(a), .b(b), .mode(mode));

initial begin
#100 $finish;
end

initial begin
a = 3'b10; b = 3'b01; c_in = 1; mode = 1'b1;
#10 c_in = 0; mode = 1'b0;
end
endmodule
