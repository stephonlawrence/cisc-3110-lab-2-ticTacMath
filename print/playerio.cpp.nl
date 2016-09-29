     1	/*
     2	    Author: Stephon Lawrence
     3	    Name: playerio.cpp
     4	*/
     5	#include <iostream>
     6	#include <string>
     7	#include <sstream>
     8	#include <iomanip>
     9	#include "playerio.h"
       
    10	using namespace std;
       
    11	void getAMove(int *move, int rowsize, int minv, int maxv) {
    12		string line;
    13		cout << "Type a position from 1-" << rowsize << " for x, " <<
    14		        "followed by a position from 1-" << rowsize << " for y, " <<
    15		        "followed by an integer from " << minv << "-" << maxv << "." << endl;
    16		getline(cin, line);
    17		stringstream s;
    18		s << line;
    19		move[0] = -1, move[1] = -1, move[2] = minv - 1;
    20		s >> move[0] >> move[1] >> move[2];
    21		cout << line;
    22		move[0] -= 1, move[1] -= 1;
    23	}
       
    24	void display(int *board, int rowsize, int minv, int maxv){
    25	    int position = 0;
    26		const int WSIZE = 2;
    27	    cout << endl;
    28	    for(int x = 0; x < rowsize; x++) {
    29	        cout << "[";
    30	        for(int y = 0; y < rowsize; y++) {
    31	            position = x*rowsize + y;
    32	            if(board[position] >= minv && board[position] <= maxv)
    33	                cout << setw(WSIZE) << board[position];
    34	            else
    35	                cout << setw(WSIZE) << " ";
    36	        }
    37	        cout << "]" << endl;
    38	    }
    39	}
