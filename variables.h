#ifndef VARIABLES_H
#define VARIABLES_H

#include <stdbool.h>

int decl(char* name);

void assign(char* name, int addr);

void decl_assign_const(char* name, int val);

int get_var(char* name);

int create_tmp(int val);

int add_var(int a, int b);

#endif