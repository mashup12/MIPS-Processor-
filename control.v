
 // Control block with jump
	
module control(op,RegDst,RegWrite,ALUSrc,Branche,Branchn,MemRead,MemWrite,MemtoReg,ALUOp,Jump);

	input [5:0]op;
	output reg RegDst,RegWrite,ALUSrc,Branche,Branchn,MemRead,MemWrite,MemtoReg,Jump ;
	output reg [1:0]ALUOp;
	
	parameter R=6'b000000;		//R-format operation
	parameter Beq=6'b000100; 		//Branch if equal
	parameter Bne=6'b000110;		//Branch if not equal
	parameter Lw=6'b100011;		//Load from memory
	parameter Sw=6'b101011;		//store to memory
	parameter Jmp=6'b100110;		//unconditional jump
	parameter Addi=6'b101000;		//immediate addition
 
	
	always @(*)
	case(op)
		R:
		begin
			RegDst=1;
			RegWrite=1;
			ALUSrc=0;
			Branche=0;		// Branche signifies Beq Signal
			Branchn=0;		// Branchn signifies Bne signal
			MemRead=0;
			MemWrite=0;
			MemtoReg=0;
			ALUOp=2'b00;
			Jump=0;
		
		end
		
		
		Beq:
		begin
			RegDst=1'bx;
			RegWrite=0;
			ALUSrc=0;
			Branche=1;
			Branchn=0;
			MemRead=0;
			MemWrite=0;
			MemtoReg=1'bx;
			ALUOp=2'b01;
			Jump=0;
		
		end
		
		
		Bne:
		begin
			RegDst=1'bx;
			RegWrite=0;
			ALUSrc=0;
			Branche=0;
			Branchn=1;
			MemRead=0;
			MemWrite=0;
			MemtoReg=1'bx;
			ALUOp=2'b01;
			Jump=0;
		
		end
		
		
		Lw:
		begin
			RegDst=0;
			RegWrite=1;
			ALUSrc=1;
			Branche=0;
			Branchn=0;
			MemRead=1;
			MemWrite=0;
			MemtoReg=1;
			ALUOp=2'b10;
			Jump=0;
		
		end
		
		
		Sw:
		begin
			RegDst=1'bx;
			RegWrite=1;
			ALUSrc=1;
			Branche=0;
			Branchn=0;
			MemRead=0;
			MemWrite=1;
			MemtoReg=1'bx;
			ALUOp=2'b10;
			Jump=0;
		
		end
		
		
		Jmp:
		begin
			RegDst=1'bx;
			RegWrite=0;
			ALUSrc=0;
			Branche=0;
			Branchn=0;
			MemRead=0;
			MemWrite=0;
			MemtoReg=1'bx;
			ALUOp=2'b10;
			Jump=1;
		
		end
		
		
		Addi:
		begin
			RegDst=0;
			RegWrite=1;
			ALUSrc=1;
			Branche=0;
			Branchn=0;
			MemRead=0;
			MemWrite=0;
			MemtoReg=0;
			ALUOp=2'b10;
			Jump=0;
		
		end
		
	endcase

endmodule

		
		
	
		
	