module Data_Memory (clk , Address , WriteData, MemRead, MemWrite, ReadData);

input [63:0] Address;
input [63:0] WriteData;
input MemRead;
input MemWrite;
input clk;

output reg [63:0] ReadData;

reg [63:0] datamemory [31:0];

always@(MemRead)
begin
    if(MemRead==1)
	ReadData <= datamemory[Address[4:0]];
end
always@(posedge clk)
begin
    if(MemWrite==1)
	datamemory[Address[4:0]] <= WriteData;
end

endmodule
