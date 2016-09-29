     1	/*
     2	    Author: Stephon Lawrence
     3	    Name: gameboard.h
     4	*/
     5	#ifndef GAMEBOARD
     6	#define GAMEBOARD
       
     7	/// makes a move on the board
     8	void playAMove(int *board, int *move, int rowsize);
       
     9	/// returns true if the given move is wan't made already or
    10	/// is possible on the board and false if not
    11	bool validate(int *board, int *move, int rowsize, int minv, int maxv);
       
    12	/// tells whether someone won already or not
    13	bool checkForWin(int *board, int rowsize, int sumGoal, int minv, int maxv);
       
    14	#endif
