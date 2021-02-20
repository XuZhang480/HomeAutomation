`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/31 14:22:37
// Design Name: 
// Module Name: Binary_to_Decimal
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


module seg(
	// 变量说明见top模块
    input reset,
    input clock,
    input [3:0] score_a,score_b,score_c,score_d,score_e,score_f,score_g,score_h,
    output reg [7:0] seg,
    output reg [7:0] an

    );
    
    wire [7:0] a_seg,b_seg,c_seg,d_seg,e_seg,f_seg,g_seg,h_seg;
    
    bcdto8segment_dataflow (.x(score_a),.seg(a_seg));
    bcdto8segment_dataflow (.x(score_b),.seg(b_seg));
    bcdto8segment_dataflow (.x(score_c),.seg(c_seg));
    bcdto8segment_dataflow (.x(score_d),.seg(d_seg));
    bcdto8segment_dataflow (.x(score_e),.seg(e_seg));
    bcdto8segment_dataflow (.x(score_f),.seg(f_seg));
    bcdto8segment_dataflow (.x(score_g),.seg(g_seg));
    bcdto8segment_dataflow (.x(score_h),.seg(h_seg));
    
    reg [37:0] count;
    
    initial
    begin
    count<=0;
    end
    
    always @(posedge clock or posedge reset)
    begin
    	if (reset==1)
    	begin
    		an<=8'b00000000;
    		seg<=8'b10000000;
    		count<=0;
    	end
    	else
    	begin
    		// count每数100000切换数码管，相当于每次切换的时间为100k/100M=1/1000s=1ms
			if (count==800000) 
			begin
				an<=8'b01111111;
				seg<=a_seg;
				count<=0;
			end
			else if (count==700000)
			begin
				an<=8'b10111111;
				seg<=b_seg&8'b01111111;//添加小数点
				count<=count+1;
			end
			else if (count==600000)
			begin
				an<=8'b11011111;
				seg<=c_seg;
				count<=count+1;
			end
			else if (count==500000)
			begin
				an<=8'b11101111;
				seg<=d_seg;
				count<=count+1;
			end
			else if (count==400000)
			begin
				an<=8'b11110111;
				seg<=e_seg;
				count<=count+1;
			end
			else if (count==300000)
			begin
				an<=8'b11111011;
				seg<=f_seg&8'b01111111;
				count<=count+1;
			end
			else if (count==200000)
			begin
				an<=8'b11111101;
				seg<=g_seg;
				count<=count+1;
			end
			else if (count==100000)
			begin
				an<=8'b11111110;
				seg<=h_seg;
				count<=count+1;
			end
			else count<=count+1;
		end
    end
endmodule

