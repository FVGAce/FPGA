`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 04:42:15 PM
// Design Name: 
// Module Name: sentenceCreator
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


module sentenceCreator(
    input CLK100MHZ,
    input [3:0] BCD,
    input reset,
    input newVal,
    input valid,
    output [7:0] out
    );
    
    reg [1:0] counter;
    reg [7:0] sentence;
    reg bcksp;
    
    assign out = sentence;
    
    always @(negedge newVal)begin
        if(valid)begin
            if(BCD < 10)begin                
                case(counter)
                    0: begin
                           sentence[3:0] <= BCD;
                           bcksp <= 0;
                       end
                    1: begin
                           if(bcksp)begin
                               sentence[7:4] = BCD;
                               bcksp <= 0;
                           end else begin
                               sentence[7:4] <= sentence[3:0];
                               sentence[3:0] <= BCD;
                           end
                       end
                endcase
                
                counter <= counter + 1;
            end else if(BCD == 4'hd)begin                    
                case(counter)
                    1: begin
                           sentence[3:0] <= 0;
                           bcksp <= 1'b1;
                       end
                    2: begin
                           sentence[7:4] <= 0;
                           bcksp <= 1'b1;
                       end
                endcase
                
                if(counter > 0)
                    counter <= counter - 1;
            end else if(reset)begin
                counter <= 0;
                sentence <= 0;
            end
        end
    end        
endmodule