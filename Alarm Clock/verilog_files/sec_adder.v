`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 09:27:59 PM
// Design Name: 
// Module Name: sec_adder
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


module counter(
    input [7:0] cur_time,
    output [7:0] new_time
    );
    
    wire [7:0] BCD;
    wire [7:0] new_bin;
    wire [6:0] bin;
    wire c_out;
    
    BCD_to_bin conv_bin(.BCD(cur_time), .bin(bin));
    bin_to_BCD conv_BCD(.bin(new_bin[6:0]), .BCD(BCD)); 
    
    decoder frontDec(.OpCode(4'b0110), .A(bin[3:0]), .B(0), .out(new_bin[3:0]), .c_out(c_out));
    decoder backDec(.OpCode(4'b0100), .A({1'b0, bin[6:4]}), .B({3'b000, c_out}), .out(new_bin[7:4]));
    
    assign new_time = BCD;
endmodule
