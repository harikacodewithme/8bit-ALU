`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 21:33:44
// Design Name: 
// Module Name: alu_8bit
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

module alu_8bit(input [7:0]a_in,b_in,
           input [3:0] command_in,
           input enb,
           output [15:0]d_out);
           
  parameter  ADD =4'b0000,
             SUB =4'b0001,
             MUL =4'b0010,
             DIV =4'b0011,
             INC =4'b0100,
             DEC =4'b0101,
             SHL =4'b0110,
             SHR =4'b0111,
             AND =4'b1000,
             OR  =4'b1001,
             NOT =4'b1010,
             NAND =4'b1011,
             NOR =4'b1100,
             XOR =4'b1101,
             XNOR =4'b1110,         
             BUF =4'b1111;
             
  reg [15:0]out;
  
  always@(command_in,a_in,b_in)
   begin
   case(command_in)
     ADD     :out=a_in+b_in;
     SUB     :out=a_in-b_in;
     MUL     :out=a_in*b_in;
     DIV     :out=a_in/b_in;
     INC     :out=a_in + 1'b1;
     DEC     :out=a_in - 1'b1;
     SHL     :out=a_in << 1;
     SHR     :out=a_in >> 1;
     AND     :out=a_in & b_in;
     OR      :out=a_in | b_in;           
     NOT     :out=!(a_in);
     NAND    :out=~(a_in&b_in);
     NOR     :out=~(a_in|b_in);
     XOR     :out=a_in ^ b_in;
     XNOR    :out=a_in ~^ b_in;     
     BUF     :out=a_in ; 
     default:out=0;
    endcase
    end
    assign d_out = (enb) ? out : 16'hzzzz;
     
endmodule
