module DATASELECTOR(
		input CLK,
		input [3:0] C0,
		input [3:0] C1,
		input [3:0] C2,
		output reg [3:0] OUT,
		input SELA,
		input SELB
);

wire [1:0] select;
assign select = {SELA,SELB};


always @( posedge CLK ) begin
		case ( select )
			2'h0:		OUT <= C0;
			2'h1:		OUT <= C1;
			2'h2:		OUT <= C2;
			2'h3:		OUT <= 4'h0;
		endcase
end

endmodule
	


		