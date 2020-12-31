`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 05:55:44 PM
// Design Name: 
// Module Name: anode_sel
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


module anode_sel(
    input CLK100MHZ,
    input [2:0] rr,
    output reg [7:0] AN
    );
    
    //Assign which digit to refresh with what segment mapping needed
    always @(posedge CLK100MHZ) begin
        case(rr)
            //0 shows what 7-seg disp is beign affected
            3'b000: AN = 8'b01111111;
            3'b001: AN = 8'b10111111;
            3'b010: AN = 8'b11011111;
            3'b011: AN = 8'b11101111;
            3'b100: AN = 8'b11110111;
            3'b101: AN = 8'b11111011;
            3'b110: AN = 8'b11111101;
            3'b111: AN = 8'b11111110;
        endcase
    end
endmodule
