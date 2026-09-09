PICO_TOOLCHAIN_PATH?=~/.pico-sdk/toolchain/13_2_Rel1
CPP=/usr/bin/arm-none-eabi-cpp # Using global install instead of version from pico_sdk
CC=/usr/bin/arm-none-eabi-gcc
AS=/usr/bin/arm-none-eabi-as
LD=/usr/bin/arm-none-eabi-ld
SRC=main.c test.c
OBJS=$(patsubst %.c,%.o,$(SRC))

.PHONY: all
all: firmware.elf hello.txt

firmware.elf: $(OBJS)
	$(LD) -e main -o $@ $^

%.o: %.s
	$(AS) $< -o $@

main.s: main.i
	$(CC) -S main.i

main.i: main.c
	$(CPP) main.c > main.i

hello.txt:
	echo "hello world!" > hello.txt

.PHONY: clean
clean:
	rm -f *.i *.o *.s *.elf hello.txt