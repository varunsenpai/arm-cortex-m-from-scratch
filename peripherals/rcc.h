#ifndef __RCC_H__
#define __RCC_H__

typedef struct
{
    unsigned int CR;
    unsigned int PLLCFGR;
    unsigned int CFGR;
    unsigned int CIR;
    unsigned int AHB1RSTR;
    unsigned int AHB2RSTR;
    unsigned int APB1RSTR;
    unsigned int APB2RSTR;
    unsigned int AHB1ENR;
    unsigned int AHB2ENR;
    unsigned int APB1ENR;
    unsigned int APB2ENR;
    unsigned int AHB1LPENR;
    unsigned int AHB2LPENR;
    unsigned int APB1LPENR;
    unsigned int APB2LPENR;
} RCC_Typedef;

#endif