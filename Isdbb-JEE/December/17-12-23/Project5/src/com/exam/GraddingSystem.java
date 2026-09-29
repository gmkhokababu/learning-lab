
package com.exam;
import java.util.Scanner;

public class GraddingSystem {
    public static void main(String[] args){
        Scanner inputNumber = new Scanner(System.in);
        
        System.out.println("Enter your Number: ");
        int givenNumber = inputNumber.nextInt();
        
        if(givenNumber >= 80){
            System.out.println("You got A+");
        }else if(givenNumber >= 70){
            System.out.println("You got A");
        }else if(givenNumber >= 60){
            System.out.println("You got A-");
        }else if(givenNumber >= 50){
            System.out.println("You Got B");
        }else if(givenNumber >= 0){
            System.out.println("You failed");
        }else{
            System.out.println("Invalid Number");
        }
    }
}
