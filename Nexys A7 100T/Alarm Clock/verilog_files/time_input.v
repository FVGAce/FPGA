`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 12:07:35 AM
// Design Name: 
// Module Name: time_input
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


module time_input(
    input CLK100MHZ,
    input PS2_CLK,
    input PS2_DATA,
    input [2:0] rr,
    output reg [23:0] itime,
    output reg [4:0] digit_holder,
    output reg set,
    output reg new,
    output reg in
    );
    
    reg reset;
    
    wire [23:0] sentence;
    wire [3:0] BCD;
    wire newVal;
    
    keysToBCD keyboard(.CLK100MHZ(CLK100MHZ), .PS2_CLK(PS2_CLK), .PS2_DATA(PS2_DATA), .BCD(BCD), .newVal(newVal));
    sentence_creator sentCreate(.BCD(BCD), .newVal(newVal), .in(in), .reset(reset), .sentence(sentence));
                          
    always @(negedge newVal)begin
        case(BCD)
            4'ha: begin
                    set <= 0;
                    reset <= 0;
                    new <= 0;
                    in <= 1; 
                  end
            4'hb: begin
                    set <= 1;
                    reset <= 0;
                    new <= 0;
                    in <= 1;
                  end
            4'he: begin
                    reset <= 1;
                    new <= 1;
                    in <= 0;
                    itime <= sentence;
                  end
            default: reset <= 0;
        endcase
    end
    
    always @(posedge CLK100MHZ)begin
        if(in)begin
            case(rr)
                3'b000: digit_holder <= sentence[23:20];
                3'b001: digit_holder <= sentence[19:16];
                3'b011: digit_holder <= sentence[15:12];
                3'b100: digit_holder <= sentence[11:8];
                3'b110: digit_holder <= sentence[7:4];
                3'b111: digit_holder <= sentence[3:0];
                default: digit_holder <= 5'b10000;
            endcase
        end else digit_holder <= 5'b10000;
    end
endmodule
