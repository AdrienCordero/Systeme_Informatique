#ifndef VARIABLES_H
#define VARIABLES_H

#include <stdbool.h>

typedef struct {
  char name[64];
  int addr;
  bool is_const;
  bool is_pointer;
} var_int_t;

typedef struct {
  int addr_debut;
  int addr_fin;
} bloc_t;

typedef enum { OP_ADD, OP_SUB, OP_MUL, OP_DIV } OPERATION;

void print_var_addr();

int decl(char* name, bool is_pointer);

void assign(char* name, int addr);

void decl_assign_const(char* name, int val);

int get_var(char* name);

int get_value(int addr);

int get_value_pointer(char* name);

int create_tmp(int val);

int op_var(OPERATION op, int a, int b);


int compare_ne(int a, int b);

/* genere un JMF pour la condition (cond_addr = adresse du résultat EQU).
   retourne l'indice de l'instruction JMF pour pouvoir la patcher ensuite. */
int if_code(int cond_addr);

/* genere l'instruction EQU et retourne l'adresse du résultat */
int verify(int a, int b);


#endif