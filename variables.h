#ifndef VARIABLES_H
#define VARIABLES_H

#include <stdbool.h>

typedef enum { OP_ADD, OP_SUB, OP_MUL, OP_DIV } OPERATION;

int decl(char* name);

void assign(char* name, int addr);

void decl_assign_const(char* name, int val);

int get_var(char* name);

int create_tmp(int val);

int op_var(OPERATION op, int a, int b);

#endif