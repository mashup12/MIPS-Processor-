module Register(Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clk);

	input [4:0] Read1,Read2,WriteReg;                 // the register numbers to read or write
	input [31:0] WriteData;                           // data to write
	input RegWrite,clk; 		                  // the write control and clock to trigger write
	
	output reg [31:0] Data1,Data2;                    // the register values read
	
	reg [31:0] RF[31:0];                              //32 register each 32 bits long
		
	initial begin                                     //Initializing all the registers
                RF[00] <= 32'h00000000;  
                RF[01] <= 32'h00000000;  
                RF[02] <= 32'h00000000;  
                RF[03] <= 32'h00000000;  
                RF[04] <= 32'h00000000;  
                RF[05] <= 32'h00000000;  
                RF[06] <= 32'h00000000;  
                RF[07] <= 32'h00000000;
                RF[08] <= 32'h00000000;  
                RF[09] <= 32'h00000000;  
                RF[10] <= 32'h00000000;  
                RF[11] <= 32'h00000000;  
                RF[12] <= 32'h00000000;  
                RF[13] <= 32'h00000000;  
                RF[14] <= 32'h00000000;  
                RF[15] <= 32'h00000000;
                RF[16] <= 32'h00000000;  
                RF[17] <= 32'h00000000;  
                RF[18] <= 32'h00000000;  
                RF[19] <= 32'h00000000;  
                RF[20] <= 32'h00000000;  
                RF[21] <= 32'h00000000;  
                RF[22] <= 32'h00000000;  
                RF[23] <= 32'h00000000;
                RF[24] <= 32'h00000000;  
                RF[25] <= 32'h00000000;  
                RF[26] <= 32'h00000000;  
                RF[27] <= 32'h00000000;  
                RF[28] <= 32'h00000000;  
                RF[29] <= 32'h00000000;  
                RF[30] <= 32'h00000000;  
                RF[31] <= 32'h00000000;
           end   
           
           always @ (posedge clk) begin                           //register write operation
                if(RegWrite) begin  
                     RF[WriteReg] <= WriteData;  
                end  
        
           end  
      
		always @(*)                                          //read operation
	
		begin
			Data1 <= RF[Read1];
			Data2 <= RF[Read2];
		end


endmodule
