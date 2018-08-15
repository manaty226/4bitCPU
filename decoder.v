module DECODER(
		input CLK,
		input		  [3:0]	ORDER,
		output reg [5:0]	DECODED
);


always @( posedge CLK ) begin
		case ( ORDER )
			4'h0:		DECODED <= 6'b000111;	
			4'h1:		DECODED <= 6'b010111;
			4'h2:		DECODED <= 6'b100111;	
			4'h3:		DECODED <= 6'b110111;	
			4'h4:		DECODED <= 6'b001011;	
			4'h5:		DECODED <= 6'b011011;	
			4'h6:		DECODED <= 6'b101011;	
			4'h7:		DECODED <= 6'b111011;	
			4'h9:		DECODED <= 6'b011101;	
			4'hb:		DECODED <= 6'b111101;	
			4'he:		DECODED <= 6'b111110;	
			4'hf:		DECODED <= 6'b111110;
			default:	DECODED <= 6'b000000;
		endcase
end

endmodule
			