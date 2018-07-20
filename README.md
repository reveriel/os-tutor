
OS from scratch, see [os-tutorial](https://github.com/cfenollosa/os-tutorial)

* [Writing a Simple Operating System — from Scratch](http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)

* [nasm language](https://www.nasm.us/xdoc/2.13.03/html/nasmdoc0.html)
    * see appendix b, instructions
* [BIOS interrupt call](https://en.wikipedia.org/wiki/BIOS_interrupt_call)
* [OS dev wiki](https://wiki.osdev.org/GCC_Cross-Compiler)

## compile

```
nasm -f bin a.asm -o a.bin
```

### cross compile

need binutils and gcc, and gdb

```
export PREFIX="/usr/local/i386elfgcc"
export TARGET=i386-elf
```

see [kernel-crosscompiler](https://github.com/cfenollosa/os-tutorial/tree/master/11-kernel-crosscompiler)

and [osdev - gcc cross compiler](https://wiki.osdev.org/GCC_Cross-Compiler)


## run

```
qemu a.bin
```