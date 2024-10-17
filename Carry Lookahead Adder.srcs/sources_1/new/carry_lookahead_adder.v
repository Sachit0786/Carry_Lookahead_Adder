`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2024 14:55:44
// Design Name: 
// Module Name: carry_lookahead_adder
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

`include "full_adder.v"

module carry_lookahead_adder_8_bit(
   input [7:0]  i_add1,
   input [7:0]  i_add2,
   output [8:0] o_result
   );
    
  wire [8:0] wire_C;
  wire [7:0] wire_G; 
  wire [7:0] wire_P; 
  wire [7:0] wire_SUM;
  
  full_adder full_adder_bit_0
    ( 
      .i_bit1(i_add1[0]),
      .i_bit2(i_add2[0]),
      .i_carry(wire_C[0]),
      .o_sum(wire_SUM[0]),
      .o_carry()
      );

  full_adder full_adder_bit_1
    ( 
      .i_bit1(i_add1[1]),
      .i_bit2(i_add2[1]),
      .i_carry(wire_C[1]),
      .o_sum(wire_SUM[1]),
      .o_carry()
      );

  full_adder full_adder_bit_2
    ( 
      .i_bit1(i_add1[2]),
      .i_bit2(i_add2[2]),
      .i_carry(wire_C[2]),
      .o_sum(wire_SUM[2]),
      .o_carry()
      );
  
  full_adder full_adder_bit_3
    ( 
      .i_bit1(i_add1[3]),
      .i_bit2(i_add2[3]),
      .i_carry(wire_C[3]),
      .o_sum(wire_SUM[3]),
      .o_carry()
      );
   
   full_adder full_adder_bit_4
    ( 
      .i_bit1(i_add1[4]),
      .i_bit2(i_add2[4]),
      .i_carry(wire_C[4]),
      .o_sum(wire_SUM[4]),
      .o_carry()
      );     
    
    full_adder full_adder_bit_5
    ( 
      .i_bit1(i_add1[5]),
      .i_bit2(i_add2[5]),
      .i_carry(wire_C[5]),
      .o_sum(wire_SUM[5]),
      .o_carry()
      );
    
    full_adder full_adder_bit_6
    ( 
      .i_bit1(i_add1[6]),
      .i_bit2(i_add2[6]),
      .i_carry(wire_C[6]),
      .o_sum(wire_SUM[6]),
      .o_carry()
      );    
      
      
  // Create the Generate (G) Terms:  Gi=Ai*Bi
  assign wire_G[0] = i_add1[0] & i_add2[0];
  assign wire_G[1] = i_add1[1] & i_add2[1];
  assign wire_G[2] = i_add1[2] & i_add2[2];
  assign wire_G[3] = i_add1[3] & i_add2[3];
  assign wire_G[4] = i_add1[4] & i_add2[4];
  assign wire_G[5] = i_add1[5] & i_add2[5];
  assign wire_G[6] = i_add1[6] & i_add2[6];
  assign wire_G[7] = i_add1[7] & i_add2[7];

  // Create the Propagate Terms: Pi=Ai+Bi
  assign wire_P[0] = i_add1[0] | i_add2[0];
  assign wire_P[1] = i_add1[1] | i_add2[1];
  assign wire_P[2] = i_add1[2] | i_add2[2];
  assign wire_P[3] = i_add1[3] | i_add2[3];
  assign wire_P[4] = i_add1[4] | i_add2[4];
  assign wire_P[5] = i_add1[5] | i_add2[5];
  assign wire_P[6] = i_add1[6] | i_add2[6];
  assign wire_P[7] = i_add1[7] | i_add2[7];

  // Create the Carry Terms:
  assign wire_C[0] = 1'b0; // no carry input
  assign wire_C[1] = wire_G[0] | (wire_P[0] & wire_C[0]);
  assign wire_C[2] = wire_G[1] | (wire_P[1] & wire_C[1]);
  assign wire_C[3] = wire_G[2] | (wire_P[2] & wire_C[2]);
  assign wire_C[4] = wire_G[3] | (wire_P[3] & wire_C[3]);
  
  assign o_result = {wire_C[8], wire_SUM};   // Verilog Concatenation
endmodule
