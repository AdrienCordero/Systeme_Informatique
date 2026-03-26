#ifndef VARIABLES_H
#define VARIABLES_H

typedef struct {
  char name[64];
  int val;  
} var_int_t;

void decl(char* name);

void decl_and_assign(char* name, int val);

void decl_and_assign_const(char* name, const int val);

#endif