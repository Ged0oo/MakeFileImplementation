/* 
 * File:   LinkerScript.ld
 * Author: Mohamed_Nagy
 * https://github.com/Ged0oo 
 * https://www.linkedin.com/in/mohamednagyofficial/
 * Created on March 17, 2023, 6:41 PM
 */



/* Memories Definition : Label(Attributes) : ORIGIN = Start Address		,   LENGTH = Memory Length */
MEMORY
{
  CCMRAM (xrw)    : ORIGIN = 0x10000000		,   LENGTH = 64K
  RAM    (xrw)    : ORIGIN = 0x20000000		,   LENGTH = 128K
  FLASH  (rx)     : ORIGIN = 0x08000000		,   LENGTH = 1024K
}



/* Memory Sections */
SECTIONS
{
  /* .text section saves program code and other data into FLASH memory */
  .text :
  {
	_textStart = .;        /* Global symbol at start of text section */
    . = ALIGN(4);
    *(.text)          	   /* .text  sections */
	*(.nagy)
    *(.text*)              /* .text* sections */
    . = ALIGN(4);
    _textEnd = .;          /* Global symbol at end of text section */
  } >FLASH




  /* .rodata section saves Constant data into FLASH memory */
  .rodata :
  {
	_rodatatStart = .;          /* Global symbol at start of rodata section */
    . = ALIGN(4);
    *(.rodata)         			/* .rodata  sections */
    *(.rodata*)        			/* .rodata  sections */
    . = ALIGN(4);
	_rodatatEnd = .;          	/* Global symbol at end of text section */
  } >FLASH




  /* .data section saves Initialized data sections into RAM memory */
  .data :
  {
	_datatStart = .;          /* Global symbol at start of data section */
    . = ALIGN(4);
    *(.data)           /* .data sections */
    *(.data*)          /* .data* sections */
    . = ALIGN(4);
    _datatStart = .;          /* Global symbol at start of data section */
  } >RAM AT> FLASH




  /* .bss section saves Uninitialized data section into RAM memory */
  .bss :
  {
	_bssStart = .;          /* Global symbol at start of bss section */
	. = ALIGN(4);
    *(.bss)            		/* .bss sections */
    *(.bss*)           		/* .bss* sections */
    . = ALIGN(4);
    _bssEnd = .;          	/* Global symbol at end of bss section */
  } >RAM

}
