
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
    
    private void imprimir(String descricao, String lexema){
	
		System.out.println(lexema + "-" + descricao);
	}
%}

CAR = [a-zA-Z]
dig = [0-9]
IDN    = {CAR} ({CAR} | {dig})*
FLOAT = {dig}+ "." {dig}* | {dig}* "." {dig}+
NUM = 0|[1-9][dig]*
LPA = "("
RPAR = ")"
LCO = "["
RCO = "]"
OARS = [+|-|/|*]
ATR = "="
STR = \~{IDN}+\~
BRANCO = [\n||\t|\r]
BOO = [true|false]


%%

if         	{ return token(Token.T.IF); }
{IDN}       { return token(Token.T.ID, yytext()); }
{FLOAT}    	{ return token(Token.T.FLOAT, new Double(yytext())); }
{NUM}      	{ return token(Token.T.NUM, new Integer(yytext())); }
{STR}    	{ return token(Token.T.STR, new Double(yytext())); }
{BRANCO}	{ return token(Token.T.BRANCO, yytext()); }
{LPA}		{ return token(Token.T.LPA, yytext());}
{RPAR}		{ return token(Token.T.RPAR, yytext());}
{LCO}		{ return token(Token.T.LCO, yytext());}
{RCO}		{ return token(Token.T.RCO, yytext());}
{OARS}		{ return token(Token.T.OARS, yytext());}
{ATR}		{ return token(Token.T.ATR, yytext());}
{BOO}		{ return token(Token.T.BOO, yytext());}
{CAR}		{ return token(Token.T.CAR, yytext());}

[ \t\n\r]+ { /* não faz nada*/ }
<<EOF>>    { return token(Token.T.EOF); }
.          { System.out.printf("erro: token desconhecido|%s|\n",
                               yytext());
           }