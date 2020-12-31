`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 10:28:28 PM
// Design Name: 
// Module Name: vga_tb
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


module vga_tb();
    reg CLK100MHZ;
    reg CPU_RESETN;
    wire VGA_HS;
    wire VGA_VS;
    wire [3:0] VGA_R;
    wire [3:0] VGA_G;
    wire [3:0] VGA_B;
    
    vga_controller vga(.CLK100MHZ(CLK100MHZ), .CPU_RESETN(CPU_RESETN), .VGA_HS(VGA_HS), .VGA_VS(VGA_VS),
                        .VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B));
                        
    always #10 CLK100MHZ = ~CLK100MHZ;
    
    initial begin
        CLK100MHZ = 0; CPU_RESETN = 1;
    end
endmodule
