`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2020 02:13:02 AM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();

  reg [3:0] A;
  reg [3:0] B;    // 4-bit Inputs
  reg c_in;       // Carry in input                 
  reg mode;       // Mode Selection
  reg [2:0]op;    // operation 3-bit input
  wire [3:0] out; // 4-bit Output
  wire c_out;
  
  alu ALU(.out(out), .c_out(c_out), .A(A), .B(B), .c_in(c_in), .mode(mode), .op(op));
  
  initial begin
    #200 $finish;
  end
  
  initial begin
      A = 4'b1010; B=4'b0011; c_in = 1'b0; mode = 1'b0; op = 3'b000;
      #10 op = 3'b001;
      #10 op = 3'b010;
      #10 op = 3'b011;
      #10 op = 3'b100;
      #10 op = 3'b101;
      #10 op = 3'b110;
      #10 op = 3'b111;
      #10 mode = 1'b1; op = 3'b000;
      #10 op = 3'b001;
      #10 op = 3'b010; 
      #10 op = 3'b011; c_in = 1'b1;
      #10 op = 3'b100;
      #10 op = 3'b101;
      #10 op = 3'b110; c_in = 1'b0;
      #10 op = 3'b111; c_in = 1'b1;
  end
endmodule
