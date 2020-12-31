`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 07:53:13 PM
// Design Name: 
// Module Name: vga_controller
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


module vga_controller(
    input CLK100MHZ,     // board clock
    input CPU_RESETN,    // reset
    input c_out,         // c_out from ALU
    output VGA_HS,       // horizontal sync output
    output VGA_VS,       // vertical sync output
    output [3:0] VGA_R,  // 4-bit red output
    output [3:0] VGA_G,  // 4-bit green output
    output [3:0] VGA_B   // 4-bit blue output
    );
    
    reg [15:0] counter = 0;
    reg pix_stb = 0;
    wire [9:0] x;
    wire [9:0] y;
    wire de;
    
    vga640x480 display(.hs(VGA_HS), .vs(VGA_VS), .de(de), .x(x), .y(y), .CLK100MHZ(CLK100MHZ), .pix_stb(pix_stb), .reset(~CPU_RESETN));
    
    always @(posedge CLK100MHZ) 
        {pix_stb, counter} <= counter + 16'h4000;
        
    assign VGA_R = {de ? c_out: 0, 3'b000} ;
    assign VGA_G = {de ? ~c_out: 0, 3'b000};
    assign VGA_B = 0;
endmodule
