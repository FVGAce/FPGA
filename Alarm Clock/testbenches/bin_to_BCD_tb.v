`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 08:37:27 PM
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
    reg [6:0] bin;
    
    wire [7:0] BCD;
    
    bin_to_BCD conv(.BCD(BCD), .bin(bin));
    
    initial begin
        #100 $finish;
    end
    
    initial begin
        bin = 4'hf;
        #10 bin = 7'h63;
    end
endmodule
