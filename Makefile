
boot_sect.bin : boot_sect.asm *.asm
	asm -f bin $< -o $@

run: boot_sect.bin
	qemu-system-x86_64 $<

.PHONY: run
