`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2026 02:15:46 PM
// Design Name: 
// Module Name: alu_dec
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


module aludec(
    input  logic        opb5,       // opcode bit [5]
    input  logic [2:0]  funct3,
    input  logic        funct7b5,   // funct7 bit [5]
    input  logic [1:0]  ALUOp,
    output logic [2:0]  ALUControl
);

  logic RtypeSub;
  assign RtypeSub = funct7b5 & opb5; // sub only for R-type; addi has imm bit 30 = don't care

  always_comb begin
    case (ALUOp)
      2'b00:   ALUControl = 3'b000;  // add (lw, sw, jal)
      2'b01:   ALUControl = 3'b001;  // sub (branch compare)
      default: case (funct3)         // R-type / I-type ALU
        3'b000:  ALUControl = RtypeSub ? 3'b001 : 3'b000; // sub / add, addi
        3'b010:  ALUControl = 3'b101;  // slt, slti
        3'b100:  ALUControl = 3'b100;  // xor, xori
        3'b110:  ALUControl = 3'b011;  // or, ori
        3'b111:  ALUControl = 3'b010;  // and, andi
        default: ALUControl = 3'bxxx;
      endcase
    endcase
  end

endmodule