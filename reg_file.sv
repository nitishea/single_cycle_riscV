`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2026 02:21:58 PM
// Design Name: 
// Module Name: reg_file
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



module regfile(
    input  logic        clk,
    input  logic        we3,
    input  logic [4:0]  a1, a2, a3,
    input  logic [31:0] wd3,
    output logic [31:0] rd1, rd2
);

    logic [31:0] rf [31:0];

    // Write port
    always_ff @(posedge clk) begin
        if (we3 && (a3 != 5'd0))
            rf[a3] <= wd3;
    end

    // Read ports (combinational)
    always_comb begin
        rd1 = (a1 == 5'd0) ? 32'b0 : rf[a1];
        rd2 = (a2 == 5'd0) ? 32'b0 : rf[a2];
    end

endmodule
