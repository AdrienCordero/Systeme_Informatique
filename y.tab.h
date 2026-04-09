
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     tMAIN = 258,
     tPRINT = 259,
     tVAL = 260,
     tINT = 261,
     tCONST = 262,
     tEG = 263,
     tFI = 264,
     tADD = 265,
     tSUB = 266,
     tMUL = 267,
     tDIV = 268,
     tPO = 269,
     tPF = 270,
     tACCO = 271,
     tACCF = 272,
     tIF = 273,
     tEQUAL = 274,
     tNOTEQUAL = 275,
     tNAME = 276,
     tNB = 277
   };
#endif
/* Tokens.  */
#define tMAIN 258
#define tPRINT 259
#define tVAL 260
#define tINT 261
#define tCONST 262
#define tEG 263
#define tFI 264
#define tADD 265
#define tSUB 266
#define tMUL 267
#define tDIV 268
#define tPO 269
#define tPF 270
#define tACCO 271
#define tACCF 272
#define tIF 273
#define tEQUAL 274
#define tNOTEQUAL 275
#define tNAME 276
#define tNB 277




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 14 "c.y"
 int nb; char var[64]; 


/* Line 1676 of yacc.c  */
#line 100 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


