`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:26:35 12/04/2018 
// Design Name: 
// Module Name:    StopWatch 
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
module StopWatch(
	input [1:0] currentMode,
	input m_clk,
	input set,
	input clear,
	input lap_save,
	input reset, 
	output reg [5:0] minutes,
	output reg [5:0] seconds,
	output reg [6:0] m_seconds,
	output reg [1:0] showMode
    );
	reg [5:0] normal_minutes;
	reg [5:0] normal_seconds;
	reg [6:0] normal_m_seconds;
	
	reg [5:0] lap1_minutes;
	reg [5:0] lap1_seconds;
	reg [6:0] lap1_m_seconds;
	
	reg [5:0] lap2_minutes;
	reg [5:0] lap2_seconds;
	reg [6:0] lap2_m_seconds;
	
	
	// 0 for no lap
	// 1 for single lap
	// 2 for double lap
	reg [1:0] lap; 
	
	reg isStop;
	// reg [1:0] showMode;
	
	initial begin
		isStop <= 1;
		minutes <= 0;
		seconds <= 0;
		m_seconds <= 0;
		
		normal_minutes <= 0;
		normal_seconds <= 0;
		normal_m_seconds <= 0;
		
		lap1_minutes <= 0;
		lap1_seconds <= 0;
		lap1_m_seconds <= 0;
		
		lap2_minutes <= 0;
		lap2_seconds <= 0;
		lap2_m_seconds <= 0;
		
		lap <= 0;
		showMode <= 0;
	end
	
	always @ (*) begin
		case (showMode)
			0: begin
				minutes <= normal_minutes;
				seconds <= normal_seconds;
				m_seconds <= normal_m_seconds;
			end
			1: begin
				minutes <= lap1_minutes;
				seconds <= lap1_seconds;
				m_seconds <= lap1_m_seconds;
			end
			2: begin
				minutes <= lap2_minutes;
				seconds <= lap2_seconds;
				m_seconds <= lap2_m_seconds;
			end
		endcase
	end
	
	always @ (posedge m_clk or posedge reset) begin
		if (reset) begin
			isStop <= 1;
			normal_minutes <= 0;
			normal_seconds <= 0;
			normal_m_seconds <= 0;
			lap1_minutes <= 0;
			lap1_seconds <= 0;
			lap1_m_seconds <= 0;
			lap2_minutes <= 0;
			lap2_seconds <= 0;
			lap2_m_seconds <= 0;
			lap <= 0;
		end
		else begin
			if (currentMode == 2) begin
			if (set) begin
				if (showMode == 0) begin
					isStop <= isStop + 1;
				end
			end
			else if (isStop) begin
				if (clear) begin
					showMode <= 0;
					if (lap > 0) begin
						// just clear lap
						lap1_minutes <= 0;
						lap1_seconds <= 0;
						lap1_m_seconds <= 0;
						lap2_minutes <= 0;
						lap2_seconds <= 0;
						lap2_m_seconds <= 0;
						lap <= 0;
					end
					else begin
						normal_minutes <= 0;
						normal_seconds <= 0;
						normal_m_seconds <= 0;
						isStop <= 1;
					end
				end
				else begin
					if (lap_save) begin
						case (showMode)
							0: begin
								if (lap >= 1) begin
									showMode <= 1;
								end
							end
							1: begin
								if (lap == 2) begin
									showMode <= 2;
								end
								else begin
									showMode <= 0;
								end
							end
							2: begin
								showMode <= 0;
							end
						endcase
					end
				end
			end
			else begin
				if (lap_save) begin
					if (lap == 0) begin
						lap1_minutes <= normal_minutes;
						lap1_seconds <= normal_seconds;
						lap1_m_seconds <= normal_m_seconds;
						lap <= lap + 1;
					end
					else if (lap == 1) begin
						lap2_minutes <= normal_minutes;
						lap2_seconds <= normal_seconds;
						lap2_m_seconds <= normal_m_seconds;
						lap <= lap + 1;
					end
				end
				
				if (normal_m_seconds < 99) begin
					normal_m_seconds <= normal_m_seconds + 1;
				end
				else begin
					if ((normal_minutes != 59) || (normal_seconds != 59)) begin
						normal_m_seconds <= 0;
						if (normal_seconds < 59) begin
							normal_seconds <= normal_seconds + 1;
						end
						else begin
							if (normal_minutes != 59) begin
								normal_seconds <= 0;
								normal_minutes <= normal_minutes + 1;
							end
						end
					end
					else begin
						// if minutes == 59 && seconds == 59 && m_seconds == 99, stop
						isStop <= isStop + 1;
					end
				end
			end
			end
		end
	end

endmodule
