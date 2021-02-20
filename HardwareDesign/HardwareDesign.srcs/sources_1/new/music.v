`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/31 17:29:02
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module music(input clk,
input rst,
output out,
output [3:0]led
);

reg [4:0]temp;
reg [3:0]ledtemp = 4'b0000;
wire [119:0]music;
reg [9:0]count = 10'd0;
wire clk_play;
Divider #(50_000_000) s0(.I_CLK(clk),.Rst(rst),.O_CLK(clk_play));//Ò»Ãë2¸öÒô·û

assign music[4:0] = 5'b01100;
assign music[9:5] = 5'b01010;
assign music[14:10] = 5'b01100;
assign music[19:15] = 5'b01010;
assign music[24:20] = 5'b01100;
assign music[29:25] = 5'b01010;
assign music[34:30] = 5'b01000;
assign music[39:35] = 5'b01000;
assign music[44:40] = 5'b01001;
assign music[49:45] = 5'b01011;
assign music[54:50] = 5'b01010;
assign music[59:55] = 5'b01001;
assign music[64:60] = 5'b01100;
assign music[69:65] = 5'b01100;
assign music[74:70] = 5'b01100;
assign music[79:75] = 5'b01100;
assign music[84:80] = 5'b01100;
assign music[89:85] = 5'b01010;
assign music[94:90] = 5'b01100;
assign music[99:95] = 5'b01010;
assign music[104:100] = 5'b01100;
assign music[109:105] = 5'b01010;
assign music[114:110] = 5'b01000;
assign music[119:115] = 5'b01000;

always @(posedge clk_play)
begin
    temp[4:0] <= music[count +4 -:5];
 end
 
always @(posedge clk_play)
begin
    count <= count + 5;
    if(count == 120)
        count <= 0;
 end

Play(.clk(clk),.rst(rst),.out(out),.sw(temp));

assign led[0] = rst;
assign led[3] = rst;
assign led[2] = rst;
assign led[1] = rst;

endmodule 
