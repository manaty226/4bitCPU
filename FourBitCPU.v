module FourBitCPU(
		input		CLK, RST,
		input		[7:0]	order,
		output 	reg [3:0]	OUT,
		output	reg [3:0] CNT
);


wire sela, selb;
wire [3:0] load;
/* Operation code Decoder */
DECODER dec(.CLK(CLK), .ORDER(order[7:4]), .DECODED({sela, selb, load}));

wire [3:0] A;
wire [3:0] B;
wire [3:0] C;
wire [3:0] D;
wire [3:0] Y;
DATASELECTOR dataselector(.CLK(CLK), .C0(A), .C1(B), .C2(C), .OUT(Y), .SELA(sela), .SELB(selb));

wire [3:0] sigma;
wire [3:0] Imm = order[3:0];
ALU alu(.CLK(CLK), .REGDATA(Y), .IMMDATA(Imm), .OUT(sigma));

REGISTER regA(.CLK(CLK), .LD(load[3]), .IN(sigma), .OUT(A)); 
REGISTER regB(.CLK(CLK), .LD(load[2]), .IN(sigma), .OUT(B));
REGISTER regC(.CLK(CLK), .LD(load[1]), .IN(sigma), .OUT(C));
PROGCOUNTER regD(.CLK(CLK), .LD(load[0]), .IN(sigma), .OUT(D));

always @( posedge CLK ) begin
	OUT <= C;
	CNT <= D;
end


endmodule






