%{
int vow_count=0;
int const_count=0;
%}
%%
[aeiouAEIOU] {vow_count++;}
[a-zA-Z] {const_count++;}
%%
int yywrap() {}
int main()
{
printf("enter sentence: ");
yylex();
printf("number of vowels %d\n", vow_count);
printf("number of consonents %d\n", const_count);
return 0;
}




