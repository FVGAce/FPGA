`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 05:49:07 PM
// Design Name: 
// Module Name: seg_mapping
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


module seg_mapping(
    input [4:0] digit_holder,
    output reg [6:0] seg
    );
    
    //Maps current anonde to a cathode mapping representive of the digit in the output
    always @(*)begin
        case (digit_holder) 
            5'b00000 : seg <= 7'b0000001;
            5'b00001 : seg <= 7'b1001111;
            5'b00010 : seg <= 7'b0010010;
            5'b00011 : seg <= 7'b0000110;
            5'b00100 : seg <= 7'b1001100;          
            5'b00101 : seg <= 7'b0100100;
            5'b00110 : seg <= 7'b0100000;
            5'b00111 : seg <= 7'b0001111;
            5'b01000 : seg <= 7'b0000000;
            5'b01001 : seg <= 7'b0000100;
            5'b01010 : seg <= 7'b0001000;
            5'b01011 : seg <= 7'b1100000;
            5'b01100 : seg <= 7'b0110001;
            5'b01101 : seg <= 7'b1000010;
            5'b01110 : seg <= 7'b0110000;
            5'b01111 : seg <= 7'b0111000;
            5'b10000 : seg <= 7'b1111111;
            5'b10001 : seg <= 7'b1111110;
        endcase
    end
endmodule
