.PHONY = elf

object = startup

ocd:
	openocd -f interface/stlink.cfg -f target/stm32f4x.cfg -c "program startup.elf verify reset exit"
	openocd -f interface/stlink.cfg -f target/stm32f4x.cfg

gdb:
	gdb-multiarch $(object).elf

elf: $(object).c
	arm-none-eabi-gcc -g -mcpu=cortex-m4 -mthumb -c $(object).c -o $(object).o
	arm-none-eabi-gcc -O0 -mcpu=cortex-m4 -nostdlib -nostartfiles -g -T linker_varun.ld $(object).o -o $(object).elf

clean:
	rm -r *.o *.elf
