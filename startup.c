
typedef void (*isr_vector)(void);

void Reset_Handler();
void NMI_Handler();
void HardFault_Handler();
void MemManage_Handler();
void BusFault_Handler();
void SecureFault_Handler();
void Usage_Handler();

void copyData();
void zeroBss();

int add(int a, int b);

extern unsigned char _sidata;
extern unsigned char _sdata;
extern unsigned char _edata;
extern unsigned char _sbss;
extern unsigned char _ebss;
extern unsigned char _top_stack;

int y = 10;
int z;

int main();

__attribute__((section(".isr_vector"), used))
const isr_vector g_pfnVectors[] = {
    (isr_vector)((&_top_stack)),
    Reset_Handler,
    NMI_Handler,
    HardFault_Handler,
    MemManage_Handler,
    BusFault_Handler,
    SecureFault_Handler,
    Usage_Handler,
    (isr_vector)0,
    (isr_vector)0,
    (isr_vector)0
};

void Reset_Handler()
{
    zeroBss();
    copyData();
    main();
    return;
}

void NMI_Handler()
{
    return;
}

void HardFault_Handler()
{
    return;
}

void MemManage_Handler()
{
    return;
}

void BusFault_Handler()
{
    return;
}

void SecureFault_Handler()
{
    return;
}

void Usage_Handler()
{
    return;
}

int add(int a, int b)
{
	return a+b;
}

int main()
{
    unsigned int x = y;
    int abc = add(1,2);
    ++abc;
    ++z;
    ++z;

    while(1);
}

void copyData()
{
    // get the address of the data section in flash
    unsigned char *srcFlash = &_sidata;
    unsigned char *startDataRam = &_sdata;
    unsigned char *endDataRam = &_edata;

    while(startDataRam < endDataRam) {
        *startDataRam = *srcFlash;
        ++srcFlash;
        ++startDataRam;
    }
}

void zeroBss()
{
    unsigned char *startbss = &_sbss;
    unsigned char *endbss = &_ebss;

    while(endbss - startbss)
    {
        *startbss = 0;
        ++startbss;
    }
}
