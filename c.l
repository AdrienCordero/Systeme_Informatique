%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap

%%

"main" { printf("main 2");}
"const" { printf("const 2");}
"int" {printf("int 2");}
"+" {printf("+ 2");}
"-" {printf("- 2");}
"*" {printf("* 2");}
"/" {printf("/ 2");}
"=" {printf("= 2");}
