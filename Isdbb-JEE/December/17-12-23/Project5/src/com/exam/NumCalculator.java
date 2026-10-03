
package com.exam;
import java.util.Scanner;


public class NumCalculator {
    public static void main(String[] args){
        Scanner inputNumber = new Scanner(System.in);
        
        System.out.println("Enter your first number: ");
        int firstNumber = inputNumber.nextInt();
        
        System.out.println("Enter your second number: ");
        int secondNumber = inputNumber.nextInt();
        
        int sum = firstNumber + secondNumber;
        int sub = firstNumber - secondNumber;
        int multi = firstNumber * secondNumber;
        int devide = firstNumber / secondNumber;
        
        System.out.println("The summation of two numbers is : " + sum);
        System.out.println("The substruction of two numbers is : " + sub);
        System.out.println("The multiplication of two numbers is : " + multi);
        System.out.println("The division of two numbers is : " + devide);
        
    }
}
