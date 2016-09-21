#include "playerio.h"
#include "gameboard.h"
#include <iostream>

using namespace std;

int main() {
    const int ROWSIZE = 3;
    const int BOARDSIZE = ROWSIZE*ROWSIZE;
    const int MINVALUE = 0;
    const int MAXVALUE = 15;
    const int GOALVALUE = 15;
    int move[3]; // x, y, value
    int board[BOARDSIZE];
    int player = 1;
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