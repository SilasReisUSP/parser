%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *msg);
%}

%token NUMBER
%token PLUS
%token MINUS
%token MULTIPLY
%token DIVIDE
%token LPAREN
%token RPAREN

%%

expression:  /* vazia */
          | expression PLUS term
          | expression MINUS term
          ;

term:       factor
          | term MULTIPLY factor
          | term DIVIDE factor
          ;

factor:     NUMBER
          | LPAREN expression RPAREN
          ;

%%

int main() {
    yylex();
    yyparse();
    return 0;
}

void yyerror(const char *msg) {
    fprintf(stderr, "Erro: %s\n", msg);
}
