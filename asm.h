#include <stdbool.h>

typedef struct {
    char code[4];
    int op1, op2, op3;
} instruction_t;

void init_instructions();

int get_num_instruction();

void asm_create_file();

void asm_close_file();

void asm_afc(int address, int val);

void asm_cop(int addr, int a);

void asm_add(int addr, int a, int b);

void asm_sub(int addr, int a, int b);

void asm_mul(int addr, int a, int b);

void asm_div(int addr, int a, int b);

/* JMF @cond_addr dest_line : saut si la condition est fausse */
void asm_jmf(int cond_addr, int dest_line);

/* JMP dest_line : saut inconditionnel */
void asm_jmp(int dest_line);

/* ecrit un JMP avec destination 0 et retourne son indice (pour patching) */
int jump_code();

void asm_eq(int addr, int a, int b);

/* Met à jour la destination d'un JMF ou JMP à l'indice line_instruction */
void patch(int line_instruction, int end_block);

void generate_asm();
