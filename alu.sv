`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2026 03:06:08 PM
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
    input  logic [31:0] a, b,          // operands
    input  logic [2:0]  alucontrol,    // operation selector
    output logic [31:0] result         // operation result
);

    logic [31:0] sum;
    logic        isSub;

    assign isSub = alucontrol[0];
    assign sum   = a + (isSub ? ~b : b) + isSub; // add / sub

    always_comb begin
        case (alucontrol)
            3'b000:  result = sum;                                  // add
            3'b001:  result = sum;                                  // sub
            3'b010:  result = a & b;                                // and
            3'b011:  result = a | b;                                // or
            3'b100:  result = a ^ b;                                // xor
            3'b101:  result = {31'b0, $signed(a) < $signed(b)};     // slt
            default: result = 32'bx;
        endcase
    end

endmodule