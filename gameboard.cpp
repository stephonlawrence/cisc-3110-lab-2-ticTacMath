#include <iostream>
#include "gameboard.h"

using namespace std;

int getPosition(int x, int y, int rowsize) {
    return x * rowsize + y;
}

void playAMove(int *board, int *move, int rowsize) {
    int position = getPosition(move[0], move[1], rowsize);
    board[position] = move[2];
}

bool isSet(int *board, int x, int y, int minv, int maxv, int rowsize) {
    // check if value is already set to a valid value
    if(board[getPosition(x, y, rowsize)] >= minv &&
        board[getPosition(x, y, rowsize)] <= maxv)
        return true;
    return false;
}

bool validate(int *board, int *move, int rowsize, int minv, int maxv) {
    // check if coordinates are valid
    if(move[0] < 0 || move[0] >= rowsize ||
        move[1] < 0 || move[1] >= rowsize)
        return false;
    // check if value is valid
    if(move[2] < minv || move[2] > maxv)
        return false;
    //check if position was already set to a value
    if(isSet(board, move[0], move[1], minv, maxv, rowsize))
        return false;
    // check if value was used already
    for(int x = 0; x < rowsize; x++) {
        for(int y = 0; y < rowsize; y++){
            if(board[getPosition(x, y, rowsize)] == move[2])
                return false;
        }
    }
    return true;
}

bool checkForWin(int *board, int rowsize, int sumgoal, int minv, int maxv) {
    // check rows
    int x = 0, y = 0, sum = 0;
    bool valid = false;
    for(x = 0; x < rowsize; x++) {
        sum = 0;
        for(y = 0; y < rowsize; y++) {
            valid = isSet(board, x, y, minv, maxv, rowsize);
            if(!valid) break;
            sum += board[getPosition(x, y, rowsize)];
        }
        if(valid && sum == sumgoal)
            return true;
    }
    // check columns
    valid = false;
    for(y = 0; y < rowsize; y++) {
        sum = 0;
        for(x = 0; x < rowsize; x++) {
            valid = isSet(board, x, y, minv, maxv, rowsize);
            if(!valid) break;
            sum += board[getPosition(x, y, rowsize)];
        }
        if(valid && sum == sumgoal)
            return true;
    }
    // check diagonals left to right
    valid = false;
    sum = 0;
    for(x = 0, y = 0; x < rowsize && y < rowsize; x++, y++) {
        valid = isSet(board, x, y, minv, maxv, rowsize);
        if(!valid) break;
        sum += board[getPosition(x, y, rowsize)];
    }
    if(valid && sum == sumgoal)
        return true;
    // check diagonals right to left
    valid = false;
    sum = 0;
    for(x = rowsize-1, y = 0; x >= 0 && y < rowsize; x--, y++) {
        valid = isSet(board, x, y, minv, maxv, rowsize);
        if(!valid) break;
        sum += board[getPosition(x, y, rowsize)];
    }
    if(valid && sum == sumgoal)
        return true;
    return false;
}

// moves[9] = {value};
// position = row * rowsize + column
void display(int *board, int rowsize, int minv, int maxv){
    int position = 0;
    cout << endl;
    for(int x = 0; x < rowsize; x++) {
        cout << "[";
        for(int y = 0; y < rowsize; y++) {
            position = x*rowsize + y;
            if(isSet(board, x, y, minv, maxv, rowsize))
                cout << board[position];
            else
                cout << "  ";
        }
        cout << "]" << endl;
    }
}