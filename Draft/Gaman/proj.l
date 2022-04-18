%{
#include "y.tab.h"
%}
%%
"int" {return INT;}
"float" {return FLOAT;}
"char" {return CHAR;}
"void" {return VOID;}
"main" {return MAIN;}
"begin" {return BEG;}
"end" {return END;}
"(" {return OPENP;}
")" {return CLOSEP;}
"return" {return RETURN;}
"while" {return WHILE;}
[a-zA-Z][a-zA-Z0-9]* {return ID;}
[0-9]+ {return NUM;}
[ ] {return SP;}
[;] {return SC;}
[ ]* {return SPS;}
[\t]* {return TAB;}
[\n] {return NL;}
[,] {return CM;}
">="|"<="|"<"|">"|"=="|"!=" {return RELOP;}
[+\-=*/] {return OPER;}
. {return yytext[0];}
%%
int yywrap(){
	return 1;
}
