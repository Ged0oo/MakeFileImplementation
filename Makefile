application.hex : application.elf
	arm-none-eabi-objcopy -O ihex application.elf application.hex

application.elf : main.o tst.o
	arm-none-eabi-ld -T LinkerScript.ld main.o tst.o -o application.elf

main.o : main.c
	arm-none-eabi-gcc -c -mcpu=cortex-m3 -mthumb main.c -o main.o
	
tst.o : tst.c
	arm-none-eabi-gcc -c -mcpu=cortex-m3 -mthumb tst.c -o tst.o
		
clean : 
	rm *.o *.hex *.elf