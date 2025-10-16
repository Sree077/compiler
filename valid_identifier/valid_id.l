%{
#include"y.tab.h"
%}
%%
[a-zA-Z_][a-zA-Z_0-9]* return letter; /*identifiers*/
[0-9] return digit; /*single digit*/
. return yytext[0]; /*return character itself*/
\n return 0; /*end of input*/
%%
int yywrap(){
return 1;
}