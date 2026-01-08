`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2024 22:52:30
// Design Name: 
// Module Name: light_intensity_detection_tb
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

module light_intensity_detection_tb();

wire [2:0]I;
reg [1:0]Is;
reg clk,rst;
 
light_intensity_detection dut(I,Is,clk,rst);
initial clk=0;
always clk = #10 ~clk;

initial begin
rst=1;
#30 rst=0;
end

initial begin 
Is=2'b00;
#50 Is=2'b01;
#50 Is=2'b10;
#50 Is=2'b11;
end
endmodule
