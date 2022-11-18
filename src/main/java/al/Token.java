package al;

import java.util.Formatter;

public class Token {
   public enum T {IF, IDN, FLOAT, STR, EOF, LPA, RPAR, LCO, RCO, OARS, ATR, BRANCO, BOO, CAR, NUM}

   public T type;
   public Object valor;
   public int line;
   public int col;

   public Token(T type, int line, int col) {
      this.type = type;
      this.line = line;
      this.col = col;
   }

   public Token(T type, Object valor, int line, int col) {
      this.type = type;
      this.valor = valor;
      this.line = line;
      this.col = col;
   }

   public String toString() {
      Formatter out = new Formatter();
      out.format("(%4d,%4d) %s", line, col, type);
      if (valor != null)
         out.format(" AQUI [%s]", valor);
      return out.toString();
   }
}
