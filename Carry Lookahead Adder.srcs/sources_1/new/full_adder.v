`timescale 1ns / 1ps

module full_adder (
    input a,
    input b,
    input i_carry,
    output sum,
    output o_carry);

  wire   WIRE_1;
  wire   WIRE_2;
  wire   WIRE_3;
      
  assign WIRE_1 = a ^ b;
  assign WIRE_2 = WIRE_1 & i_carry;
  assign WIRE_3 = a & b;

  assign sum   = WIRE_1 ^ i_carry;
  assign o_carry = WIRE_2 | WIRE_3;
  
endmodule // module_full_adder
