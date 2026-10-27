`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2026 02:09:46 PM
// Design Name: 
// Module Name: adder
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



module adder(
    input  logic [31:0] a,  // Operand A
    input  logic [31:0] b,  // Operand B
    output logic [31:0] y   // Sum output
);

    always_comb begin
        y = a + b;
    end

endmodule

