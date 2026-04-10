#include "asm.h"
#include <stdio.h>
#include <stdlib.h>

FILE *file = NULL;
int num_instruction = 0;

void asm_create_file() {
    file = fopen("asm.ea", "w");
}

void asm_close_file() {
    fclose(file);
}

void asm_afc(int address, int val) {
    fprintf(file, "AFC %d %d\n", address, val);
    num_instruction++;
}

void asm_cop(int addr, int a) {
    fprintf(file, "COP %d %d\n", addr, a);
    num_instruction++;
}

void asm_add(int addr, int a, int b) {
    fprintf(file, "ADD %d %d %d\n", addr, a, b);
    num_instruction++;
}

void asm_sub(int addr, int a, int b) {
    fprintf(file, "SUB %d %d %d\n", addr, a, b);
    num_instruction++;
}

void asm_mul(int addr, int a, int b) {
    fprintf(file, "MUL %d %d %d\n", addr, a, b);
    num_instruction++;
}

void asm_div(int addr, int a, int b) {
    fprintf(file, "DIV %d %d %d\n", addr, a, b);
    num_instruction++;
}

void asm_jne(int addr) {
    fprintf(file, "JMF %d\n", addr);
    num_instruction++;
}
/*
void asm_jump(int label) {
    fprintf(file, "JUMP %d\n", label);
    num_instruction++;
}

void asm_label(int label) {
    fprintf(file, "LABEL %d\n", label);
    num_instruction++;
}*/

void asm_eq(int addr, int a, int b){
    fprintf(file, "EQ %d %d %d\n", addr, a, b);
    num_instruction++;
}