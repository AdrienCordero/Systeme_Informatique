#include <stdbool.h>

typedef struct {
  char name[64];
  int addr;
  int val;
  bool is_const;
} var_int_t;

void asm_create_file();

void asm_close_file();

void asm_afc(int address, int val);

void asm_add(int addr, int a, int b);

void asm_sub(int addr, int a, int b);

void asm_mul(int addr, int a, int b);

void asm_div(int addr, int a, int b);