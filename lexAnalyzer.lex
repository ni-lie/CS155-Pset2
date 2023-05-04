%option noyywrap
%{
#include<stdio.h>
#include<stdlib.h>
int lineno = 0;
void ret_print(char *token_type);
void yyerror(char *message);
%}

KEYWORD         ("exit"|"go to"|"if"|"then"|"else"|"case"|"endcase"|"while"|"do"|"endwhile"|"repeat"|"until"|"loop"|"forever"|"for"|"endfor"|"input"|"output"|"array"|"node"|"call"|"return"|"stop"|"end"|"procedure"|"exit")
IDENTIFIER      [a-zA-z]+[0-9,a-z,A-z]*
LITERAL_str     '{1}[a-zA-z]+'{1}
LITERAL_int     [0-9]+
LITERAL_bool    ("true"|"false")
SEPARATOR       (","|":"|";"|"|")
OPERATOR        ("+"|"-"|"/"|"*"|"^"|"and"|"or"|"not"|"<"|"<="|"=="|"="|"!="|">"|">=")



%%
{KEYWORD}            { ret_print("KEYWORD"); }
{LITERAL_bool}        { ret_print("LITERAL_bool"); }
{IDENTIFIER}         { ret_print("IDENTIFIER"); }
{OPERATOR}          { ret_print("OPERATOR"); }
{SEPARATOR}          { ret_print("SEPARATOR"); }
{LITERAL_str}         { ret_print("LITERAL_str"); }
{LITERAL_int}        { ret_print("LITERAL_int"); }

[ \t\r\f]+  /* eat up whitespace */
.           { yyerror("Unrecognized character"); }
%%

void ret_print(char *token_type){
    printf("<%s, %s>\n", token_type, yytext);
}

void yyerror(char *message){
	printf("Error: \"%s\" in line %d. Token %s\n", message, lineno, yytext);
	exit(1);
}

int main(int argc, char* argv[])
{
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
	return 0;
}
