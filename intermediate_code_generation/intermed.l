%{
#include "y.tab.h"
%}
%%
[0-9]+ { return ID; }
[a-zA-Z]+ { return ID; }
[ \t\n] ;
. { return yytext[0]; }
%%