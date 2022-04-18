%{
#include<stdio.h>
#include<stdlib.h>
extern FILE *yyin;
extern int yylineno;
%}
%token INT ID EXPR PRINTF1 BEGIN1 END1 NL RELOP IF NUMBER SC SP CM BR1 BR2 TB
%%
stmt:type SP EXPR BR1 BR2 NL BEGIN1 NL decl NL if_stat NL END1 NL
;
val:val SP CM SP ID|val CM ID|ID
;
decl:SP type SP val SC
;
type:INT
;
if_stat:TB IF BR1 cond BR2 NL TB BEGIN1 NL TB PRINTF1 BR1 ID BR2 SC NL TB END1 NL TB IF BR1 cond BR2 NL TB BEGIN1 NL TB TB PRINTF1 BR1 ID BR2 SC NL TB END1 NL TB IF BR1 cond BR2 NL TB BEGIN1 NL TB PRINTF1 BR1 ID BR2 SC NL TB END1 
;
Y:EXPR|NUMBER
;
cond:Y SP EXPR SP Y
; 
%%
int yyerror(char *c)
{
printf("not valid\n");
printf("%d:%s\n",yylineno-1,c);
exit(0);
}

int main(int argc,char *argv[])
{
if(argc!=2)
{
printf("Please pass 2 arguments\n");
return 1;
}
else
{
yyin=fopen(argv[1],"r");
yyparse();
printf("COMPILATION SUCCESSFUL\n");
}

return 0;
}


