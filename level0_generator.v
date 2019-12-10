module level0_generator(clk, update, rst, xCount, yCount, blocks);	//this module generates the tester blocks
input clk, rst, update;

input [9:0]xCount;
input [9:0]yCount;
wire [9:0] xCount;
wire [9:0] yCount;


output [15:0]blocks; //there are 3 different blocks, so each need a separate controller
//vertical
assign blocks[0] = blockV;
//horizontal
assign blocks[1] = blockH;
//stationary
assign blocks[2] = blockS;

//vertical
reg blockV;
//horizontal
reg blockH;
//stationary
reg blockS;

//vertical
reg [9:0] blockVX [0:31];
reg [8:0] blockVY [0:31];
//horizontal
reg [9:0] blockHX [0:31];
reg [8:0] blockHY [0:31];
//stationary
reg [9:0] blockSX [0:31];
reg [8:0] blockSY [0:31];

//controls block sizes
always@(posedge clk) 
	begin	
		//vertical block
		blockV <= (xCount > blockVX[0] && xCount < (blockVX[0] + 10'd50)) && (yCount > blockVY[0] && yCount < (blockVY[0] + 10'd50));
		//horizontal block
		blockH <= (xCount > blockHX[0] && xCount < (blockHX[0] + 10'd50)) && (yCount > blockHY[0] && yCount < (blockHY[0] + 10'd50));
		//stationary block
		blockS <= (xCount > blockSX[0] && xCount < (blockSX[0] + 10'd50)) && (yCount > blockSY[0] && yCount < (blockSY[0] + 10'd50));
	end



// Veritcal block control
always @(posedge update)
	begin
		if (rst == 1'b1) // starting position
			begin 
				blockVX[0] <= 10'd300;
				blockVY[0] <= 9'd75;
			end
		else if (blockVY[0] >= 9'd406)
			blockVY[0] <= 9'd25; // respawn the block
		else
			blockVY[0] <= blockVY[0] + 9'd5;
	end
	
// Horizontal block control
always @(posedge update)
	begin
		if (rst == 1'b1) // starting position
			begin
				blockHX[0] = 10'd566;
				blockHY[0] = 9'd249;
			end
		else if (blockHX[0] == 10'd0)
			blockHX[0] <= 10'd616; // respawn block
		else
			blockHX[0] <= blockHX[0] - 10'd7;
	end

// Stationary block control
always @(posedge update)
	begin
		if (rst == 1'b1) // position
			begin 
				blockSX[0] <= 10'd515;
				blockSY[0] <= 9'd100;
			end
	end


endmodule 