
#include "template.h"

int main(int argc, char *argv[])
{
    for (int i = 1; i < argc; ++i) {
        char* str = strdup(argv[i]);
        printf("%s\n", str);
        FREE(str);
        FREE(str);
    }

    return EXIT_SUCCESS;
}
