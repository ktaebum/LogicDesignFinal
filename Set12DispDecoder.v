`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:50 12/15/2018 
// Design Name: 
// Module Name:    Set12DispDecoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Set12DispDecoder(
   input isPM,
	input [3:0] hours,
	input [5:0] minutes,
	
	output [6:0] disp0,
	output [6:0] disp1,
	output [6:0] disp2,
	output [6:0] disp3,
	output [6:0] disp4,
	output [6:0] disp5
    );
	 
	reg [3:0] isPM2BCD;
	reg [3:0] h10;
	reg [3:0] h1;
	reg [3:0] m10;
	reg [3:0] m1;
	
	initial begin
		isPM2BCD = 0;
		
		h10 = 0;
		h1 = 0;
		
		m10 = 0;
		m1 = 0;
	end
	
	Displayer displayer0 (isPM2BCD, disp0);
	Displayer displayer1 (10, disp1);
	Displayer displayer2 (h10, disp2);
	Displayer displayer3 (h1, disp3);
	Displayer displayer4 (m10, disp4);
	Displayer displayer5 (m1, disp5);
	 
	
	always @ (*) begin
		if (isPM) begin
			isPM2BCD = 13;
		end
		else begin
			isPM2BCD = 12;
		end
	
		if (hours >= 0 && hours < 10) begin
			h10 = 0;
			h1 = hours;
		end
		else begin
			// max 12
			h10 = 1;
			h1 = hours - 10;
		end
		
		if (minutes >= 0 && minutes < 10) begin
			m10 = 0;
			m1 = minutes;
		end
		else if (minutes >= 10 && minutes < 20) begin
			m10 = 1;
			m1 = minutes - 10;
		end
		else if (minutes >= 20 && minutes < 30) begin
			m10 = 2;
			m1 = minutes - 20;
		end
		else if (minutes >= 30 && minutes < 40) begin
			m10 = 3;
			m1 = minutes - 30;
		end
		else if (minutes >= 40 && minutes < 50) begin
			m10 = 4;
			m1 = minutes - 40;
		end
		else begin
			m10 = 5;
			m1 = minutes - 50;
		end
	end
endmodule
