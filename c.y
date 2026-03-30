%{
#include <stdlib.h>
#include <stdio.h>
#include "variables.h"
#include "asm.h"

void yyerror(char *s);

char* var[100];
int val;
%}

%union { int nb; char var[64]; }
%token tMAIN tPRINT tVAL tINT tCONST tEG tFI tADD tSUB tMUL tDIV tPO tPF tACCO tACCF
%token <var> tNAME
%token <nb> tNB
%left tADD tSUB
%left tMUL tDIV
%type <nb> Terme Add Sub Mul Div
%start Main
%%

Main: { create_file(); } tMAIN tPO tPF Bloc { close_file(); }

Print : tPRINT tPO Terme tPF tFI { printf("%d\n", $3); }

C:
    Instruction
  | Instruction C
  | Print
  | Print C

Instruction:
    Variable
  | Variable C
  | Bloc

Bloc: tACCO Instruction tACCF

// Déclaration des valeurs
Variable : tINT tNAME tFI { decl($2); }
      | tINT tNAME tEG Terme tFI { decl($2); assign($2, $4); }
      | tCONST tINT tNAME tEG Terme tFI { decl_assign_const($3, $5); }
      | tINT tCONST tNAME tEG Terme tFI { decl_assign_const($3, $5); }
      | tNAME tEG Terme tFI { assign($1, $3); }

//  Calcul
Terme : tNB { $$ = $1; }
      | Mul { $$ = $1; }
      | Div { $$ = $1; }
      | Add { $$ = $1; }
      | Sub { $$ = $1; }
      | tPO Terme tPF { $$ = $2; }
      | tNAME { $$ = get_var($1); }

//Add: Terme tADD Terme { $$ = $1 + $3; }
Add : Terme tADD Terme { add_var($1, $3); }
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
