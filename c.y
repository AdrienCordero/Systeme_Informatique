%{
#include <stdlib.h>
#include <stdio.h>
void yyerror(char *s);
%}
%start C
%%
C: ;
%%

void yyerror(char *s) { fprintf(stderr, "%s\n", s); }

int main(void) {
  printf("C\n"); // yydebug=1;
  yyparse();
  return 0;
}
