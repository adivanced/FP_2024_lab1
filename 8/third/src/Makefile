main: main.o asm.o
	gcc main.o asm.o -o main

asm.o: get_biggest_13.asm
	nasm -f elf64 get_biggest_13.asm -o asm.o

main.o: main.c
	gcc main.c -c

