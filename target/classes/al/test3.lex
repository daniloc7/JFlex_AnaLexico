
%%

%class Lexer3
%type Token
%line
%column

%{
    private Token token(Token.T type) {
    	return new Token(type, yyline, yycolumn);
    }

    private Token token(Token.T type, Object val) {
    	return new Token(type, val, yyline, yycolumn);
    }
    
%}

CAR = [a-zA-Z]
dig = [0-9]
BOO = "true"|"false"
PRS = "if"|"then"|"local"|"print"|"function"|"do"|"for"|"in"|"nil"|"const"|"end"|"check"|"assert"|"return"|"while"|"var"|"exp"|"else"|"repeat"|"until"|"break"|"resume"
FLOAT = {dig}+ "." {dig}* | {dig}* "." {dig}+
NUM = 0|[1-9][dig]*
LPA = "("
RPAR = ")"
LCO = "["
RCO = "]"
PTN = ";"|":"|","|"."
OARS = "+"|"-"|"/"|"*"|"%"|"#"|"<"|">"|"=="|"~="|"<="|">="|"or"|"and"|"not"|"unary"
ATR = "="|"::="
IDN	= {CAR} ({CAR} | {dig} | _)*
STR = \~{IDN}+\~
BRANCO = [\n||\t|\r]
COM = "--"

%%

{PRS}		{ return token(Token.T.PRS, yytext()); }
{PTN}		{ return token(Token.T.PTN, yytext()); }
{COM}		{ return token(Token.T.COM, yytext()); }
{FLOAT}    	{ return token(Token.T.FLOAT, new Double(yytext())); }
{NUM}      	{ return token(Token.T.NUM, new Integer(yytext())); }
{BRANCO}	{ return token(Token.T.BRANCO, yytext()); }
{LPA}		{ return token(Token.T.LPA, yytext());}
{RPAR}		{ return token(Token.T.RPAR, yytext());}
{LCO}		{ return token(Token.T.LCO, yytext());}
{RCO}		{ return token(Token.T.RCO, yytext());}
{OARS}		{ return token(Token.T.OARS, yytext());}
{ATR}		{ return token(Token.T.ATR, yytext());}
{BOO}		{ return token(Token.T.BOO, yytext());}
{CAR}		{ return token(Token.T.CAR, yytext());}
{IDN}       { return token(Token.T.IDN, yytext()); }
{STR}    	{ return token(Token.T.STR, new Double(yytext())); }

[ \t\n\r]+ { /* não faz nada*/ }
<<EOF>>    { return token(Token.T.EOF); }
.	   { return token(Token.T.NIN, yytext()); }