
package com.exam;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EmailValidation {
    public static void main(String[] args) {
        Scanner userInput = new Scanner(System.in);
        String format = "^[a-zA-Z0-9]+@[a-z]+.[a-z]{2,3}$";
        
        System.out.println("Enter your mail : ");
        String email = userInput.nextLine();
        Pattern p = Pattern.compile(format);
        Matcher m = p.matcher(email);
        
        if(m.matches()){
            System.out.println("Valid");
        }else{
            System.out.println("Not Valid");
        }
        
    }
}
