%{
#include "y.tab.h"
%}
%option yylineno
%%
[n][0-9]+ {return ID;}
"int" {return INT;}
"begin" {return BEGIN1;}
"if" {return IF;}
"end" {return END1;}
"printf" {return PRINTF1;}
"(" {return BR1;}
")" {return BR2;}
";" {return SC;}
[ ] {return SP;}
[\t] {return TB;}
[a-zA-Z][a-zA-Z0-9]* {return EXPR;}
[0-9]+ {return NUMBER;}
">"|"<"|">="|"<="|"=="|"!=" {return RELOP;}
"\n" {return NL;}
"," {return CM;}
. {return yytext[0];}
%%
int yywrap()
{
return 1;
}


