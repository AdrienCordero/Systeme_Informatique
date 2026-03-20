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
} int_val_t;
int_val_t table_var[100];
int nb_var = 0;
int val;
%}

%union { int nb; char var[64]; }
%union { int nb1; int val; }
%token tMAIN tVAL tINT tEG tFI tPLUS
%token <var> tNAME
%token <val> tNB
%type <val> Addit
%start C
%%
C: Decl | Decl C;
//Déclaration des valeurs
Decl : tINT tNAME tFI {
        strcpy(table_var[nb_var].name, $2);
        nb_var++;
        printf("nom : %s\n", table_var[nb_var-1].name);
      }
      | tINT tNAME tEG tNB tFI {
        strcpy(table_var[nb_var].name, $2);
        table_var[nb_var].val = $4;
        nb_var++;
        printf("nom : %s, val : %d\n", table_var[nb_var-1].name, table_var[nb_var-1].val);
      }
Addit: tNAME tPLUS tNAME tFI {$$ = $1 + $2;}

/*Int : tINT { printf("integer"); };
INT : tINT { printf("nom variable :%s\n", var[$1]); };*/
%%

void yyerror(char *s) { fprintf(stderr, "%s\n", s); }

int main(void) {
  printf("C\n"); // yydebug=1;
  yyparse();
  return 0;
}
