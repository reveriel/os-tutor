
boot_sect.bin : boot_sect.asm print_string.asm print_hex.asm
	asm -f bin $< -o $@

run: boot_sect.bin
	qemu-system-x86_64 $<

.PHONY: run