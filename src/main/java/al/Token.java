package al;

import java.util.Formatter;

public class Token {
   public enum T {PRS, IDN, FLOAT, STR, EOF, LPA, RPAR, LCO, RCO, OARS, ATR, BRANCO, BOO, CAR, NUM, PTN, COM, NIN}

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
      out.format("(LINHA:%3d, COLUNA:%3d) %s", line, col, type);
      if (valor != null)
         out.format("[%s]\n", valor);
      return out.toString();
   }
}
