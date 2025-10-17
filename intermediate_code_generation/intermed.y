%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
void push();
void pop();
void pop2();
void pop3();
int stack[100];
int top = -1;
%}
%token ID
%left '+' '-'
%left '*' '/'
%right '='
%nonassoc UMINUS
%%
S : ID '=' E { pop(); }
;
E : E '+' T { pop3(); }
| E '-' T { pop3(); }
| T
;
T : T '*' F { pop3(); }
| T '/' F { pop3(); }
| F
;
F : '(' E ')'
| ID { push(); }
| '-' F %prec UMINUS { pop2(); push(); }
;
%%
void push() {
top++;
stack[top] = 1; // placeholder
printf("push\n");
}
void pop() {
if(top >= 0) top--;
printf("pop\n");
}
void pop2() {
if(top >= 1) top -= 2;
printf("pop2\n");
}
void pop3() {
if(top >= 2) top -= 3;
printf("pop3\n");
}
void yyerror(const char *s) {
printf("Error: %s\n", s);
}
int main() {
printf("Enter expression: ");
yyparse();
return 0;
}