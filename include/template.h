
#ifndef PROJECT_INCLUDES_TEMPLATE_H
#define PROJECT_INCLUDES_TEMPLATE_H

#include <stdio.h>
#include <stdlib.h>

#if !defined(FALSE) || !defined(TRUE)
enum { FALSE = 0, TRUE = !FALSE };
#endif

#include "mem.h"

#endif // PROJECT_INCLUDES_TEMPLATE_H
