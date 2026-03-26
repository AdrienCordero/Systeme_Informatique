%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}

%option noyywrap

%%

"main" { return tMAIN; }
"const" { printf("tsnoc"); }
"int" { return tINT; }
"print" {printf("tnirp");} // TODO
[0-9]+	{
	  yylval.nb = atoi(yytext);
	  return tNB;}
[a-z]+ {  strcpy(yylval.var, yytext); 
        return tNAME; }

"+" { return tADD; }
"-" { return tSUB; }
"*" { return tMUL; }
"/" { return tDIV; }
"=" { return tEG; }
"(" { return tPO; }
")" { return tPF; }
"{" { return tACCO; }
"}" { return tACCF; }
" " {printf(" ");}
";" { return tFI; }

[\t] {printf("tab");}
"," {printf(",");}
[\n] {printf("\n");}


%%