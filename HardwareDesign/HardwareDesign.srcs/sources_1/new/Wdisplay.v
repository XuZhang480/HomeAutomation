`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/07 16:40:29
// Design Name: 
// Module Name: Wdisplay
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


module Wdisplay(
input [3:0]d1,
input [3:0]d2,
input [3:0]d3,
input [3:0]d4,
input con,
output [3:0]d5,
output [3:0]d6
    );
 assign d5 = (con) ? d1:d3;
 assign d6 = (con) ? d2:d4;
endmodule
