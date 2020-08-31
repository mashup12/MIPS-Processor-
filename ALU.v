module ALU (ALUCtl, A, B, ALUOut, Zero);

	 input [3:0] ALUCtl;
	 input [31:0] A,B;
	 output reg [31:0] ALUOut;
	 output Zero;

	 always @(*) begin                                 //reevaluate if these change
	 
		 case (ALUCtl)
			 4'b0000: begin assign ALUOut = A & B;        //and operation
				  end
				  
			 4'b0001: begin assign ALUOut = A | B;        //or operation
				  end
				  
			 4'b1010: begin assign ALUOut = A + B;        //add operation
			 	  end
			 	  
			 4'b1110: begin assign ALUOut = A - B;        //subtract operation
			 	  end
			 	  
			 4'b0101: begin assign ALUOut = (A < B) ? 1 : 0; //set less than operation

				  end
			 4'b0011: begin assign ALUOut = ~(A | B);      // nor operation
				  end
			  
		 	default: assign ALUOut = 0;
	 	endcase
	 end
	 
	 assign Zero = (ALUOut == 0); //Zero is true if ALUOut is 0

endmodule
