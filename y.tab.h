
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
     tINT = 260,
     tCONST = 261,
     tEG = 262,
     tFI = 263,
     tADD = 264,
     tSUB = 265,
     tMUL = 266,
     tDIV = 267,
     tPO = 268,
     tPF = 269,
     tACCO = 270,
     tACCF = 271,
     tVIRG = 272,
     tAND = 273,
     tEQUAL = 274,
     tELSE = 275,
     tIF = 276,
     tWHILE = 277,
     tNAME = 278,
     tNB = 279
   };
#endif
/* Tokens.  */
#define tMAIN 258
#define tPRINT 259
#define tINT 260
#define tCONST 261
#define tEG 262
#define tFI 263
#define tADD 264
#define tSUB 265
#define tMUL 266
#define tDIV 267
#define tPO 268
#define tPF 269
#define tACCO 270
#define tACCF 271
#define tVIRG 272
#define tAND 273
#define tEQUAL 274
#define tELSE 275
#define tIF 276
#define tWHILE 277
#define tNAME 278
#define tNB 279




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 12 "c.y"
 int nb; char var[64]; 


/* Line 1676 of yacc.c  */
#line 104 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


