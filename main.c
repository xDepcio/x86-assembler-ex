#include <stdio.h>
#include "removerng.h"

int main(int argc, char *argv[])
{
    if(argc < 2)
    {
        printf("Arg. missing\n");
        return;
    }
    char* res = removerng(argv[1], argv[2], argv[3]);
    printf(res);
    printf("\n");
    return 0;
}
