`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2024 15:32:36
// Design Name: 
// Module Name: abc
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

module carry_lookahead_adder_tb ();

  parameter WIDTH = 8;

  reg [WIDTH-1:0] A = 0;
  reg [WIDTH-1:0] B = 0;
  wire [WIDTH:0]  SUM;
  
  carry_lookahead_adder #(.WIDTH(WIDTH)) carry_lookahead_inst
    (
     .A(A),
     .B(B),
     .SUM(SUM)
     );

  initial
    begin
      A = 8'hab;
      B = 8'hcd;
      #10;
      
      A = 8'haa;
      B = 8'h23;
      #10;
      
      A = 8'hef;
      B = 8'h1f;
      #10;
      
      A = 8'h83;
      B = 8'h9d;
      #10;
      
      A = 8'hc4;
      B = 8'hfb;
      #10;
      
      $finish;
    end

endmodule // carry_lookahead_adder_tb


