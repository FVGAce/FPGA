`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 07:33:17 PM
// Design Name: 
// Module Name: BCDtoBin
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


module BCD_to_bin(
    input [7:0] BCD,
    output reg [6:0] bin
    );
    
    reg [14:0] converter;
    reg [3:0] i;
    
    always @(BCD)begin
        converter = 0;
        converter[14:7] = BCD;
        
        for(i = 0; i < 7; i = i + 1)begin
            converter = converter >> 1;
            
            if(converter[14:11] >= 8) converter[14:11] = converter[14:11] - 3;
            
            if(converter[10:7] >= 8) converter[10:7] = converter[10:7] - 3;
        end
        
        bin = converter[6:0];
    end
endmodule
