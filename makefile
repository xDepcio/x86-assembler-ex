CC=gcc
CFLAGS=-m32 -Wall

all: main.o	removerng.o
	$(CC) $(CFLAGS) main.o removerng.o -o fun

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

removerng.o: removerng.s
	nasm -f elf removerng.s

clean:
	rm -f *.o
