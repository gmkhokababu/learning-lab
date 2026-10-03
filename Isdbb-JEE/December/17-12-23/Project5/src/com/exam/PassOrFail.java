
package com.exam;
import java.util.Scanner;

public class PassOrFail {
    public static void main(String[] args){
        Scanner inputNumber = new Scanner(System.in);
        
        System.out.println("Enter your Number: ");
        double subNumber = inputNumber.nextInt();
        
        if(60 <= subNumber && subNumber <= 100){
            System.out.println("You passed in the exam");
        } else if(subNumber < 60 && subNumber > 0 ){
            System.out.println("You failed in the exam");
        }else{
            System.out.println("Invalid Number");
        }
        
        
    }
}
