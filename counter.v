`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mann Raval
// 
// Create Date: 09.06.2025 16:37:31
// Design Name: Counter
// Module Name: counter
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


module counter
(
input clk, rst,///active high
input ld,
input [3:0] ldvalue,
output [3:0] dout 
);
 
reg [3:0] temp;
 
initial begin
temp = 0;
end
 
//always@(posedge clk) /////////synchronus reset
//or
always@(posedge clk or posedge rst) /////////////asynchronus reset
begin
 if(rst == 1'b1)
   begin
   temp <= 4'b0000;
   end
 else 
     begin
       if(ld == 1'b1)
         temp <= ldvalue;
       else
         temp <= temp + 1;
     end
end
 
assign dout = temp;
 
endmodule
