`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 11:38:01 AM
// Design Name: 
// Module Name: keysToBCD
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

module keysToBCD(
    input CLK100MHZ,
    input PS2_CLK,
    input PS2_DATA,
    output reg [3:0] BCD,
    output newVal
    );
    
    wire [31:0] keypress;
    
    keyboard KB(.PS2_CLK(PS2_CLK), .PS2_DATA(PS2_DATA), .keypress(keypress), .newVal(newVal));
    
    always @(posedge CLK100MHZ)begin
        if(newVal && keypress[15:8] == 8'hf0)begin
            case(keypress[7:0])
                8'h45: BCD <= 4'b0000; //0
                8'h16: BCD <= 4'b0001; //1
                8'h1e: BCD <= 4'b0010; //2
                8'h26: BCD <= 4'b0011; //3
                8'h25: BCD <= 4'b0100; //4
                8'h2e: BCD <= 4'b0101; //5
                8'h36: BCD <= 4'b0110; //6
                8'h3d: BCD <= 4'b0111; //7
                8'h3e: BCD <= 4'b1000; //8
                8'h46: BCD <= 4'b1001; //9
                8'h1c: BCD <= 4'b1010; //A (Set Alarm)
                8'h2c: BCD <= 4'b1011; //T (Select Time)
                8'h66: BCD <= 4'b1101; //backspace
                8'h5a: BCD <= 4'b1110; //enter
                default: BCD <= 4'b1111;
            endcase
        end
    end
endmodule