     1	/*
     2	    Author: Stephon Lawrence
     3	    Name: main.cpp
     4	    Description: Creates a tic tac math game where 2 players,
     5	    can play to win by using the number 1-9 to create a row, column
     6	    or diagonal that adds up to 15. The project details are posted here:
     7	    https://bc-cisc3110-f16.github.io/Project1.pdf
     8	*/
     9	#include <iostream>
    10	#include "playerio.h"
    11	#include "gameboard.h"
       
    12	using namespace std;
       
    13	int main() {
    14	    const int ROWSIZE = 3;
    15	    const int BOARDSIZE = ROWSIZE*ROWSIZE;
    16	    const int MINVALUE = 1;
    17	    const int MAXVALUE = 9;
    18	    const int GOALVALUE = 15;
    19	    int move[3]; // x, y, value
    20	    int board[BOARDSIZE];
    21	    int player = 1;
    22	    // start array elements off with an invalid number
    23	    for (int i = 0; i < BOARDSIZE; i ++)
    24	        board[i] = MINVALUE - 1;
    25	    
    26	    do {
    27	        cout << "player" << player << ":" << endl;
    28	        getAMove(move, ROWSIZE, MINVALUE, MAXVALUE);
    29	        if(validate(board, move, ROWSIZE, MINVALUE, MAXVALUE)) {
    30	            playAMove(board, move, ROWSIZE);
    31	            if(player == 1) player = 2;
    32	            else player = 1;
    33	        } else {
    34	            cout << "That was not a valid move!" << endl;
    35	        }
    36	        display(board, ROWSIZE, MINVALUE, MAXVALUE);
    37	    } while(!checkForWin(board, ROWSIZE, GOALVALUE, MINVALUE, MAXVALUE));
    38	    cout << "You won!" << endl;
    39	    return 0;
    40	}
