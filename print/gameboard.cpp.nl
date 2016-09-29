     1	/*
     2	    Author: Stephon Lawrence
     3	    Name: gameboard.cpp
     4	*/
     5	#include <iostream>
     6	#include "gameboard.h"
       
     7	using namespace std;
       
     8	// helper for converting from a 2d position to a 1d array
     9	int getPosition(int x, int y, int rowsize) {
    10	    return x * rowsize + y;
    11	}
       
    12	// helper for telling whether a move on the board was already made
    13	bool isSet(int *board, int x, int y, int minv, int maxv, int rowsize) {
    14	    // check if value is already set to a valid value
    15	    if(board[getPosition(x, y, rowsize)] >= minv &&
    16	        board[getPosition(x, y, rowsize)] <= maxv)
    17	        return true;
    18	    return false;
    19	}
       
    20	void playAMove(int *board, int *move, int rowsize) {
    21	    int position = getPosition(move[0], move[1], rowsize);
    22	    board[position] = move[2];
    23	}
       
    24	bool validate(int *board, int *move, int rowsize, int minv, int maxv) {
    25	    // check if coordinates are valid
    26	    if(move[0] < 0 || move[0] >= rowsize ||
    27	        move[1] < 0 || move[1] >= rowsize)
    28	        return false;
    29	    // check if value is valid
    30	    if(move[2] < minv || move[2] > maxv)
    31	        return false;
    32	    //check if position was already set to a value
    33	    if(isSet(board, move[0], move[1], minv, maxv, rowsize))
    34	        return false;
    35	    // check if value was used already
    36	    for(int x = 0; x < rowsize; x++) {
    37	        for(int y = 0; y < rowsize; y++){
    38	            if(board[getPosition(x, y, rowsize)] == move[2])
    39	                return false;
    40	        }
    41	    }
    42	    return true;
    43	}
       
    44	bool checkForWin(int *board, int rowsize, int sumgoal, int minv, int maxv) {
    45	    // check rows
    46	    int x = 0, y = 0, sum = 0;
    47	    bool valid = false;
    48	    for(x = 0; x < rowsize; x++) {
    49	        sum = 0;
    50	        for(y = 0; y < rowsize; y++) {
    51	            valid = isSet(board, x, y, minv, maxv, rowsize);
    52	            if(!valid) break;
    53	            sum += board[getPosition(x, y, rowsize)];
    54	        }
    55	        if(valid && sum == sumgoal)
    56	            return true;
    57	    }
    58	    // check columns
    59	    valid = false;
    60	    for(y = 0; y < rowsize; y++) {
    61	        sum = 0;
    62	        for(x = 0; x < rowsize; x++) {
    63	            valid = isSet(board, x, y, minv, maxv, rowsize);
    64	            if(!valid) break;
    65	            sum += board[getPosition(x, y, rowsize)];
    66	        }
    67	        if(valid && sum == sumgoal)
    68	            return true;
    69	    }
    70	    // check diagonals left to right
    71	    valid = false;
    72	    sum = 0;
    73	    for(x = 0, y = 0; x < rowsize && y < rowsize; x++, y++) {
    74	        valid = isSet(board, x, y, minv, maxv, rowsize);
    75	        if(!valid) break;
    76	        sum += board[getPosition(x, y, rowsize)];
    77	    }
    78	    if(valid && sum == sumgoal)
    79	        return true;
    80	    // check diagonals right to left
    81	    valid = false;
    82	    sum = 0;
    83	    for(x = rowsize-1, y = 0; x >= 0 && y < rowsize; x--, y++) {
    84	        valid = isSet(board, x, y, minv, maxv, rowsize);
    85	        if(!valid) break;
    86	        sum += board[getPosition(x, y, rowsize)];
    87	    }
    88	    if(valid && sum == sumgoal)
    89	        return true;
    90	    return false;
    91	}
