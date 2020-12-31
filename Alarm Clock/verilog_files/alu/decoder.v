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
    input [3:0] OpCode,  // Operations
    input [3:0] A,       // Input A
    input [3:0] B,       // Input B
    output [3:0] out,    // Output of ALU
    output c_out         // C__out of ALU
    );
    
    reg [2:0] op;
    reg mode;
    reg c_in;
    
    alu ALUfront(.A(A), .B(B), .c_in(c_in), .mode(mode), .op(op), .out(out), .c_out(c_out));
    
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
endmodule