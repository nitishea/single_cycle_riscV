`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2026 02:31:11 PM
// Design Name: 
// Module Name: imem
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



module imem(
    input  logic [31:0] a,
    output logic [31:0] rd
);

    logic [31:0] mem [0:63];

    // Initialize memory from text file
    initial begin
        $readmemh("imem.txt", mem);
    end

    // Combinational read
    always_comb begin
        rd = mem[a[7:2]];
    end

endmodule

