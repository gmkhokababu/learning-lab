package file;

import java.io.*;
import java.util.Scanner;


public class create {

    public static void main(String[] args) {
        Scanner userInput = new Scanner(System.in);
        
        System.out.println("Enter your full name : ");
        String fullName = userInput.nextLine();

        String location = "C:\\Users\\Student\\Desktop\\Details";
        String location1 = location + "\\userDetails.txt";
        File file = new File(location);

        try {
            Boolean check = file.mkdir();
            System.out.println(check);
            
            PrintWriter pw = new PrintWriter(file);

            
            pw.write(fullName);
            pw.flush();
            pw.close();
            

        } catch (Exception e) {
            System.out.println("error");
        }

    }
}
