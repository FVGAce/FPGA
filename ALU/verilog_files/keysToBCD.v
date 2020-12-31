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
    output newVal,
    output reg valid
    );
    
    wire [31:0] keypress;
    
    keyboard KB(.PS2_CLK(PS2_CLK), .PS2_DATA(PS2_DATA), .keypress(keypress), .newVal(newVal));
    
    always @(posedge CLK100MHZ)begin
        if(newVal && keypress[15:8] == 8'hf0)begin
            case(keypress[7:0])
                8'h45: begin //0
                           BCD <= 4'b0000;
                           valid <= 1'b1;
                       end
                8'h16: begin //1
                           BCD <= 4'b0001;
                           valid <= 1'b1;
                       end
                8'h1e: begin //2
                           BCD <= 4'b0010;
                           valid <= 1'b1;
                       end
                8'h26: begin //3
                           BCD <= 4'b0011;
                           valid <= 1'b1;
                       end
                8'h25: begin //4
                           BCD <= 4'b0100;
                           valid <= 1'b1;
                       end
                8'h2e: begin //5
                           BCD <= 4'b0101;
                           valid <= 1'b1;
                       end
                8'h36: begin //6
                           BCD <= 4'b0110;
                           valid <= 1'b1;
                       end
                8'h3d: begin //7
                           BCD <= 4'b0111;
                           valid <= 1'b1;
                       end
                8'h3e: begin //8
                           BCD <= 4'b1000;
                           valid <= 1'b1;
                       end
                8'h46: begin //9
                           BCD <= 4'b1001;
                           valid <= 1'b1;
                       end
                8'h1c: begin //A
                           BCD <= 4'b1010;
                           valid <= 1'b1;
                       end
                8'h32: begin //B
                           BCD <= 4'b1011;
                           valid <= 1'b1;
                       end
                8'h44: begin //O
                           BCD <= 4'b1100;
                           valid <= 1'b1;
                       end
                8'h66: begin //backspace
                           BCD <= 4'b1101;
                           valid <= 1'b1;
                       end
                8'h5a: begin //enter
                           BCD <= 4'b1110;
                           valid <= 1'b1;
                       end
                default: valid <= 0;
            endcase
        end
    end
endmodule