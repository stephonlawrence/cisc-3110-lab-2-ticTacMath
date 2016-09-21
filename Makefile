ticTacMath: main.o playerio.o gameboard.o
	g++ -o ticTacMath main.o playerio.o gameboard.o
main.o: main.cpp playerio.h gameboard.h
	g++ -c main.cpp playerio.cpp gameboard.cpp
playerio.o: playerio.cpp playerio.h
	g++ -c playerio.cpp
gameboard.o: gameboard.cpp gameboard.h
	g++ -c gameboard.cpp