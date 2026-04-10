%{
#include <stdlib.h>
#include <stdio.h>
#include "variables.h"
#include "asm.h"

extern FILE *yyin;
void yyerror(char *s);

char* var[100];
int val;
%}

%union { int nb; char var[64]; }
%token tMAIN tPRINT tVAL tINT tCONST tEG tFI tADD tSUB tMUL tDIV tPO tPF tACCO tACCF tVIRG tAND
%token <var> tNAME
%token <nb> tNB
%left tNAME
%left tADD tSUB
%left tMUL tDIV
%type <nb> Terme
%start Main
%%

Main: { 
  yyin = fopen("test.c", "r");
  if(!yyin) {
      printf("Impossible d'ouvrir test.c\n");
      exit(1);
  }
  asm_create_file(); } tMAIN tPO tPF Bloc { print_var_addr(); asm_close_file(); 
}

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

Bloc:
    tACCO Instruction tACCF
  | tACCO tACCF

// Déclaration des valeurs
Variable:
    tINT Name_var tFI
  | tINT tNAME tEG Terme tFI { decl($2, false); assign($2, $4); }
  | tCONST tINT tNAME tEG Terme tFI { decl_assign_const($3, $5); }
  | tNAME tEG Terme tFI { assign($1, $3); }
  | tINT tMUL Name_pointer tFI
  | tINT tMUL tNAME tEG tAND tNAME tFI { decl($3, true); assign($3, get_var($6)); }

Name_var:
    tNAME { decl($1, false); }
  | tNAME { decl($1, false); } tVIRG Name_var

Name_pointer:
    tNAME { decl($1, true); }
  | tNAME { decl($1, true); } tVIRG Name_var

//  Calcul
Terme : 
    tNB { $$ = create_tmp($1); }
  | Terme tADD Terme { $$ = op_var(OP_ADD, $1, $3); }
  | Terme tSUB Terme { $$ = op_var(OP_SUB, $1, $3); }
  | Terme tMUL Terme { $$ = op_var(OP_MUL, $1, $3); }
  | Terme tDIV Terme { $$ = op_var(OP_DIV, $1, $3); }
  | tPO Terme tPF { $$ = $2; }
  | tMUL tNAME { $$ = get_value_pointer($2); }
  | tNAME { $$ = get_var($1); }

%%

void yyerror(char *s) { fprintf(stderr, "%s\n", s); }

int main(void) {
  // yydebug=1;
  yyparse();
  return 0;
}
