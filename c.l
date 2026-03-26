%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}

%option noyywrap

%%

"main" { return tMAIN; }
"const " { return tCONST; }
"int " { return tINT; }
"print" {printf("tnirp");}
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
" " {}
";" { return tFI; }

[\t] {}
"," {printf(",");}
[\n] {printf("\n");}


%%