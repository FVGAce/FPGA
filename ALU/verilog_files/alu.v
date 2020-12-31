`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 12:37:26 PM
// Design Name: 
// Module Name: alu
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


module alu(
           input [3:0] A,
           input [3:0] B,        // 4-bit Inputs
           input c_in,           // Carry in input                 
           input mode,           // Mode Selection
           input [2:0]op,        // operation 3-bit input
           output reg [3:0] out, //  4-bit Output
           output reg c_out      // Carry Out Flag
    );
    
    wire [3:0] Result;
    wire t_c_out;
    reg [3:0] t_a = 3'b000, t_b = 3'b000;
    
    //cs_adder adder(.sum(Result), .c_out(t_c_out), .a(t_a), .b(t_b), .c_in(c_in), .mode(c_in));    
    CLA_Adder(.a(A), .b(B), .mode(mode), .c_in(c_in), .sum(Result), .c_out(t_c_out));
    
    always @(*) begin
        if (mode == 1'b0) begin //Logical Operations
            c_out = 0;
            
            case(op)
                3'b000: // Logical and 
                    out = A & B;
                3'b001: //  Logical or
                    out = A | B;
                3'b010: // Logical nand 
                    out = ~(A & B);
                3'b011: // Logical nor
                    out = ~(A | B);
                3'b100: // Logical xor 
                    out = A ^ B;
                3'b101: // Logical xnor
                    out = ~(A ^ B);
                3'b110: // NOT a
                    out = ~A;
                3'b111: // NOT b
                    out = ~B; 
                default:
                    out = 3'bxxx;
            endcase    
        end else begin
            case(op) //Arithmetic
                3'b000: begin // negate a (-1*A)
                    out = A; c_out = 0;
                end 
                3'b001: begin // negate b (-1*B)
                    out = B; c_out = 0;
                end
                3'b010: begin // Addition (A+B)
                    t_a = A; t_b = B; out = Result; c_out = t_c_out;
                end
                3'b011: begin // Substraction (A-B)
                    t_a = A; t_b = B; c_out = t_c_out;
                    
                    if (t_c_out == 0) begin
                        out = (Result^4'b1111) + 1;
                    end else begin
                        out = Result;
                    end
                end
                3'b100: begin // Multiplication (A*B)
                    out = A * B;
                    
                    if ((A * B) > 15) begin
                        c_out = 1;
                    end else begin
                        c_out = 0;
                    end
                end 
                3'b101: begin // Subtraction (B-A)
                    t_a = B; t_b = A; c_out = t_c_out;
                    
                    if (t_c_out == 0) begin
                        out = (Result^4'b1111) + 1;
                    end else begin
                        out = Result;
                    end
                end
                3'b110: begin // Add 1 (A + 1)
                    t_a = A; t_b = 1; out = Result; c_out = t_c_out;
                end
                3'b111: begin // Subtract 1 (A - 1)
                    t_a = A; t_b = 1; c_out = t_c_out;
                    
                    if (t_c_out == 0) begin
                        out = (Result^4'b1111) + 1;
                    end else begin
                        out = Result;
                    end
                end
                default: begin
                    out = 3'bxxx; c_out = 1'bx;
                end
            endcase
        end
    end
endmodule
