package al;

import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;

public class Test3 {
   public static void main(String[] args) {
      try {
//    	  String expr = "if (i=0; i<=5; i++)"
//					+ "else 2 + 3+a*5/4-16 then";
//         Reader input =
//            args.length > 0 ?
//               new FileReader(args[0]) :
//               new InputStreamReader(System.in);
//         Lexer3 scanner = new Lexer3(input);
         Lexer3 scanner = new Lexer3(new FileReader("cod.txt"));
         Token token;
         do {
            token = scanner.yylex();
            System.out.println(token);
//            System.out.println("AQ");
         }
         while (token.type != Token.T.EOF);
      } catch (IOException e) {
         System.err.println(e);
      }
   }
}
