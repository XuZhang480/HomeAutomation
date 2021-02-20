`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/07 18:24:07
// Design Name: 
// Module Name: alert
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


module alert(
input clk,
input [3:0]d1,
input [3:0]d2,
input [3:0]d3,
input [3:0]d4,
output out,
output [3:0]led
    );
    wire c1;
    reg c2;
    always @(d1 or d2 or d3 or d4)
    begin
    if(d3 > d1)
    c2  = 1'b1;
    else if((d4 >= d2)&&(d1 == d3))
    c2 = 1'b1;
    else
    c2 = 1'b0;
    end
    assign c1 = c2;
music(clk,c1,out,led);    
    
endmodule
