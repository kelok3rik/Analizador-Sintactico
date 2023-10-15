%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);


%}

%token NUMBER

%%

input:  /* empty */
    | input expr '=' { printf("El resultado es: %d\n", $2); }
    | input "salir" { printf("Saliendo del programa.\n"); exit(0); }
    ;

expr:   expr '+' term { $$ = $1 + $3; }
    | expr '-' term { $$ = $1 - $3; }
    | term { $$ = $1; }
    ;

term:   term '*' factor { $$ = $1 * $3; }
    | term '/' factor { $$ = $1 / $3; }
    | factor { $$ = $1; }
    ;

factor: NUMBER
    | '(' expr ')' { $$ = $2; }
    ;

%%

int main() {
    printf("Iniciando analisis sintactico...\n");
     
        yyparse();

    printf("Analisis sintactico completado.\n");
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error sintactico: %s\n", s);
}

