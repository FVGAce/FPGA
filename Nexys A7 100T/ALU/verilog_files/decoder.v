`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 08:05:04 PM
// Design Name: 
// Module Name: decoder
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


module decoder(
    input CLK100MHZ,     // Clock
    input c_out,         
    input DispCont,      // Display Control
    input [2:0] rr,
    input [3:0] OpCode,  // Operations
    input [3:0] A,       // Input A
    input [3:0] B,       // Input B
    input [3:0] out,     // Output of ALU
    output reg [4:0] digit_holder,
    output reg [2:0] op, // Remaped Operations for ALU
    output reg mode,     // Remaped Mode for ALU
    output reg c_in      // Intended c_in for an operation
    );
    
    wire [3:0] outones;
    wire [3:0] outtens;
    
    bin_to_BCD conv(.binary(out), .BCD({outtens, outones}));
    
    
    //Assign values to needed inputs of the ALU
    always @(*) begin
        case(OpCode)
            4'b0000: begin
                mode = 1'b1; op = 3'b000; c_in = 1'b0; //negate A
            end
            4'b0001: begin
                mode = 1'b1; op = 3'b001; c_in = 1'b0; //negate B
            end
            4'b0010: begin
                mode = 1'b0; op = 3'b110; c_in = 1'b0; //A'
            end
            4'b0011: begin
                mode = 1'b0; op = 3'b111; c_in = 1'b0; //B'
            end
            4'b0100: begin
                mode = 1'b1; op = 3'b010; c_in = 1'b0; //A+B
            end
            4'b0101: begin
                mode = 1'b1; op = 3'b011; c_in = 1'b1; //A-B
            end
            4'b0110: begin
                mode = 1'b1; op = 3'b110; c_in = 1'b0; //A+1
            end
            4'b0111: begin
                mode = 1'b1; op = 3'b111; c_in = 1'b1; //A-1
            end
            4'b1000: begin
                mode = 1'b1; op = 3'b100; c_in = 1'b0; //A*B
            end
            4'b1001: begin
                mode = 1'b1; op = 3'b101; c_in = 1'b1; //B-A
            end
            4'b1010: begin
                mode = 1'b0; op = 3'b000; c_in = 1'b0; //A AND B
            end
            4'b1011: begin
                mode = 1'b0; op = 3'b001; c_in = 1'b0; //A OR B
            end
            4'b1100: begin
                mode = 1'b0; op = 3'b010; c_in = 1'b0; //A NAND B
            end
            4'b1101: begin
                mode = 1'b0; op = 3'b011; c_in = 1'b0; //A NOR B
            end
            4'b1110: begin
                mode = 1'b0; op = 3'b100; c_in = 1'b0; //A XOR B
            end
            4'b1111: begin
                mode = 1'b0; op = 3'b101; c_in = 1'b0; //A XNOR B
            end
            default: begin
                mode = 1'bx; op = 3'bxxx; c_in = 1'bx; //Defaults
            end
        endcase 
    end

    //Assigns current digit to a value which then needs to be mapped
    always @(*) begin
        if(DispCont == 1'b1)begin
            case(rr)
                3'b101: digit_holder = OpCode;
                3'b110: digit_holder = A;
                3'b111: digit_holder = B;
                default: digit_holder = 5'b10000;
            endcase
        end else begin
            case(rr)
                3'b101: 
                       digit_holder = ~((OpCode == 4'b0100) | (OpCode == 4'b0110) | (OpCode == 4'b1000) ) & 
                                        c_out == 0 & mode == 1 ? 5'b10001: 5'b10000;
                3'b110: digit_holder = outtens;
                3'b111: digit_holder = outones;
                default: digit_holder = 5'b10000;
            endcase
        end
    end
endmodule