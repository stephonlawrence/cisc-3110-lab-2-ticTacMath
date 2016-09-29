/*
    Author: Stephon Lawrence
    Name: playerio.cpp
*/
#include <iostream>
#include <string>
#include <sstream>
#include <iomanip>
#include "playerio.h"

using namespace std;

void getAMove(int *move, int rowsize, int minv, int maxv) {
	string line;
	cout << "Type a position from 1-" << rowsize << " for x, " <<
	        "followed by a position from 1-" << rowsize << " for y, " <<
	        "followed by an integer from " << minv << "-" << maxv << "." << endl;
	getline(cin, line);
	stringstream s;
	s << line;
	move[0] = -1, move[1] = -1, move[2] = minv - 1;
	s >> move[0] >> move[1] >> move[2];
	cout << line;
	move[0] -= 1, move[1] -= 1;
}

void display(int *board, int rowsize, int minv, int maxv){
    int position = 0;
	const int WSIZE = 2;
    cout << endl;
    for(int x = 0; x < rowsize; x++) {
        cout << "[";
        for(int y = 0; y < rowsize; y++) {
            position = x*rowsize + y;
            if(board[position] >= minv && board[position] <= maxv)
                cout << setw(WSIZE) << board[position];
            else
                cout << setw(WSIZE) << " ";
        }
        cout << "]" << endl;
    }
}
