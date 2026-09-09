PICO_TOOLCHAIN_PATH?=~/.pico-sdk/toolchain/13_2_Rel1
CPP=/usr/bin/arm-none-eabi-cpp # Using global install instead of version from pico_sdk

main.i: main.c
	$(CPP) main.c > main.i

.PHONY: clean
clean:
	rm -f main.i hello.txt