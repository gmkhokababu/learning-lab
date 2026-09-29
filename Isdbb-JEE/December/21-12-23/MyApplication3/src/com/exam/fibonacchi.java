package com.exam;

import java.util.Scanner;

public class fibonacchi {
    public static void main(String[] args) {
        Scanner inputNumber = new Scanner(System.in);
        int firstNumber = 0;
        int secondNumber = 1;
        
        System.out.println("Enter a number to see Fibonacci: ");
        int n = inputNumber.nextInt();
        
        System.out.println("Fibonacci Series upto" + n + ":");
        
        while(firstNumber < n){
            System.out.print(firstNumber + ",");
            
            int nextNumber = firstNumber + secondNumber;
            firstNumber = secondNumber;
            secondNumber =  nextNumber;
        }
        
        
    }
}
