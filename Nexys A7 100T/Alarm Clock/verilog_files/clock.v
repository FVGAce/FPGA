`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 09:06:23 PM
// Design Name: 
// Module Name: clock
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

module clock(
    input CLK100MHZ,
    input CPU_RESETN,
    input time_format,
    input alarm_on,
    input set,
    input new,
    input [23:0] itime,
    input [2:0] rr,
    output reg [4:0] digit_holder,
    output reg enable,
    output reg TOD
    );
    
    reg [23:0] BCDtime = 24'h240000;
    reg [23:0] alarm;
    reg [7:0] BCDin;
    reg count;
    reg ncount;
    reg reset;
     
    wire [7:0] BCDsec;
    wire [7:0] BCDmin;
    wire [7:0] BCDhr;
    wire clk_stb;
    
    clk_1hz seconds(.CLK100MHZ(CLK100MHZ), .CPU_RESETN(CPU_RESETN), .reset(reset), .clk_stb(clk_stb));
    counter sec_Adder(.cur_time(BCDtime[7:0]), .new_time(BCDsec));
    counter min_Adder(.cur_time(BCDtime[15:8]), .new_time(BCDmin));
    counter hr_Adder(.cur_time(BCDtime[23:16]), .new_time(BCDhr));
    
    always @(posedge CLK100MHZ)begin
        if(~CPU_RESETN)begin
            BCDtime [23:16] <= 8'h24;
            BCDtime [15:0] <= 0;
        end else if(clk_stb & ~count)begin
            BCDtime[7:0] <= BCDsec;
            count <= 1;
        end else if(~clk_stb)begin
            count <= 0;
        end
        
        if(BCDtime[7:0] >= 8'h60)begin
            BCDtime[7:0] <= 0;
            BCDtime[15:8] <= BCDmin;
        end
        
        if(BCDtime[15:8] >= 8'h60)begin
            BCDtime[15:8] <= 0;
            BCDtime[23:16] <= BCDhr;
        end
        
        if(BCDtime[23:16] >= 8'h25)begin
            BCDtime[23:16] <= 8'h01;
        end
        
        if(new & ~ncount & ~(itime == 0))begin
            if(set)begin
                BCDtime <= itime;
                reset <= 1;
            end else
                alarm <= itime;
                
            ncount <= 1;
        end else if(~new)begin
            ncount <= 0;
            reset <= 0; 
        end
    end
    
    always @(posedge CLK100MHZ)begin
        if(~CPU_RESETN)
            enable <= 0;
        else if(alarm_on & (BCDtime == alarm))
            enable <= 1;
        else if(~alarm_on | (BCDtime == (alarm + 4'h5)))
            enable <= 0;
    end
    
    always @(posedge CLK100MHZ)begin
        if((BCDtime[23:16] < 8'h12) | (BCDtime[23:16] == 8'h24))
            TOD <= 1;
        else
            TOD <= 0;
    end
    
    always @(posedge CLK100MHZ)begin
        case(rr)
            3'b000: begin 
                       if(BCDtime[23:16] <= 8'h12)
                            digit_holder <= BCDtime[23:20];
                       else
                            digit_holder <= time_format ? (BCDtime[23:20] - 4'h1): BCDtime[23:20];
                    end
            3'b001: begin
                       if(BCDtime[23:16] <= 8'h12)
                            digit_holder <= BCDtime[19:16];
                        else
                            digit_holder <= time_format ? (BCDtime[19:16] - 4'h2): BCDtime[19:16];
                    end
            3'b011: digit_holder <= BCDtime[15:12];
            3'b100: digit_holder <= BCDtime[11:8];
            3'b110: digit_holder <= BCDtime[7:4];
            3'b111: digit_holder <= BCDtime[3:0];
            default: digit_holder <= 5'b10000;
        endcase
    end
endmodule
