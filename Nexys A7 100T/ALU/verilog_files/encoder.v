`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 04:36:42 AM
// Design Name: 
// Module Name: encoder
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


module encoder(
    input CLK100MHZ,
    input PS2_CLK,
    input PS2_DATA,
    input [2:0] rr,
    output reg [3:0] A,
    output reg [3:0] B,
    output reg [3:0] OpCode,
    output reg [4:0] digit_holder,
    //output [7:0] AN,
    //output [6:0] seg,
    output reg in
    );
    
    //reg in;
    //reg [4:0] digit_holder;
    //reg [3:0] A;
    //reg [3:0] B;
    //reg [3:0] OpCode;
    reg [4:0] repState;
    reg [1:0] CS;
    reg reset;
    wire [7:0] sentence;
    wire [3:0] truncSent;
    wire [3:0] BCD;
    wire newVal;
    wire valid;
    //wire [2:0] rr;
    
    keysToBCD conv(.CLK100MHZ(CLK100MHZ), .PS2_CLK(PS2_CLK), .PS2_DATA(PS2_DATA), .BCD(BCD), .newVal(newVal), .valid(valid));
    sentenceCreator create(.CLK100MHZ(CLK100MHZ), .BCD(BCD), .reset(reset), .newVal(newVal), .valid(valid), .out(sentence));
    BCDtoBin convBin(.BCD(sentence), .bin(truncSent));
    //disp_7_seg disp7(.CLK100MHZ(CLK100MHZ), .digit_holder(digit_holder), .refresh_rate(rr),
      //               .AN(AN), .seg(seg));
    
    always @(posedge CLK100MHZ)begin
        //if(in == 1'b1)begin
            case(rr)
                3'b000: digit_holder <= repState;
                3'b001: digit_holder <= in;
                3'b110: digit_holder <= sentence[7:4];
                3'b111: digit_holder <= sentence[3:0];
                default: digit_holder <= 5'b10000;
            endcase
        //end else begin
        //    case(rr)
        //        3'b101: digit_holder <= OpCode;
        //        3'b110: digit_holder <= A;
        //        3'b111: digit_holder <= B;
        //        default: digit_holder <= 5'b10000;
        //    endcase
        //end
    end
    
    always @(negedge newVal)begin
        case(BCD)
            4'ha: begin 
                    repState <= BCD;
                    CS <= 0;
                    reset <= 0;
                    in <= 1;
                  end
            4'hb: begin 
                    repState <= BCD;
                    CS <= 1;
                    reset <= 0;
                    in <= 1;
                  end
            4'hc: begin 
                    repState <= 0;
                    CS <= 2;
                    reset <= 0;
                    in <= 1;
                  end
        endcase
        
        if(BCD == 4'he)begin
            case(CS)
                0: A = truncSent;
                1: B = truncSent;
                2: OpCode = truncSent;
            endcase
            
            reset = 1;
            in <= 0;
        end
    end
endmodule