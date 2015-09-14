#include "quote.h"

int main (void) {
    char buf[BUF_LEN];

    while (fgets (buf, BUF_LEN, stdin)) {
        int len = 0;

        len = strlen (buf);
        if (len > 0 && buf[len - 1] == '\n') {
            buf[len - 1] = '\0';
        }
        printf ("\"%s\"\n", buf);
    }

    return EXIT_SUCCESS;
}

