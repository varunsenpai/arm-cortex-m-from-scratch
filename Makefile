SRC_FLDRS := App common

.PHONY = elf clean $(SRC_FLDRS) 

TARGET = build/my_bin.elf

OBJS_DIR := build

export PROJ_ROOT = $(CURDIR)

OBJS = $(wildcard $(OBJS_DIR)/*.o)

all : elf link

elf: $(SRC_FLDRS)
	@for dir in $(SRC_FLDRS); do \
		$(MAKE) -C $$dir; \
	done
	

link: elf
	arm-none-eabi-gcc -O0 -mcpu=cortex-m4 -nostdlib -nostartfiles -g -T linker_varun.ld $(OBJS) -o $(TARGET)


ocd:
	openocd -f interface/stlink.cfg -f target/stm32f4x.cfg -c "program $(TARGET) verify reset exit"
	openocd -f interface/stlink.cfg -f target/stm32f4x.cfg

gdb:
	gdb-multiarch $(TARGET)

clean:
	@rm -f build/*.o $(TARGET)
