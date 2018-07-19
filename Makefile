
CC = /usr/local/i386elfgcc/bin/i386-elf-gcc
LD = /usr/local/i386elfgcc/bin/i386-elf-ld


all : os-image.bin

os-image.bin : boot_sect.bin kernel.bin
	cat boot_sect.bin kernel.bin > os-image.bin

kernel.bin : kernel_entry.o kernel.o
	$(LD) -o $@ -Ttext 0x1000 $^ --oformat binary


kernel_entry.o	: kernel_entry.asm
	asm $< -f elf -o $@

kernel.o: kernel.c
	$(CC) -ffreestanding -c $< -o $@


boot_sect.bin : boot_sect.asm *.asm
	asm -f bin $< -o $@

run: os-image.bin
	qemu-system-i386 -fda $<

.PHONY: run all clean

clean:
	-rm *.o *.bin