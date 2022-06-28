all: clean run

boot.o: boot.asm
	nasm $< -f elf -o $@

drivers/keyboard_driver.o: drivers/keyboard_driver.asm
	nasm $< -f elf -o $@

drivers/vga_driver.o: drivers/vga_driver.asm
	nasm $< -f elf -o $@

drivers/disk.o: drivers/disk.asm
	nasm $< -f elf -o $@

kernel/kernel.o: kernel/kernel.asm
	nasm $< -f elf -o $@

boot.bin: boot.o kernel/kernel.o drivers/disk.o drivers/vga_driver.o drivers/keyboard_driver.o 
	ld -m elf_i386 -o $@ -Ttext 0x1000 $^ --oformat binary

run: boot.bin
	qemu-system-i386 -fda boot.bin

clean:
	$(RM) *.bin *.o
	$(RM) drivers/*.o
	$(RM) kernel/*.o

