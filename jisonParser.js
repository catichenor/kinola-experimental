"/[hH]" HOLD
"/[pP]" PUSH
"/[rR]" RELEASE
"[0-9]{2,3}" ASCIICODE
"\-1" ALL
"[A-Za-z0-9\-_\.\~]" UNRESERVED
"." OTHERCHAR

/* description: Parses end executes mathematical expressions. */

/* lexical grammar */
%lex

%%
\s+                   /* skip whitespace */
"/[hHpPrR]"               return 'ACTION';
"[0-9]{2,3}"          return 'ASCIICODE';
"\-1"                 return 'ALL';
"[A-Za-z0-9\-_\.\~]"  return 'UNRESERVED';
"."                   return 'OTHERCHAR';
<<EOF>>               return 'EOF';

/lex

%start expressions

%% /* language grammar */

expressions
    : e EOF
        {print($1); return $1;}
    ;

e
    : 'ACTION'
        {$$ = yytext.toLowerCase();}
    | 'OTHERCHAR'
        {$$ = yytext.charCodeAt(0);}
    ;
