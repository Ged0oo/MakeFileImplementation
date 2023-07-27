TCH = arm-none-eabi-
OPT = -mcpu=cortex-m3 -mthumb
SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)

all : application.hex

application.hex : application.elf
	$(TCH)objcopy -O ihex $< $@

application.elf : $(OBJ)
	$(TCH)ld -T LinkerScript.ld $(OBJ) -o $@

%.o : %.c
	$(TCH)gcc -c $(OPT) $< -o $@
		
clean : 
	rm *.o *.hex *.elf