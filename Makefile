.PHONY = elf

object = startup

SRCS = startup.c main.c
OBJS = $(SRCS:.c=.o)
TARGET = my_bin.elf

elf: $(OBJS)
	arm-none-eabi-gcc -O0 -mcpu=cortex-m4 -nostdlib -nostartfiles -g -T linker_varun.ld $^ -o $(TARGET)

%.o : %.c
	arm-none-eabi-gcc -g -mcpu=cortex-m4 -mthumb -c $< -o $@

ocd:
	openocd -f interface/stlink.cfg -f target/stm32f4x.cfg -c "program $(TARGET) verify reset exit"
	openocd -f interface/stlink.cfg -f target/stm32f4x.cfg

gdb:
	gdb-multiarch $(TARGET)

clean:
	rm -f *.o $(TARGET)
