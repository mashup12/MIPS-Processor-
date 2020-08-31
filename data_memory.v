 module data_memory  
 (  
      input clk,
      input [31:0] address,  
      
      input [31:0] Wdata,  
      input MemWrite,  
      input MemRead,  
    
      output [31:0] Rdata);  


      integer i;  
      reg [31:0] ram [0:31];  
      wire [4:0]data_addr= address[4:0];  
      initial begin  
           for(i=0;i<32;i=i+1)  
                ram[i] <= 32'b00000000000000000000000000000000;  
      end  
      always @(posedge clk) 
           begin  
           if (MemWrite)  
	   begin 
           ram[data_addr] <= Wdata;  
           end 
           end  
      assign Rdata =(MemRead==1'b1) ?ram[data_addr]: 32'd0;   
 endmodule 
