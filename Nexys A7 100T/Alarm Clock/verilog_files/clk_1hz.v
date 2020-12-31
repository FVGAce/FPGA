`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 10:41:20 PM
// Design Name: 
// Module Name: clk_1hz
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


module clk_1hz(
    input CLK100MHZ,
    input CPU_RESETN,
    input reset,
    output reg clk_stb
    );
    
    localparam half_period = 50000000;
    
    reg [25:0] counter;
    reg ncount;
    
    always @(posedge CLK100MHZ)begin
        if(~CPU_RESETN)begin
            counter <= 0;
            clk_stb <= 0;
            ncount <= 0;
        end else if(reset & ~ncount)begin
            counter <= 0;
            clk_stb <= 0;
            ncount <= 1;
        end else if(counter == half_period - 1)begin
            counter <= 0;
            clk_stb <= ~clk_stb;
        end else
            counter <= counter + 1;
            
        if(~reset)
            ncount <= 0;  
    end
endmodule