## Hobby Operating System Project

2021-12-17

This repository contains source files for a hobby x86 operating system written in C that boots with GRUB 2 Multiboot.

With the exception of the Makefile, all code in this repository was taken from a tutorial linked below. Next steps: rewrite the tutorial code and add keyboard support.

--

To build the operating system, run:

`make`

To build the OS and launch it in Qemu:

`make run`

To clean up the mess:

`make clean`

--

**Source tutorial:**

[https://wiki.osdev.org/Bare_Bones](https://wiki.osdev.org/Bare_Bones)

**Software required:**

1. i686-elf-gcc (cross-compiler)
2. Qemu (PC emulator)
3. xorriso for creating an iso (required by GRUB)
4. GRUB 2

**Install the following using Homebrew:**

brew install i686-elf-gcc
brew install qemu
brew install xorriso

**Install GRUB 2 - instructions here for OS X installation:**

https://wiki.osdev.org/GRUB

--

