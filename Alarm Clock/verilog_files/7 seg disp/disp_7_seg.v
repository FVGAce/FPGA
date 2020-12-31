`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2020 05:06:36 PM
// Design Name: 
// Module Name: disp_7_seg
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


module disp_7_seg(
    input CLK100MHZ,           // Clock
    input [4:0] digit_holder,  // Current digit needed to be displayed
    output [2:0] refresh_rate, // Works as a way to know what digit is being worked on
    output [7:0] AN,           // Anodes
    output [6:0] seg           // 7-seg display
    );
    
    reg [19:0] rr = 0;
    
    seg_mapping map(.digit_holder(digit_holder), .seg(seg));
    anode_sel an(.CLK100MHZ(CLK100MHZ), .rr(rr[19:17]), .AN(AN));
    
    assign refresh_rate = rr[19:17];
    
    //Refresh Rate buffer
    always @(posedge CLK100MHZ)
        rr <= rr + 1;
endmodule
