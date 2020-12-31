`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 08:01:45 PM
// Design Name: 
// Module Name: BCDtoBIN_tb
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


module BCDtoBIN_tb();
    reg [7:0] BCD;
    wire [3:0] bin;
    
    BCDtoBin conv(.BCD(BCD), .bin(bin));
    
    initial begin
        #100 $finish;
    end
    
    initial begin
        BCD = 8'hf;
        #10 BCD = 8'h15;
    end
endmodule
