`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2026 02:16:25 PM
// Design Name: 
// Module Name: resetable_ff
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



module flopr #(parameter WIDTH = 8)(
    input  logic [WIDTH-1:0] d,
    input  logic             clk,
    input  logic             reset,
    output logic [WIDTH-1:0] q
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            q <= '0;
        else
            q <= d;
    end

endmodule

