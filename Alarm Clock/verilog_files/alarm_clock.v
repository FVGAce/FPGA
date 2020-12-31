`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 01:16:35 AM
// Design Name: 
// Module Name: alarm_clock
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


module alarm_clock(
    input CLK100MHZ,
    input CPU_RESETN,
    input PS2_CLK,
    input PS2_DATA,
    input time_format,
    input alarm_on,
    output [7:0] AN,
    output [6:0] seg,
    output AUD_PWM,
    output AUD_SD,
    output TOD
    );
    
    reg [4:0] digit_holder;
    
    wire [23:0] itime;
    wire [4:0] in_digit_holder;
    wire [4:0] time_digit_holder;
    wire [2:0] rr;
    wire set;
    wire new;
    wire in;
    wire enable;
    
    time_input time_in(.CLK100MHZ(CLK100MHZ), .PS2_CLK(PS2_CLK), .PS2_DATA(PS2_DATA), .rr(rr),
                        .itime(itime), .digit_holder(in_digit_holder), .set(set), .new(new), .in(in));
    clock Clock(.CLK100MHZ(CLK100MHZ), .CPU_RESETN(CPU_RESETN), .time_format(time_format), .alarm_on(alarm_on),
                            .set(set), .new(new), .itime(itime), .rr(rr), .digit_holder(time_digit_holder),
                            .enable(enable), .TOD(TOD));
    disp_7_seg disp(.CLK100MHZ(CLK100MHZ), .digit_holder(digit_holder), .refresh_rate(rr), .AN(AN), .seg(seg));
    note_playing note(.CLK100MHZ(CLK100MHZ), .enable(enable), .AUD_PWM(AUD_PWM), .AUD_SD(AUD_SD));
    
    always @(CLK100MHZ)begin
        if(in)
            digit_holder = in_digit_holder;
        else
            digit_holder = time_digit_holder;
    end
endmodule
