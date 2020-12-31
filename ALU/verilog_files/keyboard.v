`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date: 11-03-2020    
// Design Name: 
// Module Name: keyboard 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies:
// 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
// Based code off of github repo: 
// https://github.com/Digilent/Nexys-A7-100T-Keyboard/blob/master/src/hdl/PS2Receiver.v
//////////////////////////////////////////////////////////////////////////////////

module keyboard(
    input PS2_CLK,
    input PS2_DATA,
    output [31:0] keypress,
    output reg newVal
    );
    
    reg [7:0] datacur;  // Current data coming in
    reg [7:0] dataprev; // The previous data that came in
    reg [3:0] counter;  // Position Counter
    reg [31:0] keycode; // Contains 4 8-bit words, this allows the storage of keys that require 4 8-bit words
    
    assign keypress = keycode;
    
    always@(negedge(PS2_CLK))begin
        //Run through data on every negative edge, first negedge should happen for start bit
        case(counter)
            0:;
            1:  datacur[0] <= PS2_DATA;
            2:  datacur[1] <= PS2_DATA;
            3:  datacur[2] <= PS2_DATA;
            4:  datacur[3] <= PS2_DATA;
            5:  datacur[4] <= PS2_DATA;
            6:  datacur[5] <= PS2_DATA;
            7:  datacur[6] <= PS2_DATA;
            8:  datacur[7] <= PS2_DATA;
            9:  begin
                    //Shift the 8-bit words through main storage array
                    //Also sets dataprev equal to datacur so it doesn't do anything while a key is held down
                    if (dataprev != datacur)begin
                        keycode[31:24] <= keycode[23:16];
                        keycode[23:16] <= keycode[15:8];
                        keycode[15:8] <= dataprev;
                        keycode[7:0] <= datacur;
                        dataprev <= datacur;
                    end
                end
            10: begin
                    if(datacur == 8'hf0)begin
                        newVal <= 1;
                    end else begin
                        newVal <= 0;
                    end
                end
        endcase
        
        //Add to counter for everyrun, until reaching the last bit of the 8-bit word
        if(counter < 10) begin
            counter <= counter + 1;
        end else if(counter >= 10) begin
            counter <= 0;
        end
    end
endmodule