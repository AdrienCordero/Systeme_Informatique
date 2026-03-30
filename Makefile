build:
	lex c.l
	yacc -d c.y
	gcc asm.c variables.c y.tab.c lex.yy.c -o c

run:
	cat test.c | ./c