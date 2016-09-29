     1	/*
     2	    Author: Stephon Lawrence
     3	    Name: main.cpp
     4	*/
     5	#include <iostream>
     6	#include "playerio.h"
     7	#include "gameboard.h"
       
     8	using namespace std;
       
     9	int main() {
    10	    const int ROWSIZE = 3;
    11	    const int BOARDSIZE = ROWSIZE*ROWSIZE;
    12	    const int MINVALUE = 1;
    13	    const int MAXVALUE = 9;
    14	    const int GOALVALUE = 15;
    15	    int move[3]; // x, y, value
    16	    int board[BOARDSIZE];
    17	    int player = 1;
    18	    // start array elements off with an invalid number
    19	    for (int i = 0; i < BOARDSIZE; i ++)
    20	        board[i] = MINVALUE - 1;
    21	    
    22	    do {
    23	        cout << "player" << player << ":" << endl;
    24	        getAMove(move, ROWSIZE, MINVALUE, MAXVALUE);
    25	        if(validate(board, move, ROWSIZE, MINVALUE, MAXVALUE)) {
    26	            playAMove(board, move, ROWSIZE);
    27	            if(player == 1) player = 2;
    28	            else player = 1;
    29	        } else {
    30	            cout << "That was not a valid move!" << endl;
    31	        }
    32	        display(board, ROWSIZE, MINVALUE, MAXVALUE);
    33	    } while(!checkForWin(board, ROWSIZE, GOALVALUE, MINVALUE, MAXVALUE));
    34	    cout << "You won!" << endl;
    35	    return 0;
    36	}
