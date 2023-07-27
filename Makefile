TCH = arm-none-eabi-

all : application.hex

application.hex : application.elf
	$(TCH)objcopy -O ihex application.elf application.hex

application.elf : main.o tst.o
	$(TCH)ld -T LinkerScript.ld main.o tst.o -o application.elf

main.o : main.c
	$(TCH)gcc -c -mcpu=cortex-m3 -mthumb main.c -o main.o
	
tst.o : tst.c
	$(TCH)gcc -c -mcpu=cortex-m3 -mthumb tst.c -o tst.o
		
clean : 
	rm *.o *.hex *.elf