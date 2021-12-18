COBJ = kernel.o
ASMOBJ = boot.o
CFLAGS = -std=gnu99 -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -ffreestanding -O2 -nostdlib
CC = i686-elf-gcc
AS = i686-elf-as
LIBS = -lgcc
ISODIR = isodir
GRUBROOT = boot/grub

build: myos.iso

%.o: %.c
	$(CC) -c $< -o $@ $(CFLAGS)
	
%.o: %.s
	$(AS) -o $@ $<
	
myos.bin: linker.ld $(COBJ) $(ASMOBJ)
	$(CC) -T $< -o $@ $(LDFLAGS) $(COBJ) $(ASMOBJ) $(LIBS)

myos.iso: grub.cfg myos.bin 
	mkdir -p $(ISODIR)/$(GRUBROOT)/
	cp $< $(ISODIR)/$(GRUBROOT)/
	cp $(word 2,$^) $(ISODIR)/boot/
	grub-mkrescue -o $@ $(ISODIR)

.PHONY: clean run

run: build
	qemu-system-x86_64 -cdrom myos.iso

clean:
	rm -rf *.o *.bin isodir
	

