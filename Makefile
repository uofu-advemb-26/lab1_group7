PICO_TOOLCHAIN_PATH?=~/.pico-sdk/toolchain/13_2_Rel1
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as
LD=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-ld
SRC=main.c test.c
OBJS=$(patsubst %.c,%.o,$(SRC))

.PHONY: all
all: firmware.elf hello.txt

firmware.elf: $(OBJS)
	$(LD) -e main -o $@ $^

%.o: %.s
	$(AS) $< -o $@

%.s: %.i
	$(CC) -S $<

%.i: %.c
	$(CPP) $< > $@

hello.txt:
	echo "hello world!" > hello.txt

.PHONY: clean
clean:
	rm -f *.i *.o *.s *.elf hello.txt