#include "variables.h"
#include "asm.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int max_var = 0;
var_int_t *table_var;
int nb_var = 0;

void print_var_addr() {
    for (int i=0; i < nb_var; i++)
        if (strcmp(table_var[i].name, "") != 0)
            printf("%s : %d\n", table_var[i].name, table_var[i].addr);
}

int decl(char* name) {
    if (max_var == 0) {
        table_var = malloc(100 * sizeof(var_int_t));
        max_var = 100;
    }
    if (strcmp("", name) != 0) {
        for (int i=0; i < nb_var; i++) {
            if (strcmp(name, table_var[i].name) == 0) {
                printf("La variable existe déjà\n");
                return -1;
            }
        }
    }
    if (nb_var == max_var) {
        max_var *= 2;
        table_var = realloc(table_var, max_var * sizeof(int));
    }
    strcpy(table_var[nb_var].name, name);
    table_var[nb_var].addr = nb_var;
    table_var[nb_var].is_const = false;
    nb_var++;
    return table_var[nb_var-1].addr;
}

void assign(char* name, int addr) {
    for (int i=0; i < nb_var; i++) {
        if (strcmp(name, table_var[i].name) == 0) {
            if (table_var[i].is_const) {
                printf("impossible d'assigner une valeur à une variable constante\n");
                return;
            }
            int new_addr = decl("");
            table_var[i].addr = new_addr;
            asm_cop(new_addr, addr);
        }
    }
}

void decl_assign_const(char* name, int val) {
    decl(name);
    table_var[nb_var - 1].is_const = true;
    asm_afc(table_var[nb_var - 1].addr, val);
}

int get_var(char* name) {
    for (int i=0; i < nb_var; i++)
        if (strcmp(name, table_var[i].name) == 0)
            return table_var[i].addr;
    printf("Aucune variable ne possède ce nom");
    return 0;
}

int create_tmp(int val) {
    int addr = decl("");
    asm_afc(addr, val);
    return addr;
}

int op_var(OPERATION op, int a, int b) {
    int addr_res = decl("");
    switch (op) {
    case OP_ADD:
        asm_add(addr_res, a, b);
        break;
    case OP_SUB:
        asm_sub(addr_res, a, b);
        break;
    case OP_MUL:
        asm_mul(addr_res, a, b);
        break;
    case OP_DIV:
        asm_div(addr_res, a, b);
        break;
    }
    return addr_res;
}