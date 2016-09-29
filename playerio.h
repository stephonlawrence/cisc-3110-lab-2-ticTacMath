/*
    Author: Stephon Lawrence
    Name: playerio.h
*/
#ifndef PLAYERIO
#define PLAYERIO

/// This function will ask the user to make a move on the board
/// by typing the x coordinate then the y then a number from 1-9
/// for example: "1 1 5".
// move[3] = {x coordinate, y coordinate, value}
// minv is the min int for a value
// maxv is the max int for a value
void getAMove(int *move, int rowsize, int minv, int maxv);

/// This will print the board onto the screen
// moves[9] = {value};
void display(int *board, int rowsize, int minv, int maxv);

#endif