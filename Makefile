all : kernel-cp posix-cp

kernel-cp : kernel-cp.c
	g++ -g -std=c++11 -o kernel-cp  kernel-cp.c -laio -lpthread -lrt

posix-cp  : posix-cp.c
	g++ -g -std=c++11 -o posix-cp  posix-cp.c -lpthread -lrt

clean : 
	rm kernel-cp posix-cp

