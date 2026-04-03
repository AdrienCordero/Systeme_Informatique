#include "variables.h"
#include "asm.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int max_var = 0;
int max_tmp = 0;
var_int_t *table_var;
tmp_int_t *table_tmp;
int nb_var = 0;
int nb_tmp = 0;

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
    printf("%d\n", table_var[nb_var-1].addr);
    return table_var[nb_var-1].addr;
}

void assign(char* name, int val) {
    for (int i=0; i < nb_var; i++) {
        if (strcmp(name, table_var[i].name) == 0) {
            if (table_var[i].is_const) {
                printf("impossible d'assigner une valeur à une variable constante\n");
                return;
            }
            afc(table_var[i].addr, val);
        }
    }
}

void decl_assign_const(char* name, int val) {
    decl(name);
    table_var[nb_var - 1].is_const = true;
    afc(table_var[nb_var - 1].addr, val);
}

int get_var(char* name) {
    for (int i=0; i < nb_var; i++)
        if (strcmp(name, table_var[i].name) == 0)
            return table_var[i].val;
    printf("Aucune variable ne possède ce nom");
    return 0;
}

int decl_tmp(int val) {
    if (max_tmp == 0) {
        table_tmp = malloc(100 * sizeof(tmp_int_t));
        max_tmp = 100;
    }
    if (nb_tmp == max_tmp) {
        max_tmp *= 2;
        table_tmp = realloc(table_tmp, max_tmp * sizeof(int));
    }
    table_tmp[nb_tmp].addr = nb_tmp;
    table_tmp[nb_tmp].val = val;
    nb_tmp++;
    printf("%d\n", table_tmp[nb_tmp-1].addr);
    return table_tmp[nb_tmp-1].addr;
}

int create_tmp(int val) {
    int addr = decl("");
    afc(addr, val);
    return addr;
}

void add_var(int a, int b) {
    int addr_a = create_tmp(a);
    int addr_b = create_tmp(b);
    int addr_res = create_tmp(0);
    add(addr_res, addr_a, addr_b);
}