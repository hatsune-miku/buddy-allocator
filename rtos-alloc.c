#include "rtos-alloc.h"
#include "buddy.h"

void* rtos_malloc(size_t size)
{
    return buddy_malloc(size);
}

/**
 * Change the size of the allocation starting at @b ptr to be @b size bytes,
 * as `realloc(3)` would.
 */
void* rtos_realloc(void* ptr, size_t size)
{
    return buddy_realloc(ptr, size);
}

/**
 * Release the memory allocation starting at @b ptr for general use,
 * as `free(3)` would.
 */
void rtos_free(void* ptr)
{
    return buddy_free(ptr);
}


/*
 * The following functions will help our test code inspect your allocator's
 * internal state:
 */

/**
 * How large is the allocation pointed at by this pointer?
 *
 * @pre   @b ptr points at a valid allocation (according to `rtos_allocated`)
 */
size_t rtos_alloc_size(void* ptr)
{
    return buddy_alloc_size(ptr);
}

/**
 * Does this pointer point at the beginning of a valid allocation?
 *
 * @param   ptr    any virtual address
 *
 * @returns whether or not @b ptr is a currently-allocated address returned
 *          from @b my_{m,re}alloc
 */
bool rtos_allocated(void* ptr)
{
    return buddy_allocated(ptr);
}

bool rtos_is_valid(void *p)
{
    return buddy_allocated(p);
}

/**
 * How much memory has been allocated by this allocator?
 *
 * @returns the number of bytes that have been allocated to user code,
 *          **not** including any allocator overhead
 */
size_t rtos_total_allocated(void)
{
    return buddy_total_allocated();
}
