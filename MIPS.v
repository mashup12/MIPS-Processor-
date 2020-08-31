module MIPS(clk,reset,pc_out,ALUOut,ins,Read1,Read2,WriteReg,Data2, A,B,ALUCtl,WriteData,Zero,shift2,branch_add,SignExtend);
	input clk,reset;
	output wire [31:0]pc_out;
	
	//for PC
	reg[31:0] pc_current;
	wire [31:0] pc_next,pc4;
	
	
	//wires from control
	wire [5:0]op;
	wire RegDst,RegWrite,ALUSrc,Branche,Branchn,MemRead,MemWrite,MemtoReg,Jump ;
	wire [1:0]ALUOp;
	
	//wires from alucontrol
	//wire [1:0]ALUOp;
	wire [5:0]FuncCode;
	output wire [3:0]ALUCtl;
	
	//wires from jumpcontrol
	output wire [31:0]ins;
	wire [31:0]pc;
	wire [31:0]jmpadd;
	
	//wires from branchcontrol
	output wire Zero; //Branche,Branchn,
	wire PCSrc;
	
	
	//wires from insMem
	//wire  [6:0] pc_out;
	//wire [31:0] ins ;
	
	//wires from Register
	output wire [4:0] Read1,Read2,WriteReg;                 // the register numbers to read or write
	output wire [31:0] WriteData;                           // data to write
	//wire RegWrite,clk; 		                  // the write control and clock to trigger write
	output wire [31:0] Data2;//Data1(A) 
	
	//wires from alu
	//wire [3:0] ALUCtl;
	output wire [31:0] A,B;//B(Data2);
	output wire [31:0] ALUOut;
	//wire Zero;
	
	
	//wires from data_memory
	//wire [31:0] address(ALUOut); 
      
      //wire [31:0] Wdata(Data2);  
      //input MemWrite;  
      //input MemRead;  
    wire [31:0] Rdata;
	 
	 //Sign extension
	 output wire [31:0]SignExtend;
	 output wire [31:0]shift2;
	 
	 //branch_add
	 output wire [31:0]branch_add;
	 
	 wire [31:0]bmux_out;
	 
	 
	 
	 
	 
	 
	 
	 
	 
	//Program Counter
	always @ (posedge clk,posedge reset)
	begin   
      if(reset)   
           pc_current <= 32'b0;  
      else  
           pc_current <= pc_next;  
	end  
	
	assign pc4 = pc_current + 32'd4;
	
	// instruction memory  
	insMem instrucion_memory(.pc_out(pc_current),.instruction(ins)); 

	//control 
	control control_unit(.op(ins[31:26]),.RegDst(RegDst),.RegWrite(RegWrite),.ALUSrc(ALUSrc),
						.Branche(Branche),.Branchn(Branchn),.MemRead(MemRead),.MemWrite(MemWrite),.MemtoReg(MemtoReg),
						.ALUOp(ALUOp),.Jump(Jump));
						
	// multiplexer regdest  
	assign WriteReg = (RegDst==0) ? ins[20:16] : ins[15:11];	
				
	// register file  
	assign Read1 = ins[25:21];  
	assign Read2 = ins[20:16];
	
	Register reg_file(.Read1(Read1), .Read2(Read2), .WriteReg(WriteReg), .WriteData(WriteData),
						.RegWrite(RegWrite), .Data1(A), .Data2(Data2), .clk(clk));
	
   //Sign extension_execution	
	assign SignExtend = { {16{ins[15]}}, ins[15:0]};
	
	//AluSource_mux
	assign B = (ALUSrc==1'b0) ? Data2 : SignExtend; 
	
	// JR control  
	 jumpcontrol JRControl_unit(.pc(pc4),.ins(ins),.jmpadd(jmpadd));	 
	 
	 

	 
	// ALU control unit  
	alucontrol ALU_Control_unit(.ALUOp(ALUOp),.FuncCode(ins[5:0]),.ALUCtl(ALUCtl)); 
	
	
	
	// ALU   
	ALU alu_unit(.ALUCtl(ALUCtl), .A(A), .B(B), .ALUOut(ALUOut), .Zero(Zero));
	
	
	// Branch control unit  
	branchcontrol Branch_Control_unit(.Branche(Branche),.Branchn(Branchn),.Zero(Zero),.PCSrc(PCSrc)); 
	
	// immediate shift 2 
	assign shift2 = SignExtend<<2;  ///{SignExtend[29:0],2'b00}

	// PC beq add  
	assign branch_add = pc4+shift2; 

	//Branching Mux
	assign bmux_out = (PCSrc==1'b0) ? pc4 : branch_add;
	
	//Jumping Mux
	assign pc_next = (Jump==1'b0) ? bmux_out : jmpadd;
	
	// data memory  
	 data_memory datamem(.clk(clk),.address(ALUOut),.Wdata(Data2),
		.MemWrite(MemWrite),.MemRead(MemRead),.Rdata(Rdata) );
		
	// write back  
	assign WriteData = (MemtoReg == 0) ?  ALUOut: Rdata;
	
	 
    
    assign pc_out = pc_current;  
 
endmodule
