`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2020 03:13:11 AM
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb();  
  reg CLK100MHZ;
  reg [3:0] OpCode;
  reg [3:0] A;
  reg [3:0] B;
  reg [3:0] out;
  reg c_out;
  reg DispCont;
  wire [7:0] AN;
  wire [6:0] seg;
  wire [2:0] op;
  wire mode;
  wire c_in;
  
  decoder Decoder(.op(op), .mode(mode), .c_in(c_in), .AN(AN), .seg(seg), 
                    .CLK100MHZ(CLK100MHZ), .OpCode(OpCode), .A(A), .B(B), .out(out), .c_out(c_out), .DispCont(DispCont));
                    
  always #1 CLK100MHZ = ~CLK100MHZ;
  
  initial begin
      A = 4'b1010; B=4'b0011; DispCont = 1'b1; OpCode = 4'b0000; CLK100MHZ = 0;
      out = 4'b0001; c_out = 0;
      
      #10 out = 4'b0010;
      #10 out = 4'b1010;
  end
endmodule
