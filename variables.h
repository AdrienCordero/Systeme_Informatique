#ifndef VARIABLES_H
#define VARIABLES_H

#include <stdbool.h>

typedef struct {
  char name[64];
  int val;
  bool is_const;
} var_int_t;

void decl(char* name);

void decl_and_assign(char* name, int val, bool is_const);

int get_var(char* name);

#endif