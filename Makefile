#Files:
CSOURCES 	:= *.c
ASMSOURCES 	:= init_kernel.asm
HEADERS		:= *.h
OBJFILES 	:= $(patsubst %.c,%.o,$(CSOURCES)) $(patsubst %.asm,%.o,$(ASMSOURCES))
ALLFILES	:= $(CSOURCES) $(ASMSOURCES)
BINLOGFILES	:= *.l *.log *.txt *.out *.bin

KERNEL_BIN	:= kernel.bin
DISK_IMG	:= diskette.img
#TASKS=task1.tsk

#Flags:
CFLAGS		:= -m32 -g -ggdb -Wall -Werror -O0  -fno-zero-initialized-in-bss -fno-stack-protector -ffreestanding
NASMFLAGS	:=-felf32
LDFLAGS		:=-static -m elf_i386 --oformat binary -b elf32-i386 -e start -Ttext 0x1200

#Tools:
MCOPY=mcopy
OBJDUMP=objdump
OBJCOPY=objcopy
CC=gcc
NASM=nasm
LD=ld
CTAGS := ctags

#Targets:
.PHONY=all

#all: cleantasks tasks clean image
all: clean image 

%.o: %.c
	@echo 'Compilando: $^'
	$(CC) $(CFLAGS) -c  $^

%.o: %.asm
	@echo 'Ensamblando: $^'
	@$(NASM) $(NASMFLAGS) -o $@ $^

kernel.bin: $(OBJFILES)
	@echo 'Linkeando el kernel... $(OBJFILES)'
	@$(LD) $(LDFLAGS) -o $@ $^
	@echo ''


image: kernel.bin
	@echo 'Copiando $(KERNEL_BIN)  a la imagen de diskette\n'
	$(MCOPY) -i $(DISK_IMG) $(KERNEL_BIN) ::/ 

clean:
	-@$(RM) $(wildcard $(OBJFILES)) $(BINLOGFILES)

run: image
	bochs -q

todolist:
	-@for file in $(ALLFILES); do fgrep -H -e TODO -e FIXME $$file; done; true

tags: $(ALLFILES)
	@$(CTAGS) $(ALLFILES)

