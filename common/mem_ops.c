void *memset(void *s, int c, int n)
{
    unsigned char *temp = (unsigned char *)s;

    while(n >= 0)
    {
        temp[n] = 0;
        --n;
    }

    return s;
}