build:
	lex c.l & yacc -d c.y & gcc variables.c y.tab.c lex.yy.c -o c

run:
	cat test.c | ./c