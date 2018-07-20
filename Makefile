
C_SOURCES = $(wildcard kernel/*.c drivers/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h)

OBJ = $(C_SOURCES:.c=.o)

CC = /usr/local/i386elfgcc/bin/i386-elf-gcc
LD = /usr/local/i386elfgcc/bin/i386-elf-ld
GDB = /usr/local/i386elfgcc/bin/i386-elf-gdb

CFLAGS = -g

all : os-image.bin

os-image.bin : boot/boot_sect.bin kernel.bin
	cat $^ > os-image.bin

# '--oformat binary' delets all symbols
kernel.bin : boot/kernel_entry.o $(OBJ)
	$(LD) -o $@ -Ttext 0x1000 $^ --oformat binary

# Used for debugging
kernel.elf: boot/kernel_entry.o $(OBJ)
	$(LD) -o $@ -Ttext 0x1000 $^

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -ffreestanding -c $< -o $@

%.o : %.asm
	asm $< -f elf -o $@

%.bin: %.asm
	asm $< -f bin -o $@

run: os-image.bin
	qemu-system-i386 -fda $<

# Open the connection to qemu and load the kernel-object with symbols
debug:	os-image.bin kernel.elf
	qemu-symbols-i386 -s -fda os-image.bin &
	$(GDB) -ex "target remote localhost:1234" \
	    -ex "symbol-file kernel.elf"

.PHONY: run all clean

clean:
	rm -rf *.o *.bin
	rm -rf  kernel/*.o
	rm -rf boot/*.bin boot/*.o
	rm -rf drivers/*.o