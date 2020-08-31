
// Branch control unit

module branchcontrol(Branche,Branchn,Zero,PCSrc);

	input Branche,Branchn,Zero;
	output reg PCSrc;
	
	parameter One =1'b1;		// output 1 (the original two inputs are equal)
	parameter Zro =1'b0;		// output 0 (the original two inputs are not equal)
	
	
	always@(*)
	case(Zero)
		One:
		begin
			PCSrc= Zero & Branche; // if Branch signal is asserted Beq is executed
		
		end
		
		Zro:
		begin
			PCSrc= ~Zero & Branchn; //if Branch signal is asserted Bne is executed
		
		end
	
	endcase
	
endmodule