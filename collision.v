module collision(clk, rst, player, blocks, border, end_zone, xCount, yCount, win, game_over); 

input clk, rst, player, border, end_zone;
input [15:0]blocks;
input [9:0]xCount;
input [9:0]yCount;
output win, game_over; //either the player wins or is hit by a block
	
wire player;
wire end_zone;
wire border;
wire [15:0]blocks;

wire [9:0] xCount;
wire [9:0] yCount;

reg game_over; 
reg win; 
	
//collision calculator
wire hitbox; //player runs into a block
wire goal; //player reaches end goal

assign goal = player && end_zone;
assign hitbox = (player && border) || (player && (blocks[0] || blocks[1] || blocks[2] || blocks[3] || blocks[4] || blocks[5] || blocks[6] || blocks[7] || blocks[8] || blocks[9] || blocks[10] || blocks [11] || blocks[12] || blocks[13] || blocks[14] || blocks[15]));

localparam RUN = 2'd0, WIN = 2'd1, LOSE = 2'd2;
reg [1:0]S;
reg [1:0]NS;

always @(posedge clk)
	begin
		if (rst == 1'b1)
			S <= RUN;
		else
			S <= NS;
	end

always @(*) 
	case (S)
		RUN: 
			begin
				if (goal == 1'b1)
					NS = WIN;
				else if (hitbox == 1'b1)
					NS = LOSE;
				else
					NS = RUN;
			end
		WIN:	//WIN and LOSE loop until reset
			NS = WIN;
		LOSE:
			NS = LOSE;
	endcase

always @(posedge clk) 
	begin
		if (rst == 1'b1)
			begin
				win <= 1'b0;
				game_over <= 1'b0;
			end
		else
			begin
				case (S)
					RUN:
						begin
							win <= 1'b0;
							game_over <= 1'b0;
						end
					WIN:
						win <= 1'b1;
					LOSE:
						game_over <= 1'b1;
				endcase
			end
		
	end
		
endmodule 