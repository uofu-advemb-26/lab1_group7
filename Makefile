PICO_TOOLCHAIN_PATH?=~/.pico-sdk/toolchain/13_2_Rel1
CPP=/usr/bin/arm-none-eabi-cpp # Using global install instead of version from pico_sdk
CC=/usr/bin/arm-none-eabi-gcc
AS=/usr/bin/arm-none-eabi-as

%.o: %.s
	$(AS) $< -o $@

main.s: main.i
	$(CC) -S main.i

main.i: main.c
	$(CPP) main.c > main.i

.PHONY: clean
clean:
	rm -f main.i hello.txt