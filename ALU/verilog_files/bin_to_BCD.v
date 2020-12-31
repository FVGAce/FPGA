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
    input [3:0] binary,
    output reg [7:0] BCD
    );
    
    reg [11:0] converter = 0;
    reg [2:0] i = 0;
    
    always @(binary)begin
        converter = 0;
        converter[3:0] = binary;
        
        for(i = 0; i < 4; i = i + 1)begin
            if(converter[7:4] >= 5) converter[7:4] = converter[7:4] + 3;
            
            if(converter[11:8] >= 5) converter[11:8] = converter[11:8] + 3;
            
            converter = converter << 1;
        end
        
        BCD = converter[11:4];
    end    
endmodule
