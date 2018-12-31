module RegisterBank(A,B,C,Adata,Bdata,Cdata,W,CLK);

input [4:0]A;
input [4:0]B;
input [4:0]C;
input [63:0]Cdata;
input W;
input CLK;

parameter delay = 10;

output  [63:0]Adata;
output  [63:0]Bdata;

reg [63:0] registersTable [31:0];

assign  Adata = registersTable[A];
assign  Bdata = registersTable[B];


always@(posedge CLK)
  begin
  if(W)
    begin
    #delay registersTable[C] = Cdata;
    end
  end

endmodule
