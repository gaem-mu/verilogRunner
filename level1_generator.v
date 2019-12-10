module level1_generator(clk, update, rst, xCount, yCount, blocks);	// this module generates the first level's blocks
input clk, rst, update;

input [9:0]xCount;
input [9:0]yCount;
wire [9:0] xCount;
wire [9:0] yCount;


output [15:0]blocks; 
//stationary
assign blocks[0] = blockS1;
assign blocks[1] = blockS2;
assign blocks[2] = blockS3;
assign blocks[3] = blockS4;
assign blocks[4] = blockS5;
//horizontal
assign blocks[5] = blockH1;
assign blocks[6] = blockH2;
assign blocks[7] = blockH3;
assign blocks[8] = blockH4;
assign blocks[9] = blockH5;
//vertical
assign blocks[10] = blockV1;
assign blocks[11] = blockV2;
assign blocks[12] = blockV3;
assign blocks[13] = blockV4;
assign blocks[14] = blockV5;
assign blocks[15] = blockV6;

//stationary 
reg blockS1;
reg blockS2;
reg blockS3;
reg blockS4;
reg blockS5;
//horizontal
reg blockH1;
reg blockH2;
reg blockH3;
reg blockH4;
reg blockH5;
//vertical
reg blockV1;
reg blockV2;
reg blockV3;
reg blockV4;
reg blockV5;
reg blockV6;


//stationary 
reg [9:0] blockS1X [0:31];
reg [8:0] blockS1Y [0:31];
reg [9:0] blockS2X [0:31];
reg [8:0] blockS2Y [0:31];
reg [9:0] blockS3X [0:31];
reg [8:0] blockS3Y [0:31];
reg [9:0] blockS4X [0:31];
reg [8:0] blockS4Y [0:31];
reg [9:0] blockS5X [0:31];
reg [8:0] blockS5Y [0:31];
//horizontal
reg [9:0] blockH1X [0:31];
reg [8:0] blockH1Y [0:31];
reg [9:0] blockH2X [0:31];
reg [8:0] blockH2Y [0:31];
reg [9:0] blockH3X [0:31];
reg [8:0] blockH3Y [0:31];
reg [9:0] blockH4X [0:31];
reg [8:0] blockH4Y [0:31];
reg [9:0] blockH5X [0:31];
reg [8:0] blockH5Y [0:31];
//vertical
reg [9:0] blockV1X [0:31];
reg [8:0] blockV1Y [0:31];
reg [9:0] blockV2X [0:31];
reg [8:0] blockV2Y [0:31];
reg [9:0] blockV3X [0:31];
reg [8:0] blockV3Y [0:31];
reg [9:0] blockV4X [0:31];
reg [8:0] blockV4Y [0:31];
reg [9:0] blockV5X [0:31];
reg [8:0] blockV5Y [0:31];
reg [9:0] blockV6X [0:31];
reg [8:0] blockV6Y [0:31];

//controls block sizes
always@(posedge clk) 
	begin	
		//stationary
		blockS1 <= (xCount > blockS1X[0] && xCount < (blockS1X[0] + 10'd75)) && (yCount > blockS1Y[0] && yCount < (blockS1Y[0] + 10'd75));
		blockS2 <= (xCount > blockS2X[0] && xCount < (blockS2X[0] + 10'd75)) && (yCount > blockS2Y[0] && yCount < (blockS2Y[0] + 10'd75));
		blockS3 <= (xCount > blockS3X[0] && xCount < (blockS3X[0] + 10'd75)) && (yCount > blockS3Y[0] && yCount < (blockS3Y[0] + 10'd75));
		blockS4 <= (xCount > blockS4X[0] && xCount < (blockS4X[0] + 10'd75)) && (yCount > blockS4Y[0] && yCount < (blockS4Y[0] + 10'd75));
		blockS5 <= (xCount > blockS5X[0] && xCount < (blockS5X[0] + 10'd75)) && (yCount > blockS5Y[0] && yCount < (blockS5Y[0] + 10'd75));
		//horizontal
		blockH1 <= (xCount > blockH1X[0] && xCount < (blockH1X[0] + 10'd20)) && (yCount > blockH1Y[0] && yCount < (blockH1Y[0] + 10'd20));
		blockH2 <= (xCount > blockH2X[0] && xCount < (blockH2X[0] + 10'd20)) && (yCount > blockH2Y[0] && yCount < (blockH2Y[0] + 10'd20));
		blockH3 <= (xCount > blockH3X[0] && xCount < (blockH3X[0] + 10'd20)) && (yCount > blockH3Y[0] && yCount < (blockH3Y[0] + 10'd20));
		blockH4 <= (xCount > blockH4X[0] && xCount < (blockH4X[0] + 10'd20)) && (yCount > blockH4Y[0] && yCount < (blockH4Y[0] + 10'd20));
		blockH5 <= (xCount > blockH5X[0] && xCount < (blockH5X[0] + 10'd20)) && (yCount > blockH5Y[0] && yCount < (blockH5Y[0] + 10'd20)); 
		//vertical
		blockV1 <= (xCount > blockV1X[0] && xCount < (blockV1X[0] + 10'd20)) && (yCount > blockV1Y[0] && yCount < (blockV1Y[0] + 10'd20));
		blockV2 <= (xCount > blockV2X[0] && xCount < (blockV2X[0] + 10'd20)) && (yCount > blockV2Y[0] && yCount < (blockV2Y[0] + 10'd20));
		blockV3 <= (xCount > blockV3X[0] && xCount < (blockV3X[0] + 10'd20)) && (yCount > blockV3Y[0] && yCount < (blockV3Y[0] + 10'd20));
		blockV4 <= (xCount > blockV4X[0] && xCount < (blockV4X[0] + 10'd20)) && (yCount > blockV4Y[0] && yCount < (blockV4Y[0] + 10'd20));
		blockV5 <= (xCount > blockV5X[0] && xCount < (blockV5X[0] + 10'd20)) && (yCount > blockV5Y[0] && yCount < (blockV5Y[0] + 10'd20));
		blockV6 <= (xCount > blockV6X[0] && xCount < (blockV6X[0] + 10'd20)) && (yCount > blockV6Y[0] && yCount < (blockV6Y[0] + 10'd20));
				
	end

