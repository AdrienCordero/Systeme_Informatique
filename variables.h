#ifndef VARIABLES_H
#define VARIABLES_H

#include <stdbool.h>

int decl(char* name);

void assign(char* name, int val);

void decl_assign_const(char* name, int val);

int get_var(char* name);

void add_var(int a, int b);

#endif