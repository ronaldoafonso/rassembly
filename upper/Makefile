
all: upper

upper: upper.o
	ld -o upper upper.o

upper.o: upper.asm
	nasm -f elf64 -g -F stabs upper.asm

clean:
	rm -f *.o upper

test:
	@./test_upper.sh

.PHONY: all
.PHONY: clean
