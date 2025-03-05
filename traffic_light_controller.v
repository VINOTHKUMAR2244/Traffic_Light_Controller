module traffic_light_controller (
input clk,
input rst,
output reg [2:0] light );
parameter RED = 3&#39;b100;
parameter YELLOW = 3&#39;b010;
parameter GREEN = 3&#39;b001
reg [2:0] current_light;
reg [3:0] counter;
always @(posedge clk or posedge rst) begin
if (rst) begin
current_light &lt;= RED;
counter &lt;= 4&#39;d5;
end else begin
if (counter &gt; 0) begin
counter &lt;= counter - 1;
end else begin
case (current_light)
RED: begin
current_light &lt;= YELLOW;
counter &lt;= 4&#39;d2;
end
50
YELLOW: begin
current_light &lt;= GREEN;
counter &lt;= 4&#39;d4;
end
GREEN: begin
current_light &lt;= RED;
counter &lt;= 4&#39;d5;
end
endcase
end
end
end
always @(*) begin
light = current_light;
end
endmodule