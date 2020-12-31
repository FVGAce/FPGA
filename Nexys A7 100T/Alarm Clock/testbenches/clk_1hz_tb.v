`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 11:24:20 PM
// Design Name: 
// Module Name: clk_1hz_tb
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


module clk_1hz_tb();
    reg CLK100MHZ;
    reg CPU_RESETN;
    
    wire clk_stb;
    
    clk_1hz seconds(.CLK100MHZ(CLK100MHZ), .CPU_RESETN(CPU_RESETN), .clk_stb(clk_stb));
    
    always begin
        #5 CLK100MHZ = ~CLK100MHZ;
    end
    
    initial begin
        CLK100MHZ = 0; CPU_RESETN = 0;
        
        #10 CPU_RESETN = 1;
    end
endmodule
