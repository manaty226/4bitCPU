module ALU(
		input CLK,
		input [3:0]	REGDATA,
		input [3:0] IMMDATA,
		output reg [3:0] OUT
);

always @( posedge CLK ) begin
		OUT <= REGDATA + IMMDATA;
end

endmodule

