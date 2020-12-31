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


module BCDtoBin(
    input [7:0] BCD,
    output reg [3:0] bin
    );
    
    reg [11:0] converter;
    reg [2:0] i;
    
    always @(BCD)begin
        converter = 0;
        converter[11:4] = BCD;
        
        for(i = 0; i < 4; i = i + 1)begin
            converter = converter >> 1;
            
            if(converter[11:8] >= 8) converter[11:8] = converter[11:8] - 3;
            
            if(converter[7:4] >= 8) converter[7:4] = converter[7:4] - 3;
        end
        
        bin = converter[3:0];
    end
endmodule
