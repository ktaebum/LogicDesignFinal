`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:42 12/16/2018 
// Design Name: 
// Module Name:    AlarmSetter 
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
module AlarmSetter(
	input clk,
	input reset,
	input dispMode,
	input propagate, 

	input alarm12_isPM,
	input [3:0] alarm12_hours,
	input [5:0] alarm12_minutes,
	
	input [4:0] alarm24_hours,
	input [5:0] alarm24_minutes,
	
	output reg [4:0] alarm_hours,
	output reg [5:0] alarm_minutes
    );
	 
	 
	initial begin
		alarm_hours <= 24;
		alarm_minutes <= 0;
	end
	
	
	always @ (posedge clk or posedge reset or posedge propagate) begin
		if (reset) begin
			alarm_hours <= 24;
			alarm_minutes <= 0;
		end
		else begin
			if (propagate) begin
				if (dispMode) begin
					// 12 system
					if (alarm12_hours == 12) begin
						alarm_hours <= alarm12_isPM * 12;
					end
					else begin
						alarm_hours <= alarm12_isPM * 12 + alarm12_hours;
					end
					alarm_minutes <= alarm12_minutes;
				end
				else begin
					// 24 system
					alarm_hours <= alarm24_hours;
					alarm_minutes <= alarm24_minutes;
				end
			end
		end
	end


endmodule
