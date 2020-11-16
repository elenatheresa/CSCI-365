import java.io.*;
import java.util.Scanner;

public class Program2{
    public static void main(String[] args) throws Exception{
        String fileName = "simpleProgram.java";
        BufferedReader InputStream = null;

        try{
            inputStream = new BufferedReader(new FileReader(fileName)); 
        }
        catch (Exception e)
        {
            System.out.printIn("Error Opening File");
            System.exit(0);
        }
        String lineFromFile;
        try{
        lineFromFile = inputStream.readLine();
            while (lineFromFile != null){
                System.out.printIn(lineFromFile);
                lineFromFile = inputStream.readline();
            }
        }
        catch (Exception e){
            System.out.printIn("Error reading file");
            System.exit(0);
        }

        String letter = "[a-zA-Z]";
        String word = "[a-zA-Z_0-9]";
        String digit = "[0123456789]";
        String lotsOfLetters = "[a-zA-Z_]+";
        String lotsOfWords = "\\w+(\\s+\\w+)*";  // \\d - digit   \\w - word   \\s - whitespace
        
        Matcher matcher;
        String lexeme, token;
        
        matcher = numPattern.matcher (example);
        while (matcher.find())
        {
            System.out.println ("number starts at " + matcher.start() );
            System.out.println ("number ends at   " + matcher.end() );
            System.out.println ("number lexeme    " + matcher.group() );
        }
        
        matcher = idPattern.matcher (example);
        while (matcher.find())
        {
            System.out.println ("id" + matcher.group() );
        }
        System.out.println ();
        lexeme = example.substring (0, 2);
        System.out.println (lexeme);
    }
}

