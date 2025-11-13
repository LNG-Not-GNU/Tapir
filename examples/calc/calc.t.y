%{
function yyerror(s: string): void {
  console.error("Error:", s);
}
%}

%token NUMBER

%left '+' '-'
%left '*' '/'
%right UMINUS

%%

input:
    /* empty */
  | input line
  ;

line:
    '\n'
  | expr '\n'      { console.log("= " + $1); }
  ;

expr:
    NUMBER
  | expr '+' expr  { $$ = $1 + $3; }
  | expr '-' expr  { $$ = $1 - $3; }
  | expr '*' expr  { $$ = $1 * $3; }
  | expr '/' expr  { $$ = $1 / $3; }
  | '-' expr %prec UMINUS { $$ = -$2; }
  | '(' expr ')'   { $$ = $2; }
  ;

%%

function main(): void {
  console.log("Simple calculator (Ctrl+D to exit)");
  yyparse();
}
