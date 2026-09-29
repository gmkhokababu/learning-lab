
package com.exam;
import java.util.Scanner;

public class Square {
    public static void main(String[] args){
        Scanner inputNumber = new Scanner(System.in);
        
        System.out.println("Enter your number : ");
        int numberForSquare = inputNumber.nextInt();
        
        System.out.println("The square of " + numberForSquare + " is " + numberForSquare*numberForSquare);
    }
}
