ENTRY(Reset_Handler)

MEMORY 
{
  RAM    (xrw)    : ORIGIN = 0x20000000,   LENGTH = 128K
  FLASH  (rx)     : ORIGIN = 0x08000000, LENGTH = 512K
}

_Min_Heap_Size = 0x200; /* required amount of heap */
_Min_Stack_Size = 0x400; /* required amount of stack */
_estack = ORIGIN(RAM) + LENGTH(RAM);

SECTIONS
{
    .isr_vector : {
        . = ALIGN(4);
        KEEP(*(.isr_vector))
        . = ALIGN(4);
    } > FLASH

    .text : {
        . = ALIGN(4);
        *(.text)
        . = ALIGN(4);
    } > FLASH

    .rodata : {
        . = ALIGN(4);
        *(.rodata)
        . = ALIGN(4);
    } > FLASH

    .data : {
        . = ALIGN(4);
        _sdata = . ;
        *(.data)
	. = ALIGN(4);
        _edata = . ;
    } >RAM AT> FLASH

    _sidata = LOADADDR(.data);

    .bss : {
        . = ALIGN(4);
        _sbss = . ;
        *(.bss)
	. = ALIGN(4);
        _ebss = . ;
    } > RAM

  ._user_heap_stack :
  {
    . = ALIGN(8);
    PROVIDE ( end = . );
    PROVIDE ( _end = . );
    . = . + _Min_Heap_Size;
    . = . + _Min_Stack_Size;
    . = ALIGN(8);
    _top_stack = .;
  } >RAM
}
