Purpose:
Take the last 2 numbers in eax and print them on stdout in reverse order.

Compilation & execution:
    nasm -f elf -F stabs main.asm ; ld -m elf_i386 -o main.elf main.o ; ./main.elf