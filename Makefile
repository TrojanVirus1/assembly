# http://pirate.shu.edu/~minimair/assembler/Makefile
#
all: main

asm_io.o : asm_io.asm
	nasm -dELF_TYPE -f elf -g asm_io.asm -o asm_io.o

read_doubles.o : read_doubles.asm
	nasm -l read_doubles.list -f elf -g -F stabs read_doubles.asm -o read_doubles.o

get_array.o : get_array.asm
	nasm -l get_array.list -f elf -g -F stabs get_array.asm -o get_array.o

standard_dev.o : standard_dev.asm
	nasm -l standard_dev.list -f elf -g -F stabs standard_dev.asm -o standard_dev.o

main : asm_io.o read_doubles.o get_array.o standard_dev.o
	gcc -m32 -o main \
		read_doubles.o \
		standard_dev.o \
		get_array.o \
		asm_io.o \
		main.c

run : 
	./main

edit:
	vim standard_dev.asm

debug:
	gdb ./main

clean :
	@rm *.o *.list main
