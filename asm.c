#include "asm.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE *file = NULL;
int num_instruction = 0;
//On va créer un tableau de 
instruction_t* instructions;
int max_instruction = 100;

void init_instructions(){
    instructions = malloc(sizeof(instruction_t) * max_instruction);
}

int get_num_instruction(){
    return num_instruction;
}

void asm_create_file() {
    file = fopen("asm.ea", "w");
    init_instructions();
}

void asm_close_file() {
    fclose(file);
}

void asm_afc(int address, int val) {
    instruction_t tmp = {"AFC", address, val};
    instructions[num_instruction] = tmp;
    //fprintf(file, "AFC %d %d\n", address, val);
    num_instruction++;
}

void asm_cop(int addr, int a) {
    instruction_t tmp = {"COP", addr, a};
    instructions[num_instruction] = tmp;
//    fprintf(file, "COP %d %d\n", addr, a);
    num_instruction++;
}

void asm_add(int addr, int a, int b) {
    instruction_t tmp = {"ADD", addr, a, b};
    instructions[num_instruction] = tmp;
    //fprintf(file, "ADD %d %d %d\n", addr, a, b);
    num_instruction++;
}

void asm_sub(int addr, int a, int b) {
    instruction_t tmp = {"SUB", addr, a, b};
    instructions[num_instruction] = tmp;
    //fprintf(file, "SUB %d %d %d\n", addr, a, b);
    num_instruction++;
}

void asm_mul(int addr, int a, int b) {
    instruction_t tmp = {"MUL", addr, a, b};
    instructions[num_instruction] = tmp;
    //fprintf(file, "MUL %d %d %d\n", addr, a, b);
    num_instruction++;
}

void asm_div(int addr, int a, int b) {
    instruction_t tmp = {"DIV", addr, a, b};
    instructions[num_instruction] = tmp;
    //fprintf(file, "DIV %d %d %d\n", addr, a, b);
    num_instruction++;
}

void asm_jmf(int cond_addr, int dest_line) {
    instruction_t tmp = {"JMF", cond_addr, dest_line, 0};
    instructions[num_instruction] = tmp;
    num_instruction++;
}

void asm_jmp(int dest_line) {
    instruction_t tmp = {"JMP", dest_line, 0, 0};
    instructions[num_instruction] = tmp;
    num_instruction++;
}

int jump_code() {
    int idx = get_num_instruction();
    asm_jmp(0);  /* destination qui sera patchée plus tard, on va la mettre à 0 d'abord */
    return idx;
}

void asm_eq(int addr, int a, int b){
    instruction_t tmp = {"EQ", addr, a, b};
    instructions[num_instruction] = tmp;
    //fprintf(file, "EQ %d %d %d\n", addr, a, b);
    num_instruction++;
}

void generate_asm(){
    for (int i=0; i<num_instruction; i++)
        fprintf(file, "%s %d %d %d\n", instructions[i].code, instructions[i].op1, instructions[i].op2, instructions[i].op3);
}

/* Met à jour uniquement la destination du JMF ou JMP */
void patch(int line_instruction, int end_block){
    if (strncmp(instructions[line_instruction].code, "JMF", 3) == 0)
        instructions[line_instruction].op2 = end_block; 
    else
        instructions[line_instruction].op1 = end_block;
}
