/*
    Author: Stephon Lawrence
    Name: gameboard.h
*/
#ifndef GAMEBOARD
#define GAMEBOARD

/// makes a move on the board
void playAMove(int *board, int *move, int rowsize);

/// returns true if the given move is wan't made already or
/// is possible on the board and false if not
bool validate(int *board, int *move, int rowsize, int minv, int maxv);

/// tells whether someone won already or not
bool checkForWin(int *board, int rowsize, int sumGoal, int minv, int maxv);

#endif