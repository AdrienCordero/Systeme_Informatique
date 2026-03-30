#include "asm.h"
#include <stdio.h>
#include <stdlib.h>

FILE *file = NULL;

void create_file() {
    file = fopen("asm.ea", "w");
}

void close_file() {
    fclose(file);
}

void afc(int address, int val) {
    fprintf(file, "AFC %d %d\n", address, val);
}

void add(int addr, int a, int b) {
    fprintf(file, "ADD %d %d %d\n", addr, a, b);
}