`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 08:54:51 PM
// Design Name: 
// Module Name: clock_tb
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


module clock_tb();
    reg CLK100MHZ;
    
    wire [23:0] BCDtime;
    
    clock clk(.CLK100MHZ(CLK100MHZ), .out(BCDtime));
    
    always begin
        #5 CLK100MHZ = ~CLK100MHZ;
    end
    
    initial begin
        #300 $finish;
    end
    
    initial begin
        CLK100MHZ = 0;
    end
endmodule
