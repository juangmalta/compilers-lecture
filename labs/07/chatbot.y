%{
#include <stdio.h>
#include <time.h>

void yyerror(const char *s);
int yylex(void);
%}

%token HELLO GOODBYE TIME QUERY WEATHER MOOD NAME

%%

chatbot : greeting
    | farewell
    | query
    | weather
    | mood
    | name
    ;

greeting : HELLO { printf("Chatbot: Hello! How can I help you today?\n"); }
     ;

farewell : GOODBYE { printf("Chatbot: Goodbye! Have a great day!\n"); }
     ;

query : TIME { 
        time_t now = time(NULL);
        struct tm *local = localtime(&now);
        printf("Chatbot: The current time is %02d:%02d.\n", local->tm_hour, local->tm_min);
     }
       ;

weather : WEATHER { printf("Chatbot: The weather is sunny today.\n"); }
    ;

mood : MOOD { printf("Chatbot: I'm feeling great today!\n"); }
     ;

name : NAME { printf("Chatbot: My name is Chatbot.\n"); }
     ;

%%

int main() {
    printf("Chatbot: Hi! You can greet me, ask for the time, or say goodbye.\n");
    while (yyparse() == 0) {
    // Loop until end of input
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Chatbot: I didn't understand that.\n");
}