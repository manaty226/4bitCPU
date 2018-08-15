module PROGCOUNTER(
		input CLK,
		input LD,
		input  	  [3:0] IN,
		output reg [3:0] OUT
);

always @( posedge CLK ) begin
		if( LD == 1'b0 )
			OUT <= IN;
		else
			OUT <= OUT + 4'h1;
end

endmodule
