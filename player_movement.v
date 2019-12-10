module player_movement(clk, rst, up, down, left, right, update, xCount, yCount, player);
input clk, rst, up, down, left, right, update;
input [9:0]xCount;
input [9:0]yCount;
output player;

reg player;
wire rst;
	
reg [9:0] playerX[0:31];
reg [8:0] playerY[0:31];

wire [9:0] xCount;
wire [9:0] yCount;


//player size
always@(posedge clk) 
	begin	
		player = (xCount > playerX[0] && xCount < (playerX[0] + 10'd20)) && (yCount > playerY[0] && yCount < (playerY[0] + 10'd20));
	end
	
//determines the direction of the player based on input
//diagonal movement can be added with more states

reg [2:0]S; 
reg [2:0]NS;

localparam UP = 3'd0, 
	DOWN = 3'd1,
	LEFT = 3'd2, 
	RIGHT = 3'd3, 
	STAY = 3'd4;

always @(posedge update) 
	begin
		if (rst == 1'b1)
			S <= STAY;
		else
			S <= NS;
	end

always @(*) 
	case (S)
		UP:
			begin
				if(up == 1'b0)
					NS = UP;
				else
					NS = STAY;
			end
			
		DOWN:
			begin
				if(down == 1'b0)
					NS = DOWN;
				else
					NS = STAY;
			end
		LEFT:
			begin
				if(left == 1'b0)
					NS = LEFT;
				else
					NS = STAY;
			end
		RIGHT:
			begin
				if(right == 1'b0)
					NS = RIGHT;
				else
					NS = STAY;
			end
		STAY: 
			begin
				if(up == 1'b0)
					NS = UP;
				else if (down == 1'b0)
					NS = DOWN;
				else if (left == 1'b0)
					NS = LEFT;
				else if (right == 1'b0)
					NS = RIGHT;
				else
					NS = STAY;
			end
	endcase

always @(posedge update) 
	begin
	if (rst == 1'b1)
		begin //starting position
			playerX[0] <= 10'd75;
			playerY[0] <= 9'd385;
		end
	else
		case(S)
			UP:
				playerY[0] <= (playerY[0] - 9'd4);
			DOWN:
				playerY[0] <= (playerY[0] + 9'd4);
			LEFT:
				playerX[0] <= (playerX[0] - 10'd4);
			RIGHT:
				playerX[0] <= (playerX[0] + 10'd4);
			STAY:
				begin
					playerX[0] <= playerX[0];
					playerY[0] <= playerY[0];
				end
		endcase
	end

endmodule 