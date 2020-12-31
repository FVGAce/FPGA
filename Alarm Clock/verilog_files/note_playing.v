`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 12:53:25 PM
// Design Name: 
// Module Name: note_playing
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


module note_playing(
    input CLK100MHZ,
    input enable,
    output reg AUD_PWM,
    output AUD_SD
    );
    
    localparam half_period = 113636; 
    reg [16:0] counter;
    reg clk_stb;
    
    assign AUD_SD = enable;
    
    always @(posedge CLK100MHZ)begin
        if(counter == half_period - 1)begin
            counter <= 0;
            clk_stb <= ~clk_stb;
        end else
            counter <= counter + 1;
    end
    
    always @(posedge clk_stb)
        AUD_PWM <= ~AUD_PWM;
endmodule
