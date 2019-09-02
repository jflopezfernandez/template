
#ifndef PROJECT_INCLUDES_MEM_H
#define PROJECT_INCLUDES_MEM_H

// TODO: Implement mem.h

#ifndef FREE
#define FREE(ptr) free(ptr)
#else
#error "FREE has already been defined"
#endif

#endif // PROJECT_INCLUDES_MEM_H
