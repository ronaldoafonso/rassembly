
all: helloworld

helloworld: helloworld.o
	ld -o helloworld helloworld.o

helloworld.o: helloworld.asm
	nasm -f elf64 -g -F stabs helloworld.asm

clean:
	rm -f *.o helloworld

.PHONY: all
.PHONY: clean
