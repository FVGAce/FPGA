`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2020 04:44:14 AM
// Design Name: 
// Module Name: keyboard_tb
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


module keyboard_tb(
    input CLK100MHZ,
    input PS2_CLK,
    input PS2_DATA,            
    output [7:0] AN,           
    output [6:0] seg
    );
    
    reg [4:0] digit_holder;
    wire [2:0] rr;
    wire [31:0] keypress;
    
    keyboard KB(.PS2_CLK(PS2_CLK), .PS2_DATA(PS2_DATA), .keypress(keypress));
    disp_7_seg disp(.CLK100MHZ(CLK100MHZ), .digit_holder(digit_holder), .refresh_rate(rr), .AN(AN), .seg(seg));
    
    always @(posedge CLK100MHZ)begin
        case(rr)
            3'b000: digit_holder <= keypress[31:28];
            3'b001: digit_holder <= keypress[27:24];
            3'b010: digit_holder <= keypress[23:20];
            3'b011: digit_holder <= keypress[19:16];
            3'b100: digit_holder <= keypress[15:12];
            3'b101: digit_holder <= keypress[11:8];
            3'b110: digit_holder <= keypress[7:4];
            3'b111: digit_holder <= keypress[3:0];
        endcase
    end
endmodule
