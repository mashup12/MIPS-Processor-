module jumpcontrol(pc,ins,jmpadd);

	input [31:0]pc,ins;
	output reg [31:0]jmpadd;
	parameter s0=32'b00000011111111111111111111111111,s1=32'b11110000000000000000000000000000; // s0 mask of ins, s1 mask of pc
	//input [5:0]pc,ins;
	//output reg [5:0]jmpadd;
	//parameter s0=6'b000011,s1=6'b110000; // s0 mask of ins, s1 mask of pc
	reg [31:0]pc1,ins1;
	
	always@(*)
	begin
	ins1= ins&s0 ;
	ins1=ins1<<2;    ////{ins1[29:0],2'b00};       /////ins1<<2;
	pc1 = pc & s1;
	
	jmpadd=pc1 | ins1;
	end
endmodule	
		
	
	
