all: clean run

bootSect.bin:
	fasm ../src/kernel/bootSect.asm
	mv ../src/kernel/bootSect.bin ./

kernel.bin:
	fasm ../src/kernel/kernel.asm
	mv ../src/kernel/kernel.bin ./

boot.bin: bootSect.bin kernel.bin
	cat bootSect.bin kernel.bin > boot.bin

run: boot.bin
	qemu-system-i386 -fda boot.bin
	
clean:
	$(RM) ./*.bin
	