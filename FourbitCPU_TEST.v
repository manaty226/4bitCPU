module FourbitCPU_TEST(
			input  [3:0]  INV,
			output [3:0] OUTV
);

reg CLK, RST;
reg [7:0] order;
wire [3:0] OUT;
wire [3:0] CNT;

parameter STEP=100;

always begin
	CLK = ~CLK; #STEP;
end



FourBitCPU cpu(.CLK(CLK), .RST(RST), .order(order), .OUT(OUT), .CNT(CNT));



initial begin
	RST = 0; CLK=0; 
	
	#STEP order=8'b10110001;
	#STEP order=8'b10110001;
	#STEP order=8'b10110001;
end


endmodule

	