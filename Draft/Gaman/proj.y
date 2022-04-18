%{
#include<stdio.h>
%}
%token MAIN OPENP CLOSEP BEG END INT VOID CHAR FLOAT ID NUM SC NL SP CM TAB SPS WHILE RELOP OPER RETURN
%%
stmt: type SP MAIN OPENP CLOSEP NL space BEG NL space stmts space RETURN SP vals NL space END {printf("\nValid string\n"); return 1;};
space: SPS space|
       TAB space|
       SP space|;
vals: ID|
      NUM;
stmts: type SP space varlist SC NL stmts|
       while_stmt NL stmts|
       expr SC NL stmts|
       ;
varlist: ID space|
	 expr space|
	 expr space CM|
	 ID space CM;
type: INT|
      VOID|
      FLOAT|
      CHAR;
while_stmt: WHILE OPENP space vals space RELOP space vals space CLOSEP NL space stmts space END SP WHILE;
expr: expr space OPER space expr|
      vals;
%%
int yyerror(char* msg){
	printf("\nInvalid string\n");
	return 0;
}
void main(){
	printf("Enter the string:\n");
	yyparse();
}
