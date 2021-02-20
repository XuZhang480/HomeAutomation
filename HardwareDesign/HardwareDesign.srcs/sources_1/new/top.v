`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/28 15:40:11
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


module top(
input clk_100,
input reset,//time_control
input reset_t,//temperature_control
input reset_s,
input con_d,
input con_c,//控制预设温度
input pb,
input db,
inout dht11,
output music,
output [3:0]led,
output [7:0] an, // 数码管使能
output [7:0] seg// 数码管输出
    );
    wire clk_8;
    wire clk_1;
    wire clk_50;
    reg [2:0] count;
    wire [31:0] data;
    wire [3:0] data1,data2,data3,data4,data5,data6,data7,data8,d5,d6,t5,t6;
    wire[3:0] data5_p = 4'b0010;
    wire[3:0] data6_p = 4'b0101;
    
    
    
    clk_wiz_1(.clk_in1(clk_100),.reset(reset),.clk_out1(clk_50));
    
    //time_adv_even(.clk(clk_8),.rst(reset),.clk_out(clk_1));//得到1M时钟
   
    dht11_drive(.sys_clk(clk_50),.rst_n(reset_t),.dht11(dht11),.data_valid(data));
    
    bin_dec(.clk(clk_100),.bin(data[31:24]),.rst_n(reset_t),.one(data2),.ten(data1));//二进制转换为十进制BCD
    bin_dec(.clk(clk_100),.bin(data[15:8]),.rst_n(reset_t),.one(data8),.ten(data7));
    
    Wchange(data5_p,data6_p,con_c,pb,t5,t6);
    Wchange2(t5,t6,con_c,db,d5,d6);
    Wdisplay(d5,d6,data7,data8,con_d,data5,data6);
    
    //Wdisplay(data5_p,data6_p,data7,data8,con_d,data5,data6);
    
    //alert(clk_100,data5_p,data6_p,data7,data8,music,led);
    alert(clk_100,d5,d6,data7,data8,music,led);
    
    seg(.reset(reset_s),.clock(clk_100),.seg(seg),.an(an),.score_a(data1),.score_b(data2),.score_c(data[23:20]),.score_d(data[19:16]),.score_e(data5),.score_f(data6),.score_g(data[7:4]),.score_h(data[3:0]));

    
endmodule
