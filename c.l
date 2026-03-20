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

"+" {printf("+");}
"-" {printf("-");}
"*" {printf("*");}
"/" {printf("/");}
"=" { return tEG;}
"(" {printf("(");}
")" {printf(")");}
" " {printf(" ");}
";" { return tFI;}

[\t] {printf("tab");}
"," {printf(",");}
[\n] {printf("\n");}


%%