`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 21:34:43
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
reg [7:0]a,b;
reg [3:0]command;
reg  enb;
wire [15:0]d_out;

integer m,n,o;

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
             
  reg [4*8:0]string_cmd;
  
  
  alu_8bit Dut(a,
          b,
          command,
          enb,
          d_out);
          
          
  task initialize;
  begin
   {a,b,command,enb}=0;
   
   end
   endtask
   
  task en_oe(input i);
  begin
  enb=i;
  end
  endtask
  
  task inputs(input [7:0] j,k);
  begin
  a=j;
  b=k;
  end
  endtask
  
  task cmd(input [3:0] i);
  begin
  command=i;
  end
  endtask
  task delay();
  begin
  #10;
  end
  endtask
  
  always@(command)
  begin
  case(command)
      ADD    :string_cmd="ADD";
     SUB     :string_cmd="SUB";
     MUL     :string_cmd="MUL";
     DIV     :string_cmd="DIV";
     INC     :string_cmd="INC";
     DEC     :string_cmd="DEC";
     SHL     :string_cmd="SHL";
     SHR     :string_cmd="SHR";
     AND     :string_cmd="AND";
     OR      :string_cmd="OR";           
     NOT     :string_cmd="NOT";
     NAND    :string_cmd="NAND";
     NOR     :string_cmd="NOR";
     XOR     :string_cmd="XOR";
     XNOR    :string_cmd="XNOR";     
     BUF     :string_cmd="BUF" ; 
     endcase
     end
     
     initial begin
     initialize;
     en_oe(1'b1);
     for(m=0;m<16;m=m+1)
     begin
     for(n=0;n<16;n=n+1)
     begin
     inputs(m,n);
     for(o=0;o<16;o=o+1)
     begin
     command=0;
     delay;
     end
     end
     end
     en_oe(1);
     inputs(8'd20,8'd10);
     cmd(ADD);
     delay;
     en_oe(1);
     inputs(8'd25,8'd17);
     cmd(ADD);
     delay;
     $finish;
     end
     initial
     $monitor("input oe=%b, a=%b, b=%b, command=%b, output out=%b",enb,a,b,string_cmd,d_out);
     endmodule