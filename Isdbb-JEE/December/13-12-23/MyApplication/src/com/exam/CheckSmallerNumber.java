/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.exam;
import java.util.Scanner;
/**
 *
 * @author Student
 */
public class CheckSmallerNumber {
    
    public static void main (String[] args){
        Scanner input = new Scanner(System.in);
        
        System.out.print("Enter Your First Number: ");
        int firstNumber = input.nextInt();
        
        System.out.print("Enter Your Second Number: ");
        int secondNumber = input.nextInt();
        
        System.out.println("Enter Your Third Number: ");
        int thirdNumber = input.nextInt();
        
        
        if(firstNumber > secondNumber && firstNumber > thirdNumber){
            System.out.println(firstNumber + " is the Largest Number");
        }else if(secondNumber > firstNumber && secondNumber > thirdNumber){
            System.out.println(secondNumber + " is the Largest Number");
        }else{
            System.out.println(thirdNumber + " is the Largest Number");
        }
    }
    
}
