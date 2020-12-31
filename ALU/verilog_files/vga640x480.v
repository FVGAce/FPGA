`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 07:14:18 PM
// Design Name: 
// Module Name: vga640x480
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


module vga640x480(
    input CLK100MHZ,    // board clock
    input pix_stb,      // pixel clock strobe
    input reset,        // reset frames
    output hs,          // horizontal sync
    output vs,          // vertical sync
    output de,          // data enable low during blanking interval
    output reg [9:0] x = 0, // current pixel x position
    output reg [9:0] y = 0  // current pixel y position  
    );
    
    //VGA Timings
    //Horizontal timings
    localparam HA_END = 639;         // horizontal sync start
    localparam HS_STA = HA_END + 16; // horizontal sync end
    localparam HS_END = HS_STA + 96; // horizontal active pixel start
    localparam LINE = 799;           // complete line (pixels)
    
    //Vertical timings
    localparam VA_END = 479;         // verical active pixel end
    localparam VS_STA = VA_END + 10; // vertical sync start
    localparam VS_END = VS_STA + 2;  // vertical sync end
    localparam SCREEN = 524;         // complete screen (lines
    
    //generate sync signals (active low for 640x480)
    assign hs = ~((x >= HS_STA) && (x < HS_END));
    assign vs = ~((y >= VS_STA) && (y < VS_END));
    
    //date enable (de): low within the blanking period
    assign de = ((x <= HA_END) && (y <= VA_END));
    
    always @(posedge CLK100MHZ) begin
        if(reset) begin //reset to start of frame
            x <= 0;
            y <= 0;
        end               
        
        if(pix_stb) begin //once per pixel
            if(x == LINE) begin //end of line
                x <= 0;
                y <= (y == SCREEN) ? 0 : y + 1; //last line on screen?
            end else begin
                x <= x + 1;
            end
        end
    end
endmodule
