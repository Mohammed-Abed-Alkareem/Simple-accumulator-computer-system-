module RAM (
  input [6:0] address,
  input rd,
  input wr,
  input signed [15:0] data_in,
  input clk,
  output reg signed [15:0] data_out
);

reg [15:0] Memory [0:127];



initial begin 
/*
	// FIRST SIMULATION VALUES
	// Instructions
	Memory[0]= 16'h180A;
	Memory[1]= 16'h580B;
	Memory[2]= 16'h3005;
	Memory[3]= 16'h280C;
	
	// Data
	Memory[10]= 16'h0009;
	Memory[11]= 16'hFFFC;
	Memory[12]= 16'h0000;
	end
*/
 // SECOND SIMULATION 
	//Memory[0]= 16'h700A; //BRANCH 10
	
	Memory[0]= 16'h1817; // Load D
	Memory[1]= 16'h3818; // Add E
	Memory[2]= 16'h3001; // Add 1
	Memory[3]= 16'h2819; // Store Div
	Memory[4]= 16'h1816; // Load B
	Memory[5]= 16'h5815; // Mul C 
	Memory[6]= 16'h3814; // Add A
	Memory[7]= 16'h4005; // Sub 5
	Memory[8]= 16'h6819; // Div 
	Memory[9]= 16'h2819; // Store y

// The assumed values for the variables
	//A:
	Memory[20]= 16'h0002 ;
	//B:
	Memory[21]= 16'h0003 ;
	//c:
	Memory[22]= 16'h0005 ;
	//D:
	Memory[23]= 16'h0008 ;
	//E:
	Memory[24]= 16'hFFFB ; //-5

	// Memory to store Y
	Memory[25] = 16'h0000;
end

always@(posedge clk) 
	begin
	
		if(wr)
			Memory[address] <= data_in;

		else if (rd)
			data_out <= Memory[address];

	end
endmodule
