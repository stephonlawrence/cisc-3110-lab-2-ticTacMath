#include <iostream>
#include <string>
#include <sstream>
#include "playerio.h"

using namespace std;

// move = {x coordinate, y coordinate, value};
/// minc is the min int for a coordinate
/// maxc is the max int for a coordinate
/// minv is the min int for a value
/// maxv is the max int for a value
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
	move[0] -= 1, move[1] -= 1;
}
