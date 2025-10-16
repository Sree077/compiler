%{
    #include <stdio.h>
    #include <stdlib.h>
    int i;
%}

%%

[a-zA-Z]+ {
    for (i = 0; i <= yyleng - 3; i++){
        if (yytext[i] == 'a' && yytext[i+1] == 'b' && yytext[i+2] == 'c'){
            yytext[i] = 'A';
            yytext[i + 2] = 'B';
            yytext[i + 3] = 'C' ;
        }
    }
    printf("%s", yytext);
}

[\t]+ ;
.* {ECHO;}
\n { printf("%s", yytext); }

%%

int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}