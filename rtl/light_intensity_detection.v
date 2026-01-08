`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2024 22:51:55
// Design Name: 
// Module Name: light_intensity_detection
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


module light_intensity_detection(output [2:0]I,input [1:0]Is,input clk,rst);
wire [1:0]Ia;
Is_to_Ia X1(Ia,Is,clk,rst);
fsm F1(I,Ia,Is,clk,rst);
endmodule


module Is_to_Ia(output reg [1:0]Ia,input [1:0]Is,input clk,rst);
always@(posedge clk)
if(rst)
Ia<=0;
else begin
case(Is)
2'b00:Ia <= 2'b11;
2'b01:Ia <= 2'b10;
2'b10:Ia <= 2'b01;
2'b11:Ia <= 2'b00;
default:Ia <= 2'b00;
endcase
end
endmodule


module fsm(output [2:0]I,input [1:0]Ia,Is,input clk,rst);

parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
reg [1:0]ps,ns;

always@(posedge clk)
begin
if(rst)
ps<=s0;
else
ps<=ns;
end

always@(ps)
begin
case(ps)
s0:ns <= (Ia==2'b00)?s0:s1;
s1:ns <= (Ia==2'b01)?s1:s2;
s2:ns <= (Ia==2'b10)?s2:s3;
s3:ns <= (Ia==2'b11)?s3:s0;
default:ns<=s0;
endcase
end

assign I = Ia + Is;
endmodule


