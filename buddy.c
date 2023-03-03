#include "buddy.h"
#include "memcpy.h"

#include <stdio.h>

// I can not create a huge array in the stack.
// So I have to use malloc to create the `physical memory`.
#include <stdlib.h>

#define TREE_DEPTH 32
#define MEMORY_SIZE_BYTES (2ULL << (TREE_DEPTH - 1))
#define MEMORY_PAGES (1)
#define MEMORY_PER_PAGE_SIZE (MEMORY_SIZE_BYTES / MEMORY_PAGES)
#define BLOCK_SIZE_MINIMUM_BYTES 64

struct buddy_header;

/**
 * Header of a block.
 *
 * There is no addr field because the addr is always computable.
 * addr = (char*)header_addr + sizeof(header)
 *
 * It is also easy to get the header of a block from its addr.
 * header_addr = (char*)addr - sizeof(header)
 */
typedef struct buddy_header
{
    int page_index;
    bool allocated;
    size_t size;
    struct buddy_header* next;
    struct buddy_header* prev;
} hdr_t;

#define HEADER_SIZE_BYTES (sizeof(hdr_t))


// The entire virtual memory for the program is 1 GB.
static char* vm_store[MEMORY_PAGES]; // [MEMORY_PER_PAGE_SIZE];
static size_t page_blocks[MEMORY_PAGES];
static size_t total_allocated = 0;
static hdr_t* last_block = NULL;

static bool initialized = false;


static inline void* get_addr(hdr_t* header)
{
    return (char*) header + HEADER_SIZE_BYTES;
}

static inline hdr_t* get_header(void* addr)
{
    return (hdr_t*) ((char*) addr - HEADER_SIZE_BYTES);
}

static inline void init()
{
    // Initialize pages.
    for (int i = 0; i < MEMORY_PAGES; ++i) {
        vm_store[i] = malloc(MEMORY_PER_PAGE_SIZE);
        hdr_t* master = (hdr_t*) vm_store[i];
        master->allocated = false;
        master->size = MEMORY_PER_PAGE_SIZE - HEADER_SIZE_BYTES;
        master->next = NULL;
        master->prev = NULL;
        master->page_index = i;
    }
}

static inline void try_init()
{
    if (!initialized) {
        init();
        initialized = true;
    }
}

/**
 * Check if the provided size is perfect fit for the required size.
 * @param provided
 * @param required
 * @return
 */
static inline bool perfect_fit(size_t provided, size_t required)
{
    return (provided >> 1) < required && required < provided;
}

void buddy_print(int page_index)
{
    unsigned int total = 0;
    for (hdr_t* current = (hdr_t*) vm_store[page_index]; current; current = current->next) {
        if (current->allocated) {
            printf("\033[32m");
        } else {
            printf("\033[31m");
        }
        printf("%ld\033[0m, ", current->size + HEADER_SIZE_BYTES);
        ++total;

    }
    printf("\n%u blocks in total\n", total);
}


/**
 * Find the smallest block that can fit the requested size_required.
 *
 * Algorithm: Buddy.
 * @param size_required Desired size_required.
 * @return Pointer to the header of the block. NULL if no block can fit.
 */
static hdr_t* buddy_alloc_safe(size_t size_required, hdr_t* entire, size_t length)
{
    if (entire->allocated || entire->size < size_required) {
        return NULL;
    }

    if (perfect_fit(length, size_required + HEADER_SIZE_BYTES)) {
        return entire;
    }

    // Create left & right.
    hdr_t* left = entire;
    left->page_index = entire->page_index;
    left->size = (length >> 1) - HEADER_SIZE_BYTES;
    hdr_t* right = (hdr_t*) (get_addr(left) + left->size);
    right->page_index = left->page_index;
    right->size = left->size;

    // Link left & right.
    right->next = left->next;
    if (left->next) {
        left->next->prev = right;
    }
    left->next = right;
    right->prev = left;


    hdr_t* result = buddy_alloc_safe(size_required, left, length >> 1);
    if (result) {
        return result;
    }
    return buddy_alloc_safe(size_required, right, length >> 1);
}

/**
 * Allocate @b size bytes of memory for the exclusive use of the caller,
 * as `malloc(3)` would.
 */
