
package com.exam;
import java.util.Scanner;

public class CalculateStatus {
    public static void main(String[] args){
        Scanner inputNumber = new Scanner(System.in);
        
        System.out.println("Enter your Number");
        int subNum = inputNumber.nextInt();
        
        if(subNum >= 80){
            System.out.println("Excelent");
        }else if(subNum >= 60){
            System.out.println("Very Good");
        }else if(subNum >= 40){
            System.out.println("Good");
        }else if(subNum >= 0){
            System.out.println("Bad");
        }else{
            System.out.println("Invalid number");
        }
        
    }
}
