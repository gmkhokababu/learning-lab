package question5;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class FileRead {
    public static void main(String[] args) throws FileNotFoundException {
        File file  = new File("C:/Users/TRUST/OneDrive/Desktop/myFile/student.txt");

        // for read - bufferedReader, fileReader, 
         Scanner  scanner = new Scanner(file);
        while (scanner.hasNext()) {

            System.out.println(scanner.nextLine());
        }
        scanner.close();

    }
}
