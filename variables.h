#ifndef VARIABLES_H
#define VARIABLES_H

#include <stdbool.h>

typedef struct {
  char name[64];
  int addr;
  bool is_const;
} var_int_t;

typedef enum { OP_ADD, OP_SUB, OP_MUL, OP_DIV } OPERATION;
typedef enum { OP_EQU, OP_SUP} COMPARAISON;

void print_var_addr();

int decl(char* name);

void assign(char* name, int addr);

void decl_assign_const(char* name, int val);

int get_var(char* name);

int create_tmp(int val);

int op_var(OPERATION op, int a, int b);

int get_label();

int compare_ne(int a, int b);

void begin_while(int a, int b);

void end_while(void);

#endif