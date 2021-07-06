module temp_system_tb();

reg clk,inc,dec;
wire [6:0] temp;

temp_system dut( clk,inc,dec,temp);

always begin
clk=0; #5; clk=1; #5;
end


initial begin
inc=1; dec=0;
#35;
dec=1; inc=0; 
#15;
inc=1; dec=0;
#90;
inc=0; dec=1;
#45;
inc=1; dec=0;
end 

endmodule