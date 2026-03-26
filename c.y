%{
#include <stdlib.h>
#include <stdio.h>
#include "variables.h"

void yyerror(char *s);

char* var[100];
int val;
%}

%union { int nb; char var[64]; }
%union { int nb1; int val; }
%token tMAIN tVAL tINT tCONST tEG tFI tADD tSUB tMUL tDIV tPO tPF tACCO tACCF
%token <var> tNAME
%token <nb> tNB
%type <nb> Terme Add Sub Mul Div
%start C
%%

C: Function | Function C
  | Instruction | Instruction C

Function: tINT tNAME tPO tPF Bloc { printf("function %s\n", $2); }
  | tINT tNAME tPO tPF tFI { printf("function %s\n", $2); }

Instruction:
    Variable
  | Variable Instruction
  | Bloc;

Bloc: tACCO Instruction tACCF;

// Déclaration des valeurs
Variable : tINT tNAME tFI { decl($2); }
      | tINT tNAME tEG Terme tFI { decl_and_assign($2, $4); }
      | tCONST tINT tNAME tEG Terme tFI { decl_and_assign_const($3, $5); }
      | tINT tCONST tNAME tEG Terme tFI { decl_and_assign_const($3, $5); }

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
  // yydebug=1;
  yyparse();
  return 0;
}
