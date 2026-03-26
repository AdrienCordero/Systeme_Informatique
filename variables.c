#include "variables.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

var_int_t table_var[100];
int nb_var = 0;

void decl(char* name) {
    strcpy(table_var[nb_var].name, name);
    nb_var++;
    printf("nom : %s\n", table_var[nb_var-1].name);
}

void decl_and_assign(char* name, int val) {
    strcpy(table_var[nb_var].name, name);
    table_var[nb_var].val = val;
    nb_var++;
    printf("nom : %s, val : %d\n", table_var[nb_var-1].name, table_var[nb_var-1].val);
}