#include "memcpy.h"

void* memcpy(void* dst, const void* src, size_t n)
{
    if (!dst || !src) {
        return NULL;
    }

    char* d = dst;
    const char* s = src;

    while (n--) {
        *d++ = *s++;
    }

    return dst;
}
