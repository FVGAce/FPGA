`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 06:53:11 PM
// Design Name: 
// Module Name: decoder_tb
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


module sec_adder_tb();
    reg [3:0] OpCode;
    reg [6:0] cur_sec;
    
    wire [6:0] new_sec;
    
    sec_adder Adder(.cur_sec(cur_sec), .new_sec(new_sec));
    
    always begin
        #5 cur_sec = new_sec;
    end
    
    initial begin
        #300 $finish;
    end
    
    initial begin
        cur_sec = 0; OpCode = 4'b0110;
    end
endmodule
