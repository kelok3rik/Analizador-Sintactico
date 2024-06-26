%{
#include "y.tab.h"

void yyerror(const char *s);
%}

%%

[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[-+\/*()=]      { return *yytext; }
[ \t\n]         ;  // ignorar espacios en blanco y saltos de línea

.               { yyerror("Caracter no valido"); }

%%

int yywrap() {
    return 1;
}

