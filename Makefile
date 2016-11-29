CC=gcc
CFLAGS=-I.

# Uses two files:  compile.c and lexer.c
# compile.c is where main is
# The completely compiled program will be named "compile"
compile: compile.o lexer.o
	$(CC) -o compile compile.o lexer.o -I.