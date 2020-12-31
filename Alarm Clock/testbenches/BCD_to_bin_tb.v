`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 11:14:43 PM
// Design Name: 
// Module Name: BCD_to_bin_tb
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


module BCD_to_bin_tb();
    reg [7:0] BCD;
    wire [6:0] bin;
    
    BCD_to_bin conv(.BCD(BCD), .bin(bin));
    
    initial begin
        #100 $finish;
    end
    
    initial begin
        BCD = 8'hf;
        #10 BCD = 8'h15;
        #10 BCD = 8'h99;
    end
endmodule
