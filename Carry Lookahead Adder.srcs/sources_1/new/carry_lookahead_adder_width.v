`timescale 1ns / 1ps

module carry_lookahead_adder
  #(parameter WIDTH = 8)
  (
   input [WIDTH-1:0] A,
   input [WIDTH-1:0] B,
   output [WIDTH:0]  SUM
   );
    
  wire [WIDTH:0] wire_Carry;
  wire [WIDTH-1:0] wire_G, wire_P, wire_SUM;

  // Create the Full Adders
  genvar i;
  generate
    for (i=0; i<WIDTH; i=i+1) 
      begin
        full_adder full_adder_inst
            ( 
              .a(A[i]),
              .b(B[i]),
              .i_carry(wire_Carry[i]),
              .sum(wire_SUM[i]),
              .o_carry() // this should be empty
              );
      end
  endgenerate

  genvar j;
  generate
    for (j=0; j<WIDTH; j=j+1) 
      begin
        assign wire_G[j]   = A[j] & B[j]; // Generate (G) Terms:  Gi=Ai*Bi
        assign wire_P[j]   = A[j] | B[j]; // Generate (P) Terms:   Pi=Ai+Bi
        assign wire_Carry[j+1] = wire_G[j] | (wire_P[j] & wire_Carry[j]); // Generate the equation of carry which is dependent on only the first value of the carry, that is wire_Carry[0] = 1'b0.
      end
  endgenerate
  
  assign wire_Carry[0] = 1'b0; // no carry input on first adder

  assign SUM = {wire_Carry[WIDTH], wire_SUM};   // Verilog Concatenation

endmodule // carry_lookahead_adder
