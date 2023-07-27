TCH = arm-none-eabi-
OPT = -mcpu=cortex-m3 -mthumb

all : application.hex

application.hex : application.elf
	$(TCH)objcopy -O ihex $< $@

application.elf : main.o tst.o
	$(TCH)ld -T LinkerScript.ld main.o tst.o -o $@

main.o : main.c
	$(TCH)gcc -c $(OPT) $< -o $@
	
tst.o : tst.c
	$(TCH)gcc -c $(OPT) $< -o $@
		
clean : 
	rm *.o *.hex *.elf