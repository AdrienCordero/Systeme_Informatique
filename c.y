%{
#include <stdlib.h>
#include <stdio.h>
#include "variables.h"
#include "asm.h"

extern FILE *yyin;
void yyerror(char *s);

%}

%union { int nb; char var[64]; }
%token tMAIN tPRINT tINT tCONST tEG tFI tADD tSUB tMUL tDIV tPO tPF tACCO tACCF tVIRG tAND tEQUAL tELSE
%token <nb> tIF tWHILE
%token <var> tNAME
%token <nb> tNB

%left tADD tSUB
%left tMUL tDIV

%type <nb> Terme
%type <nb> Condition
%type <nb> Verification
%type <nb> ConditionHead

%start Main

%%

Main: 
    { 
        yyin = fopen("test.c", "r");
        if(!yyin) {
            printf("Erreur : Impossible d'ouvrir test.c\n");
            exit(1);
        }
        asm_create_file(); 
    } 
    tMAIN tPO tPF Bloc 
    { 
        //print_var_addr();
        generate_asm(); 
        asm_close_file(); 
        printf("Compilation terminée avec succès.\n");
    }


Bloc:
    tACCO Instructions tACCF 
    | tACCO tACCF

/* Permet d'avoir 0, 1 ou plusieurs instructions (Récursivité gauche) */
Instructions:
    Instructions Instruction
    | Instruction

Instruction:
    Variable
    | Condition
    | Boucle
    | Print
    | Bloc

Print: 
    tPRINT tPO Terme tPF tFI { printf("Runtime Print: %d\n", $3); }

ConditionHead:
    tIF tPO Verification tPF
    {
        $$ = if_code($3);
    }

Condition:
    ConditionHead Bloc
    {
        patch($1, get_num_instruction());
    }
    | ConditionHead Bloc
    {
        int jmp_idx = jump_code();
        patch($1, get_num_instruction());
        $<nb>$ = jmp_idx;
    }
    tELSE Bloc
    {
        patch($<nb>3, get_num_instruction());
    }

Boucle:
    tWHILE
    { $1 = get_num_instruction(); }
    tPO Verification tPF
    { $<nb>$ = if_code($4); }
    Bloc
    {
        asm_jmp($1);
        patch($<nb>6, get_num_instruction());
    }

Verification:
    Terme tEQUAL Terme { $$ = verify($1, $3); } 

Variable:
    tINT Name_var tFI
    | tINT tNAME tEG Terme tFI { decl($2, 0); assign($2, $4); }
    | tCONST tINT tNAME tEG Terme tFI { decl_assign_const($3, $5); }
    | tNAME tEG Terme tFI { assign($1, $3); }
    | tINT tMUL Name_pointer tFI
    | tINT tMUL tNAME tEG tAND tNAME tFI { decl($3, 1); assign($3, get_var($6)); }

Name_var:
    tNAME { decl($1, 0); }
    | tNAME tVIRG { decl($1, 0); } Name_var

Name_pointer:
    tNAME { decl($1, 1); }
    | tNAME tVIRG { decl($1, 1); } Name_pointer

Terme: 
    tNB { $$ = create_tmp($1); }
    | Terme tADD Terme { $$ = op_var(OP_ADD, $1, $3); }
    | Terme tSUB Terme { $$ = op_var(OP_SUB, $1, $3); }
    | Terme tMUL Terme { $$ = op_var(OP_MUL, $1, $3); }
    | Terme tDIV Terme { $$ = op_var(OP_DIV, $1, $3); }
    | tPO Terme tPF { $$ = $2; }
    | tMUL tNAME { $$ = get_value_pointer($2); }
    | tNAME { $$ = get_var($1); }

%%

void yyerror(char *s) { fprintf(stderr, "Erreur syntaxique : %s\n", s); }

int main(void) {
    return yyparse();
}