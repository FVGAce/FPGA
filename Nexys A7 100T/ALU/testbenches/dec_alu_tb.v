`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 12:51:00 AM
// Design Name: 
// Module Name: dec_alu_tb
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


module dec_alu_tb();
  reg CLK100MHZ;
  reg [3:0] OpCode;
  reg [3:0] A;
  reg [3:0] B;
  reg DispCont;
  wire [7:0] AN;
  wire [6:0] seg;
  wire c_out;
  
  dec_alu Dec_ALU(.c_out(c_out), .AN(AN), .seg(seg), 
                  .CLK100MHZ(CLK100MHZ), .OpCode(OpCode), .A(A), .B(B), .DispCont(DispCont));
                    
  always #5 CLK100MHZ = ~CLK100MHZ;
  
  initial begin
      A = 4'b1010; B=4'b0011; DispCont = 1'b0; OpCode = 4'b1010; CLK100MHZ = 0;
      #500 DispCont = 1'b1;
  end
endmodule