// Stationary block controller
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //positions				
				blockS1X[0] <= 10'd70;
				blockS1Y[0] <= 9'd70;
				blockS2X[0] <= 10'd200;
				blockS2Y[0] <= 9'd155;
				blockS3X[0] <= 10'd200;
				blockS3Y[0] <= 9'd331;
				blockS4X[0] <= 10'd455;
				blockS4Y[0] <= 9'd290;
				blockS5X[0] <= 10'd455;
				blockS5Y[0] <= 9'd70;
			end
	end
	
// Horizontal block controller
always @ (posedge update)
	begin
		if (rst == 1'b1) //starting positions
			begin
				blockH1X[0] <= 10'd215;
				blockH1Y[0] <= 9'd165;
				blockH2X[0] <= 10'd215;
				blockH2Y[0] <= 9'd210;
				blockH3X[0] <= 10'd510;
				blockH3Y[0] <= 9'd340;
				blockH4X[0] <= 10'd510;
				blockH4Y[0] <= 9'd300;
				blockH5X[0] <= 10'd510;
				blockH5Y[0] <= 9'd120;
			end 
			//respawn blocks
		else if (blockH1X[0] <= 10'd50)
			blockH1X[0] <= 10'd215;
		else if (blockH2X[0] <= 10'd50)
			blockH2X[0] <= 10'd215;
		else if (blockH3X[0] >= 10'd588)
			blockH3X[0] <= 10'd510;
		else if (blockH4X[0] >= 10'd588)
			blockH4X[0] <= 10'd510;
		else if (blockH5X[0] >= 10'd588)
			blockH5X[0] <= 10'd510;
		else //speed and direction
			begin 
				blockH1X[0] <= blockH1X[0] - 10'd3;
				blockH2X[0] <= blockH2X[0] - 10'd3;
				blockH3X[0] <= blockH3X[0] + 10'd3;
				blockH4X[0] <= blockH4X[0] + 10'd3;
				blockH5X[0] <= blockH5X[0] + 10'd3;	
			end
		end
			
// Vertical block controller
always @(posedge update)
	begin
		if (rst == 1'b1) //starting positions
				begin
				blockV1X[0] <= 10'd205;
				blockV1Y[0] <= 9'd336;
				blockV2X[0] <= 10'd250;
				blockV2Y[0] <= 9'd336;
				blockV3X[0] <= 10'd460;
				blockV3Y[0] <= 9'd336;
				blockV4X[0] <= 10'd505;
				blockV4Y[0] <= 9'd336;
				blockV5X[0] <= 10'd460;
				blockV5Y[0] <= 9'd300;
				blockV6X[0] <= 10'd505;
				blockV6Y[0] <= 9'd300;
			end
			
		//respawn blocks
		else if (blockV1Y[0] <= 10'd205)
			blockV1Y[0] <= 10'd336;
		else if (blockV2Y[0] <= 10'd205)
			blockV2Y[0] <= 10'd336;
		else if (blockV3Y[0] >= 10'd426)
			blockV3Y[0] <= 10'd336;
		else if (blockV4Y[0] >= 10'd426)
			blockV4Y[0] <= 10'd336;
		else if (blockV5Y[0] <= 10'd125)
			blockV5Y[0] <= 10'd300;
		else if (blockV6Y[0] <= 10'd125)
			blockV6Y[0] <= 10'd300;
			
		else //speed and direction
			begin
				blockV1Y[0] <= blockV1Y[0] - 10'd3;
				blockV2Y[0] <= blockV2Y[0] - 10'd3;
				blockV3Y[0] <= blockV3Y[0] + 10'd3;
				blockV4Y[0] <= blockV4Y[0] + 10'd3;
				blockV5Y[0] <= blockV5Y[0] - 10'd3;
				blockV6Y[0] <= blockV6Y[0] - 10'd3;
			end
		end

endmodule 