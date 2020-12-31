`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2020 10:22:14 AM
// Design Name: 
// Module Name: dec_alu
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


module dec_alu(
    input CLK100MHZ,
    input CPU_RESETN,
    input PS2_CLK,
    input PS2_DATA,
    input DispCont,
    output c_out,
    output [7:0] AN,
    output [6:0] seg,
    output VGA_HS,
    output VGA_VS,
    output [3:0] VGA_R,
    output [3:0] VGA_G,
    output [3:0] VGA_B
    );
    
    reg [4:0] digit_holder;
    wire [4:0] inDigit;
    wire [4:0] outDigit;
    wire [3:0] OpCode;
    wire [3:0] A;
    wire [3:0] B;
    wire [2:0] op;
    wire [2:0] rr;
    wire in;
    wire mode;
    wire c_in;
    wire [3:0] out;
    
    encoder Encode(.CLK100MHZ(CLK100MHZ), .PS2_CLK(PS2_CLK), .PS2_DATA(PS2_DATA), .rr(rr),
                   .A(A), .B(B), .OpCode(OpCode), .digit_holder(inDigit), .in(in));
    decoder Decoder(.op(op), .mode(mode), .c_in(c_in), .digit_holder(outDigit),
                    .CLK100MHZ(CLK100MHZ), .OpCode(OpCode), .rr(rr), .A(A), .B(B), .out(out), 
                    .c_out(c_out), .DispCont(DispCont));
    alu ALU(.out(out), .c_out(c_out), .A(A), .B(B), .c_in(c_in), .mode(mode), .op(op));
    vga_controller display(.CLK100MHZ(CLK100MHZ), .CPU_RESETN(CPU_RESETN), .c_out(c_out),
                            .VGA_HS(VGA_HS), .VGA_VS(VGA_VS), .VGA_R(VGA_R), .VGA_G(VGA_G),
                            .VGA_B(VGA_B));
    disp_7_seg disp7(.CLK100MHZ(CLK100MHZ), .digit_holder(digit_holder), .refresh_rate(rr),
                     .AN(AN), .seg(seg));
                     
    always @(posedge CLK100MHZ)begin
       case(in)
           1'b0: digit_holder <= outDigit;
           1'b1: digit_holder <= inDigit;
       endcase 
    end
endmodule
