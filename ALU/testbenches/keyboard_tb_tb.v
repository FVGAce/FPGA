`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2020 03:45:16 PM
// Design Name: 
// Module Name: keyboard_tb_tb
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


module keyboard_tb_tb();

    reg CLK100MHZ;
    reg PS2_CLK;
    reg PS2_DATA;
    wire [7:0] AN;
    wire [6:0] seg;
    wire c_out;
    
    keyboard_tb Keyboard(.CLK100MHZ(CLK100MHZ), .PS2_CLK(PS2_CLK), .PS2_DATA(PS2_DATA), 
                        .AN(AN), .seg(seg), .c_out(c_out));
                        
    always #10 CLK100MHZ = ~CLK100MHZ;
    always #50000 PS2_CLK = ~PS2_CLK;
    always #45054 PS2_DATA = ~PS2_DATA;
    
    initial begin
        CLK100MHZ = 0; PS2_CLK = 0; PS2_DATA = 0;
    end
endmodule
