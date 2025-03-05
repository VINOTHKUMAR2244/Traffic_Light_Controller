module traffic_light_controller_tb;
reg clk;
reg rst;
wire [2:0] light;
traffic_light_controller uut (.clk(clk),.rst(rst),.light(light) );
initial begin
clk = 0;
51
forever #1 clk = ~clk;
end
initial begin
rst = 1;
#5 rst = 0;
#20;
$finish;
end
initial begin
$monitor(&quot;Time: %0d, Light: %b&quot;, $time, light);
end
endmodule