`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 01:29:03 AM
// Design Name: 
// Module Name: sentence_creator
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

module sentence_creator(
    input [3:0] BCD,
    input newVal,
    input in,
    input reset,
    output reg [23:0] sentence
    );
    
    reg [2:0] counter;
    
    always @(negedge newVal)begin
        if(in & (BCD < 4'ha))begin
            case(counter)
                0: begin
                    if(BCD <= 4'h2)begin
                        sentence[23:20] <= BCD;
                        counter <= counter + 1;
                    end
                   end
                1: begin
                    if(sentence[23:20] == 4'h2)begin
                        if(BCD <= 4'h4)begin
                            sentence[19:16] <= BCD;
                            counter <= counter + 1;
                        end
                    end else begin
                        sentence[19:16] <= BCD;
                        counter <= counter + 1;
                    end
                   end
                2: begin
                    if(BCD <= 4'h5)begin
                        sentence[15:12] <= BCD;
                        counter <= counter + 1;
                    end
                   end
                3: begin
                    sentence[11:8] <= BCD;
                    counter <= counter + 1;
                   end
                4: begin
                    if(BCD <= 4'h5)begin
                        sentence[7:4] <= BCD;
                        counter <= counter + 1;
                    end
                   end
                5: begin
                    sentence[3:0] <= BCD;
                    counter <= counter + 1;
                   end
                default:;
            endcase
        end else if(BCD == 4'hd)begin
            case(counter)
                1: sentence[23:20] <= 0;
                2: sentence[19:16] <= 0;
                3: sentence[15:12] <= 0;
                4: sentence[11:8] <= 0;
                5: sentence[7:4] <= 0;
                6: sentence[3:0] <= 0;
                default:;
            endcase
            
            if(counter > 0)
                counter <= counter - 1;
        end else if (reset)begin
            sentence <= 0;
            counter <= 0;
        end
    end
endmodule