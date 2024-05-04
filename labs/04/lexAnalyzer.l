%{
#include <stdio.h>
%}
%option noyywrap

%%

"//"[[:space:]]*[^\n]*     { printf("COMMENT\n"); }
"float"   { printf("float "); }
"int"   { printf("int "); }
"print("   { printf("print "); }
[a-zA-Z][a-zA-Z0-9]* { printf("id "); }
"="       { printf("assign "); }
[0-9]+(\.[0-9]+)? { printf("inum "); }
[+\-*/]   { printf("op "); }
\n        { printf("\n"); }

.         { /* Ignore other characters */ }

%%

int main(int argc, char** argv) {
    yylex();
    return 0;
}
