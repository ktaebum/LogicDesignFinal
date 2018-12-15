`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:04:46 12/15/2018 
// Design Name: 
// Module Name:    ClockWrapper 
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
module ClockWrapper(
	input clk,
	input set,
	input up,
	input down,
	input reset,
	
	output reg [6:0] disp0,
	output reg [6:0] disp1,
	output reg [6:0] disp2,
	output reg [6:0] disp3,
	output reg [6:0] disp4,
	output reg [6:0] disp5

    );
	
	wire slow_clk;
	wire real_clk;
	ClockModulator clockmodulator (clk, reset, slow_clk);
	RealClockModulator realclockmodulator (clk, reset, real_clk);
	
	wire debounced_up;
	wire pulsed_up;
	Debouncer debouncer1 (slow_clk, up, debounced_up);
	PulseGenerator pulsegenerator1 (clk, reset, debounced_up, pulsed_up);
	
	wire debounced_set;
	wire pulsed_set;
	Debouncer debouncer2 (slow_clk, set, debounced_set);
	PulseGenerator pulsegenerator2 (clk, reset, debounced_set, pulsed_set);
	
	wire debounced_down;
	wire pulsed_down;
	Debouncer debouncer3 (slow_clk, down, debounced_down);
	PulseGenerator pulsegenerator3 (clk, reset, debounced_down, pulsed_down);
	
	// 0 for 24 system, 1 for 12 system
	reg dispMode;
	
	initial begin
		dispMode <= 0;
	end
	
	wire [6:0] disp12_0;
	wire [6:0] disp12_1;
	wire [6:0] disp12_2;
	wire [6:0] disp12_3;
	wire [6:0] disp12_4;
	wire [6:0] disp12_5;
	wire [1:0] disp12_state;
	wire disp12to24_isPM;
	wire [3:0] disp12to24_hours;
	wire [5:0] disp12to24_minutes;
	wire disp12to24_propagate;
	
	wire [6:0] disp24_0;
	wire [6:0] disp24_1;
	wire [6:0] disp24_2;
	wire [6:0] disp24_3;
	wire [6:0] disp24_4;
	wire [6:0] disp24_5;
	wire [1:0] disp24_state;
	wire [4:0] disp24to12_hours;
	wire [5:0] disp24to12_minutes;
	wire disp24to12_propagate;
	
	
	SimpleClock12 simpleclock12 (dispMode, disp24to12_propagate, disp24to12_hours, disp24to12_minutes,
		clk, real_clk, pulsed_set, reset, pulsed_up, pulsed_down, 
		disp12_0, disp12_1, disp12_2, disp12_3, disp12_4, disp12_5, disp12_state,
		disp12to24_isPM, disp12to24_hours, disp12to24_minutes, disp12to24_propagate);
		
	SimpleClock24 simpleclock24 (!dispMode, disp12to24_propagate, disp12to24_isPM, disp12to24_hours, disp12to24_minutes,
		clk, real_clk, pulsed_set, reset, pulsed_up, pulsed_down, 
		disp24_0, disp24_1, disp24_2, disp24_3, disp24_4, disp24_5, disp24_state,
		disp24to12_hours, disp24to12_minutes, disp24to12_propagate);
	
	reg [4:0] hours12to24;
	reg [5:0] minutes12to24;
	reg isPM24to12;
	reg [3:0] hours24to12;
	reg [5:0] minutes24to12;
	
	initial begin
		hours12to24 <= 0;
		minutes12to24 <= 0;
		isPM24to12 <= 0;
		hours24to12 <= 0;
		minutes24to12 <= 0;
	end
	
	always @ (*) begin
		if (dispMode) begin
			// 12 system
			disp0 <= disp12_0;
			disp1 <= disp12_1;
			disp2 <= disp12_2;
			disp3 <= disp12_3;
			disp4 <= disp12_4;
			disp5 <= disp12_5;
		end
		else begin
			disp0 <= disp24_0;
			disp1 <= disp24_1;
			disp2 <= disp24_2;
			disp3 <= disp24_3;
			disp4 <= disp24_4;
			disp5 <= disp24_5;
		end
		
	end
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			dispMode <= 0;
		end
		else begin
			case (dispMode)
				0: begin
					// 24 system
					if (disp24_state == 0 && pulsed_up) begin
						// can change dispMode
						dispMode <= 1;
					end
				end
				1: begin
					// 12 system
					if (disp12_state == 0 && pulsed_up) begin
						dispMode <= 0;
					end
				end
			endcase
		end
	end
endmodule
