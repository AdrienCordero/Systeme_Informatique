#include "asm.h"
#include <stdio.h>
#include <stdlib.h>

FILE *file = NULL;

void asm_create_file() {
    file = fopen("asm.ea", "w");
}

void asm_close_file() {
    fclose(file);
}

void asm_afc(int address, int val) {
    fprintf(file, "AFC %d %d\n", address, val);
}

void asm_cop(int addr, int a) {
    fprintf(file, "COP %d %d\n", addr, a);
}

void asm_add(int addr, int a, int b) {
    fprintf(file, "ADD %d %d %d\n", addr, a, b);
}

void asm_sub(int addr, int a, int b) {
    fprintf(file, "SUB %d %d %d\n", addr, a, b);
}

void asm_mul(int addr, int a, int b) {
    fprintf(file, "MUL %d %d %d\n", addr, a, b);
}

void asm_div(int addr, int a, int b) {
    fprintf(file, "DIV %d %d %d\n", addr, a, b);
}

void asm_jne(int addr, int val, int label) {
    fprintf(file, "JNE %d %d %d\n", addr, val, label);
}

void asm_jump(int label) {
    fprintf(file, "JUMP %d\n", label);
}

void asm_label(int label) {
    fprintf(file, "LABEL %d\n", label);
}