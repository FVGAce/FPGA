`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2020 08:25:29 PM
// Design Name: 
// Module Name: bin_to_BCD_tb
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


module bin_to_BCD_tb();
    reg [3:0] binary;
    reg CLK100MHZ;
    wire [3:0] ones;
    wire [3:0] tens;
    
    bin_to_BCD conv(.CLK100MHZ(CLK100MHZ), .binary(binary), .BCD({tens, ones}));
    
    always #10 CLK100MHZ = ~CLK100MHZ;
    
    initial begin
        #1000 $finish;
    end
    
    initial begin
        CLK100MHZ = 0;
        binary = 4'b1010;
        
        #40 binary = 4'b0100;
        #40 binary = 4'b1011;
        #40 binary = 4'b1110;
        #40 binary = 4'b1111;
    end
endmodule
