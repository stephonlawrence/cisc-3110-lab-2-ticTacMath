/*
    Author: Stephon Lawrence
    Name: main.cpp
    Description: Creates a tic tac math game where 2 players,
    can play to win by using the number 1-9 to create a row, column
    or diagonal that adds up to 15. The project details are posted here:
    https://bc-cisc3110-f16.github.io/Project1.pdf
*/
#include <iostream>
#include "playerio.h"
#include "gameboard.h"

using namespace std;

int main() {
    const int ROWSIZE = 3;
    const int BOARDSIZE = ROWSIZE*ROWSIZE;
    const int MINVALUE = 1;
    const int MAXVALUE = 9;
    const int GOALVALUE = 15;
    int move[3]; // x, y, value
    int board[BOARDSIZE];
    int player = 1;
    // start array elements off with an invalid number
    for (int i = 0; i < BOARDSIZE; i ++)
        board[i] = MINVALUE - 1;
    
    do {
        cout << "player" << player << ":" << endl;
        getAMove(move, ROWSIZE, MINVALUE, MAXVALUE);
        if(validate(board, move, ROWSIZE, MINVALUE, MAXVALUE)) {
            playAMove(board, move, ROWSIZE);
            if(player == 1) player = 2;
            else player = 1;
        } else {
            cout << "That was not a valid move!" << endl;
        }
        display(board, ROWSIZE, MINVALUE, MAXVALUE);
    } while(!checkForWin(board, ROWSIZE, GOALVALUE, MINVALUE, MAXVALUE));
    cout << "You won!" << endl;
    return 0;
}
