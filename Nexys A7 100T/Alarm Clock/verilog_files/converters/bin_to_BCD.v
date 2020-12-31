`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2020 08:06:25 PM
// Design Name: 
// Module Name: bin_to_BCD
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


module bin_to_BCD(
    input [6:0] bin,
    output reg [7:0] BCD
    );
    
    reg [14:0] converter = 0;
    reg [3:0] i = 0;
    
    always @(bin)begin
        converter = 0;
        converter[6:0] = bin;
        
        for(i = 0; i < 7; i = i + 1)begin
            if(converter[10:7] >= 5) converter[10:7] = converter[10:7] + 3;
            
            if(converter[14:11] >= 5) converter[14:11] = converter[14:11] + 3;
            
            converter = converter << 1;
        end
        
        BCD = converter[14:7];
    end    
endmodule
