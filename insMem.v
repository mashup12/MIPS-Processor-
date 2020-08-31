module insMem (
	input  [31:0] pc_out,
	output wire [31:0] instruction );
         
	wire[6:0]pc_out1=pc_out[6:0];
    wire[4:0]address=(pc_out1/4-1);
    reg [31:0]insMem[31:0];
	


	    initial begin 
			insMem[00]= 32'ha2310011;
			insMem[01]= 32'ha2520003;
			insMem[02]= 32'ha2490000;
			insMem[03]= 32'h02295022;
			insMem[04]= 32'h0229582a;
			insMem[05]= 32'h12290004;
			insMem[06]= 32'h198b0002;
			insMem[07]= 32'h01324820;
			insMem[08]= 32'h98000004;
			insMem[09]= 32'h01525020;
			insMem[10]= 32'hae4a0008;
			insMem[11]= 32'h00000000;
			insMem[12]= 32'h00000000;
			insMem[13]= 32'h00000000;
			insMem[14]= 32'h00000000;
			insMem[15]= 32'h00000000;
                        insMem[16]= 32'h00000000;
                        insMem[17]= 32'h00000000;
                        insMem[18]= 32'h00000000;
                        insMem[19]= 32'h00000000;
                        insMem[20]= 32'h00000000;
                        insMem[21]= 32'h00000000;
                        insMem[22]= 32'h00000000;
                        insMem[23]= 32'h00000000;
                        insMem[24]= 32'h00000000;
                        insMem[25]= 32'h00000000;
                        insMem[26]= 32'h00000000;
                        insMem[27]= 32'h00000000;
                        insMem[28]= 32'h00000000;
                        insMem[29]= 32'h00000000;
                        insMem[30]= 32'h00000000;
                        insMem[31]= 32'h00000000;
	    end

	assign instruction= ( address< 32) ? insMem[address]: 32'd0;

endmodule
