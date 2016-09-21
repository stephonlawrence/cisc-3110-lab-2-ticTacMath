#ifndef GAMEBOARD
#define GAMEBOARD

int getPosition(int x, int y, int rowsize);
void playAMove(int *board, int *move, int rowsize);
bool validate(int *board, int *move, int rowsize, int minv, int maxv);
bool checkForWin(int *board, int rowsize, int sumGoal, int minv, int maxv);
bool isSet(int *board, int x, int y, int minv, int maxv, int rowsize);
void display(int *board, int rowsize, int minv, int maxv);

#endif