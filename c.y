%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
void yyerror(char *s);
//var est une mémoire qui contient la valeur
char* var[100];
typedef struct {
  char name[64];
  int val;  
} var_int_t;
var_int_t table_var[100];
int nb_var = 0;
int val;
%}

%union { int nb; char var[64]; }
%union { int nb1; int val; }
%token tMAIN tVAL tINT tEG tFI tADD tSUB tMUL tDIV tPO tPF tACCO tACCF
%token <var> tNAME
%token <nb> tNB
%type <nb> Terme Add Sub Mul Div
%start C
%%

C: Function | Function C
  | Instruction | Instruction C

Function: tINT tNAME tPO tPF Bloc { printf("function %s\n", $2); }
  | tINT tNAME tPO tPF { printf("function %s\n", $2); }

Instruction: Decl
  | Decl Instruction
  | Bloc;

Bloc: tACCO Instruction tACCF;


// Déclaration des valeurs
Decl : tINT tNAME tFI {
        strcpy(table_var[nb_var].name, $2);
        nb_var++;
        printf("nom : %s\n", table_var[nb_var-1].name);
      }
      | tINT tNAME tEG Terme tFI {
        strcpy(table_var[nb_var].name, $2);
        table_var[nb_var].val = $4;
        nb_var++;
        printf("nom : %s, val : %d\n", table_var[nb_var-1].name, table_var[nb_var-1].val);
      }

//  Calcul 
Terme : tNB { $$ = $1; }
      | Add { $$ = $1; }
      | Sub { $$ = $1; }
      | Mul { $$ = $1; }
      | Div { $$ = $1; }
      | tPO Terme tPF { $$ = $2; }

Add: Terme tADD Terme { $$ = $1 + $3; }
Sub : Terme tSUB Terme { $$ = $1 - $3; }
Mul : Terme tMUL Terme { $$ = $1 * $3; }
Div : Terme tDIV Terme { $$ = $1 / $3; }

%%

void yyerror(char *s) { fprintf(stderr, "%s\n", s); }

int main(void) {
  printf("C\n"); // yydebug=1;
  yyparse();
  return 0;
}
