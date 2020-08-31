module MIPStest;  
      // Inputs  
      reg clk;  
      reg reset;  
      // Outputs  
      wire [31:0] pc_out,ALUOut,ins,Data2, A,B,WriteData,shift2,branch_add,SignExtend;
      wire [4:0] Read1,Read2,WriteReg;
      wire [3:0]ALUCtl;
      wire Zero;
      
      //wire [15:0] alu_result;//,reg3,reg4;  
      // Instantiate the Unit Under Test (UUT)  
      MIPS uut (  
           .clk(clk),   
           .reset(reset),   
           .pc_out(pc_out),
           .ALUOut(ALUOut),
           
           .ins(ins),
           .Read1(Read1),.Read2(Read2),.WriteReg(WriteReg),.Data2(Data2), .A(A),.B(B),.ALUCtl(ALUCtl), 
           .WriteData(WriteData) ,.Zero(Zero),.shift2(shift2),.branch_add(branch_add),.SignExtend(SignExtend)
           //.alu_result(alu_result)  
           //.reg3(reg3),  
          // .reg4(reg4)  
      );  
      initial begin  
           clk = 0;  
           forever #10 clk = ~clk;  
      end  
	  
	  initial begin
	$shm_open("shm.db",1);
	$shm_probe("AS");
	#800 $finish;
	#100 $shm_close();
		end

      initial begin  
           // Initialize Inputs  
           //$monitor ("register 3=%d, register 4=%d", reg3,reg4);  
           reset = 1;  
           // Wait 100 ns for global reset to finish  
           #10;  
			reset = 0;
			//$stop;  
           // Add stimulus here  
      end  
 endmodule  
