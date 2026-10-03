
package com.exam;
    import java.util.Scanner;

public class Ques_1_Max {
    public static void main(String[] args){
        Scanner inputNumber = new Scanner(System.in);
        
        System.out.println("Enter Your Number");
        int firstNumber = inputNumber.nextInt();
        
        System.out.println("Enter Your Number");
        int secondNumber = inputNumber.nextInt();
        
        System.out.println("Enter Your Number");
        int thirdNumber = inputNumber.nextInt();
        
        if(firstNumber > secondNumber && firstNumber > thirdNumber){
            System.out.println( firstNumber + " Is the largest Number" );
        }else if(secondNumber > firstNumber && secondNumber > thirdNumber){
            System.out.println( secondNumber + " Is the largest Number" );
        }else{
             System.out.println( thirdNumber + " Is the largest Number" );
        }
    }
}
