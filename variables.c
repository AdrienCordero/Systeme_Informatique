#include "variables.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

var_int_t table_var[100];
int nb_var = 0;

void decl(char* name) {
    for (int i=0; i < nb_var; i++) {
        if (strcmp(name, table_var[i].name) == 0) {
            printf("La variable existe déjà\n");
            return;
        }
    }
    strcpy(table_var[nb_var].name, name);
    table_var[nb_var].is_const = false;
    nb_var++;
    printf("nom : %s\n", table_var[nb_var-1].name);
}

void decl_and_assign(char* name, int val, bool is_const) {
    for (int i=0; i < nb_var; i++) {
        if (strcmp(name, table_var[i].name) == 0) {
            printf("La variable existe déjà\n");
            return;
        }
    }
    strcpy(table_var[nb_var].name, name);
    table_var[nb_var].val = val;
    table_var[nb_var].is_const = is_const;
    nb_var++;
    printf("nom : %s, val : %d, const: %d\n", table_var[nb_var-1].name, table_var[nb_var-1].val, table_var[nb_var-1].is_const);
}

void assign(char* name, int val) {
    for (int i=0; i < nb_var; i++)
        if (strcmp(name, table_var[i].name) == 0 && !table_var[i].is_const)
            table_var[i].val = val;
}

int get_var(char* name) {
    for (int i=0; i < nb_var; i++)
        if (strcmp(name, table_var[i].name) == 0)
            return table_var[i].val;
    printf("Aucune variable ne possède ce nom");
    return 0;
}