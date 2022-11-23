package al;

import java.nio.file.Paths;

public class GeraALex {
	
	public static void main(String[] args) {
		
		String rootPath = Paths.get("").toAbsolutePath().toString();
		String subPath = "/src/main/java/al/";
		
		String file[] = {rootPath + subPath + "test3.lex"};
		
//		System.out.print("AQUI "+rootPath);
		
		jflex.Main.main(file);
		
	}

}
