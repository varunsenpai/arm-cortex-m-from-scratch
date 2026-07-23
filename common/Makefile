SRCS = mem_ops.c
OBJS = $(SRCS:.c=.o)

OBJS_DIR = $(PROJ_ROOT)/build/
INC_DIR = $(PROJ_ROOT)/common $(PROJ_ROOT)/peripherals

INC = $(addprefix -I, $(INC_DIR))

all: $(OBJS)

%.o : %.c
	arm-none-eabi-gcc -O0 -nostdlib -nostartfiles -g -mcpu=cortex-m4 -mthumb $(INC) -c $< -o $(OBJS_DIR)$@

clean:
	rm -f *.o
