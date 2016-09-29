     1	/*
     2	    Author: Stephon Lawrence
     3	    Name: playerio.h
     4	*/
     5	#ifndef PLAYERIO
     6	#define PLAYERIO
       
     7	/// This function will ask the user to make a move on the board
     8	/// by typing the x coordinate then the y then a number from 1-9
     9	/// for example: "1 1 5".
    10	// move[3] = {x coordinate, y coordinate, value}
    11	// minv is the min int for a value
    12	// maxv is the max int for a value
    13	void getAMove(int *move, int rowsize, int minv, int maxv);
       
    14	/// This will print the board onto the screen
    15	// moves[9] = {value};
    16	void display(int *board, int rowsize, int minv, int maxv);
       
    17	#endif