void* buddy_malloc(size_t size)
{
    try_init();

    if (size < BLOCK_SIZE_MINIMUM_BYTES) {
        size = BLOCK_SIZE_MINIMUM_BYTES;
    }

    // Find the smallest block that can fit the requested size.
    hdr_t* ret = NULL;
    for (int i = 0; i < MEMORY_PAGES; ++i) {
        if (page_blocks[i] + size + HEADER_SIZE_BYTES >= MEMORY_PER_PAGE_SIZE) {
            continue;
        }
        if (last_block == NULL) {
            last_block = (hdr_t*) vm_store[i];
        }
        for (hdr_t* current = last_block; current; current = current->next) {
            ret = buddy_alloc_safe(size, current, current->size + HEADER_SIZE_BYTES);
            if (ret) {
                ret->allocated = true;
                total_allocated += ret->size;
                page_blocks[i] += ret->size + HEADER_SIZE_BYTES;
                last_block = ret;
                return get_addr(ret);
            }
        }
        break;
    }
    return NULL;
}

/**
 * Change the size of the allocation starting at @b ptr to be @b size bytes,
 * as `realloc(3)` would.
 */
void* buddy_realloc(void* ptr, size_t size)
{
    // realloc NULL -> malloc(size)
    if (!ptr) {
        return buddy_malloc(size);
    }

    // valid ptr but zero size -> free and return NULL
    if (size == 0) {
        buddy_free(ptr);
        return NULL;
    }

    hdr_t* header = get_header(ptr);

    // No need to reallocate?
    if (header->size >= size) {
        return ptr;
    }

    hdr_t* new_header = buddy_malloc(size);

    // No buddy :( ?
    if (!new_header) {
        return NULL;
    }

    char* ptr_data = (char*) ptr;
    char* new_ptr_data = (char*) get_addr(new_header);

    memcpy(new_ptr_data, ptr_data, header->size);

    buddy_free(ptr);
    return new_ptr_data;
}

/**
 * Release the memory allocation starting at @b ptr for general use,
 * as `free(3)` would.
 */
void buddy_free(void* ptr)
{
    // free(NULL) should be guaranteed to do nothing.
    if (!ptr) {
        return;
    }

    hdr_t* header = get_header(ptr);
    last_block = NULL;

    // Mark the block as free.
    header->allocated = false;
    page_blocks[header->page_index] -= header->size + HEADER_SIZE_BYTES;
    total_allocated -= header->size;

    // Merge right buddies.
    while (header->next && !header->next->allocated) {
        // Merge with right buddy.
        hdr_t* right = header->next;
        header->size += HEADER_SIZE_BYTES + right->size;

        // Remove right buddy from the list.
        header->next = right->next;
        if (right->next) {
            right->next->prev = header;
        }
        right->next = NULL;
        right->prev = NULL;
    }

    // Merge left buddies.
    while (header->prev && !header->prev->allocated) {
        // Merge with left buddy.
        hdr_t* left = header->prev;
        left->size += HEADER_SIZE_BYTES + header->size;

        // Remove header from the list.
        left->next = header->next;
        if (header->next) {
            header->next->prev = left;
        }
        header->next = NULL;
        header->prev = NULL;

        header = left;
    }
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
size_t buddy_alloc_size(void* ptr)
{
    try_init();

    if (!ptr) {
        return 0;
    }

    hdr_t* header = get_header(ptr);
    return header->allocated ? header->size : 0;
}

/**
 * Does this pointer point at the beginning of a valid allocation?
 *
 * @param   ptr    any virtual address
 *
 * @returns whether or not @b ptr is a currently-allocated address returned
 *          from @b my_{m,re}alloc
 */
bool buddy_allocated(void* ptr)
{
    try_init();

    if (!ptr) {
        return false;
    }

    // Iterate over all blocks :(
    for (int i = 0; i < MEMORY_PAGES; ++i) {
        for (hdr_t* current = (hdr_t*) vm_store[i]; current; current = current->next) {
            if (current->allocated && get_addr(current) == ptr) {
                return true;
            }
        }
    }
    return false;
}

/**
 * How much memory has been allocated by this allocator?
 *
 * @returns the number of bytes that have been allocated to user code,
 *          **not** including any allocator overhead
 */
size_t buddy_total_allocated(void)
{
    return total_allocated;
}
