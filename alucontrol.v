
// 4 bit ALU Control unit

module alucontrol(ALUOp,FuncCode,ALUCtl);
	
	input [1:0]ALUOp;
	input [5:0]FuncCode;
	output reg [3:0]ALUCtl;
	
	parameter Rformat = 2'b00;		// if R-format instruction is executed
	parameter Brnch = 2'b01;		// If Beq or Bne command occurs
	parameter Others = 2'b10;		// if Lw,Sw,Addi,Jump occurs
	
	parameter Add = 6'b100000; 		// ADD operation
	parameter Sub = 6'b100010;		// SUB operation			
	parameter And = 6'b100100;		// AND operation
	parameter Or = 6'b100101;		// OR operation
	parameter Slt = 6'b101010;		// SLT operation
	parameter Nor = 6'b101111;		// NOR operation
	
	
	always@(*)
	case(ALUOp)
		Rformat:
			begin 
				case(FuncCode)
				
					Add:
					begin
						ALUCtl=4'b1010;
						
					end
					
					Sub:
					begin
						ALUCtl=4'b1110;
						
					end
					
					And:
					begin
						ALUCtl=4'b0000;
						
					end
					
					Or:
					begin
						ALUCtl=4'b0001;
						
					end
					
					Slt:
					begin
						ALUCtl=4'b0101;
						
					end
					
					Nor:
					begin
						ALUCtl=4'b0011;
						
					end
			
				endcase
			
			end
	
	
	
		Brnch:
			begin
				ALUCtl=4'b1110; // ALU works as a Subtractor(SUB operation) to determine if the Zero signal from ALU is 1 or 0
			
			end
	
		Others:
			begin
				ALUCtl=4'b1010; // ALU works as an Adder(ADD operation) to give the address of the register to be written or containing a data or immediate addition 
			
			end
		

	endcase



endmodule

