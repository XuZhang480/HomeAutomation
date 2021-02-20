`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/07 16:11:00
// Design Name: 
// Module Name: Wchange
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


module Wchange2(
input [3:0] d1,
input [3:0] d2,
input con,
input dbutton,
output [3:0]d3,
output [3:0]d4
    );
reg [3:0] t1 = 4'b0000;
reg [3:0] t2 = 4'b0000;    

always @(negedge dbutton)   
begin
if(con == 1'b1)
t2 <= t2 - 4'b0001;
else
t1 <= t1 - 4'b0001;
end

assign d3 = d1 + t1;
assign d4 = d2 + t2;
    
endmodule
