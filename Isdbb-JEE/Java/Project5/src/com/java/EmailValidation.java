
package com.java;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.util.Scanner;

public class EmailValidation {
    public static void main(String[] args){
        String y="^[a-z0-9]+\\@[a-z]+\\.[a-z]{2,3}$";
        Pattern p=Pattern.compile(y);
        
        Scanner a=new Scanner(System.in);
        System.out.println("Input email");
        String x=a.next();
        Matcher m=p.matcher(x);
        Boolean b=m.matches();
        if(b==true){
        System.out.println("Valid");
        }else{
            System.out.println("Invalid");
        }
    }
}
