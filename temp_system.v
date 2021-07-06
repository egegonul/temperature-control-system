module temp_system(input clk,inc,dec,output reg [6:0] temp);

reg [1:0] CS,NS;

initial begin
CS=0;
temp=26;
end

always @(posedge clk) begin
	CS<=NS;
	
 case(CS)
 0:
	if (inc&(~dec)) temp<=temp+2;
	else if(temp>27) 
		 if (~inc&dec) temp<=temp-1;
 1: 
	if (inc&~dec) temp<=temp+3;
	else if (~inc&dec) temp<=temp-2;
 2: 
	if (~inc&dec) temp<=temp-3;
	else if(temp<81)
		if (inc&~dec) temp<=temp+5;
		
 endcase
end

	 
always @(*)
	case(CS)
	0: if(temp>39) NS=1;
		else NS=0;
	1: if(temp>54) NS=2;
		else if(temp<35) NS=0;
		else NS=1;
	2: if(temp<47) NS=1;
		else NS=2;
	endcase
	
endmodule

