build:
	lex c.l
	yacc -d c.y
	gcc asm.c variables.c y.tab.c lex.yy.c -o c

debug:
	lex c.l
	yacc -d c.y
	gdb asm.c variables.c y.tab.c lex.yy.c

run:
	cat test.c | ./c