`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:31 12/15/2018 
// Design Name: 
// Module Name:    Clock24DispDecoder 
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
module Clock24DispDecoder(
	input [4:0] hours,
	input [5:0] minutes,
	input [5:0] seconds,
	
	output [6:0] disp0,
	output [6:0] disp1,
	output [6:0] disp2,
	output [6:0] disp3,
	output [6:0] disp4,
	output [6:0] disp5
    );
	 
	reg [3:0] h10;
	reg [3:0] h1;
	reg [3:0] m10;
	reg [3:0] m1;
	reg [3:0] s10;
	reg [3:0] s1;

	initial begin
		h10 = 0;
		h1 = 0;
		
		m10 = 0;
		m1 = 0;
		
		s10 = 0;
		s1 = 0;
	end
	
	Displayer displayer0 (h10, disp0);
	Displayer displayer1 (h1, disp1);
	Displayer displayer2 (m10, disp2);
	Displayer displayer3 (m1, disp3);
	Displayer displayer4 (s10, disp4);
	Displayer displayer5 (s1, disp5);
	
	always @ (*) begin
		if (hours >= 0 && hours < 10) begin
			h10 = 0;
			h1 = hours;
		end
		else if (hours >= 10 && hours < 20) begin
			h10 = 1;
			h1 = hours - 10;
		end
		else begin
			h10 = 2;
			h1 = hours - 20;
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
		
		if (seconds >= 0 && seconds < 10) begin
			s10 = 0;
			s1 = seconds;
		end
		else if (seconds >= 10 && seconds < 20) begin
			s10 = 1;
			s1 = seconds - 10;
		end
		else if (seconds >= 20 && seconds < 30) begin
			s10 = 2;
			s1 = seconds - 20;
		end
		else if (seconds >= 30 && seconds < 40) begin
			s10 = 3;
			s1 = seconds - 30;
		end
		else if (seconds >= 40 && seconds < 50) begin
			s10 = 4;
			s1 = seconds - 40;
		end
		else begin
			s10 = 5;
			s1 = seconds - 50;
		end
		
		
	end
endmodule
